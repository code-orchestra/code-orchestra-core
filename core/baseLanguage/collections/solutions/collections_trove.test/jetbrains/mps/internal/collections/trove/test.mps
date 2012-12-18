<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:9470f421-cec1-405a-b0c5-73491b129d8a(jetbrains.mps.internal.collections.trove.test)">
  <persistence version="7" />
  <language namespace="f61473f9-130f-42f6-b98d-6c438812c2f6(jetbrains.mps.baseLanguage.unitTest)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <import index="tp82" modelUID="r:00000000-0000-4000-0000-011c895903ee(jetbrains.mps.internalCollections.test.closures)" version="-1" />
  <import index="y4jj" modelUID="r:9e8bdb89-2777-4a48-887c-0edd1d0b1863(jetbrains.mps.baseLanguage.collections.trove.containers)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="y50y" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang.management(JDK/java.lang.management@java_stub)" version="-1" />
  <import index="fxg7" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.io(JDK/java.io@java_stub)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tp2c" modelUID="r:00000000-0000-4000-0000-011c89590338(jetbrains.mps.baseLanguage.closures.structure)" version="3" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <import index="tpe3" modelUID="r:00000000-0000-4000-0000-011c895902d7(jetbrains.mps.baseLanguage.unitTest.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="8269230326124799045">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="PrimSet" />
    </node>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="5332044122260427020">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="PrimMap" />
    </node>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="2767227637715419112">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="PrimList" />
    </node>
  </roots>
  <root id="8269230326124799045">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8269230326124799046" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="8269230326124799047">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8269230326124799048" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8269230326124799049" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8269230326124799050" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="8269230326124799051">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8269230326124799052">
        <property name="methodName" nameId="tpe3.1171931690128" value="byteSet" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8269230326124799053" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8269230326124799054" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8269230326124799055">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8269230326124799056">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8269230326124799057">
              <property name="name" nameId="tpck.1169194664001" value="bs" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.SetType" typeId="tp2q.1226511727824" id="8269230326124799058">
                <node role="elementType" roleId="tp2q.1226511765987" type="tpee.ByteType" typeId="tpee.1070534604311" id="8269230326124799059" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8269230326124799060">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomContainerCreator" typeId="tp2q.1331913329176106419" id="8269230326124799061">
                  <link role="containerDeclaration" roleId="tp2q.1331913329176106420" targetNodeId="y4jj.9034802358628764709" resolveInfo="byteHashSet" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8269230326124799062">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799063">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799064">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799057" resolveInfo="bs" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddSetElementOperation" typeId="tp2q.1226566855640" id="8269230326124799065">
                <node role="argument" roleId="tp2q.1226567214363" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8269230326124799066">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ByteType" typeId="tpee.1070534604311" id="8269230326124799067" />
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799068">
                    <property name="value" nameId="tpee.1068580320021" value="192" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8269230326124799069">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799070">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799071">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799057" resolveInfo="bs" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddSetElementOperation" typeId="tp2q.1226566855640" id="8269230326124799072">
                <node role="argument" roleId="tp2q.1226567214363" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8269230326124799073">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ByteType" typeId="tpee.1070534604311" id="8269230326124799074" />
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799075">
                    <property name="value" nameId="tpee.1068580320021" value="168" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8269230326124799076">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799077">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799078">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799057" resolveInfo="bs" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddSetElementOperation" typeId="tp2q.1226566855640" id="8269230326124799079">
                <node role="argument" roleId="tp2q.1226567214363" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8269230326124799080">
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799081">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ByteType" typeId="tpee.1070534604311" id="8269230326124799082" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8269230326124799083">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799084">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799085">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799057" resolveInfo="bs" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddSetElementOperation" typeId="tp2q.1226566855640" id="8269230326124799086">
                <node role="argument" roleId="tp2q.1226567214363" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8269230326124799087">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ByteType" typeId="tpee.1070534604311" id="8269230326124799088" />
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799089">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="8269230326124799090">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799091">
              <property name="value" nameId="tpee.1068580320021" value="3" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799092">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799093">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799057" resolveInfo="bs" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="8269230326124799094" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8269230326124799095">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8269230326124799096">
              <node role="creator" roleId="tpee.1145553007750" type="tp2q.HashSetCreator" typeId="tp2q.1226516258405" id="8269230326124799097">
                <node role="elementType" roleId="tp2q.1237721435807" type="tpee.ByteType" typeId="tpee.1070534604311" id="8269230326124799098" />
                <node role="initValue" roleId="tp2q.1237721435808" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8269230326124799099">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ByteType" typeId="tpee.1070534604311" id="8269230326124799100" />
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799101">
                    <property name="value" nameId="tpee.1068580320021" value="192" />
                  </node>
                </node>
                <node role="initValue" roleId="tp2q.1237721435808" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8269230326124799102">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ByteType" typeId="tpee.1070534604311" id="8269230326124799103" />
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799104">
                    <property name="value" nameId="tpee.1068580320021" value="168" />
                  </node>
                </node>
                <node role="initValue" roleId="tp2q.1237721435808" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8269230326124799105">
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799106">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ByteType" typeId="tpee.1070534604311" id="8269230326124799107" />
                </node>
              </node>
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799108">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799057" resolveInfo="bs" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8269230326124799109">
        <property name="methodName" nameId="tpe3.1171931690128" value="doubleSet" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8269230326124799110" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8269230326124799111" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8269230326124799112">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8269230326124799113">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8269230326124799114">
              <property name="name" nameId="tpck.1169194664001" value="ds" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.SetType" typeId="tp2q.1226511727824" id="8269230326124799115">
                <node role="elementType" roleId="tp2q.1226511765987" type="tpee.DoubleType" typeId="tpee.1070534513062" id="8269230326124799116" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8269230326124799117">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomContainerCreator" typeId="tp2q.1331913329176106419" id="8269230326124799118">
                  <link role="containerDeclaration" roleId="tp2q.1331913329176106420" targetNodeId="y4jj.1279588871815200313" resolveInfo="doubleHashSet" />
                  <node role="initValue" roleId="tp2q.1237721435808" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="8269230326124799119">
                    <property name="value" nameId="tpee.1113006610751" value="1.1" />
                  </node>
                  <node role="initValue" roleId="tp2q.1237721435808" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="8269230326124799120">
                    <property name="value" nameId="tpee.1113006610751" value="2.2" />
                  </node>
                  <node role="initValue" roleId="tp2q.1237721435808" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="8269230326124799121">
                    <property name="value" nameId="tpee.1113006610751" value="3.3" />
                  </node>
                  <node role="initValue" roleId="tp2q.1237721435808" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="8269230326124799122">
                    <property name="value" nameId="tpee.1113006610751" value="2.2" />
                  </node>
                  <node role="initValue" roleId="tp2q.1237721435808" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="8269230326124799123">
                    <property name="value" nameId="tpee.1113006610751" value="1.1" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="8269230326124799124">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799125">
              <property name="value" nameId="tpee.1068580320021" value="3" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799126">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799127">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799114" resolveInfo="ds" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="8269230326124799128" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8269230326124799129">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8269230326124799130">
              <node role="creator" roleId="tpee.1145553007750" type="tp2q.HashSetCreator" typeId="tp2q.1226516258405" id="8269230326124799131">
                <node role="elementType" roleId="tp2q.1237721435807" type="tpee.DoubleType" typeId="tpee.1070534513062" id="8269230326124799132" />
                <node role="initValue" roleId="tp2q.1237721435808" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="8269230326124799133">
                  <property name="value" nameId="tpee.1113006610751" value="3.3" />
                </node>
                <node role="initValue" roleId="tp2q.1237721435808" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="8269230326124799134">
                  <property name="value" nameId="tpee.1113006610751" value="2.2" />
                </node>
                <node role="initValue" roleId="tp2q.1237721435808" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="8269230326124799135">
                  <property name="value" nameId="tpee.1113006610751" value="1.1" />
                </node>
              </node>
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799136">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799114" resolveInfo="ds" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8269230326124799137">
        <property name="methodName" nameId="tpe3.1171931690128" value="floatSet" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8269230326124799138" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8269230326124799139" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8269230326124799140">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8269230326124799141">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8269230326124799142">
              <property name="name" nameId="tpck.1169194664001" value="fs" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.SetType" typeId="tp2q.1226511727824" id="8269230326124799143">
                <node role="elementType" roleId="tp2q.1226511765987" type="tpee.FloatType" typeId="tpee.1070534436861" id="8269230326124799144" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8269230326124799145">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomContainerCreator" typeId="tp2q.1331913329176106419" id="8269230326124799146">
                  <link role="containerDeclaration" roleId="tp2q.1331913329176106420" targetNodeId="y4jj.1279588871815200327" resolveInfo="floatHashSet" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8269230326124799147">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8269230326124799148">
              <property name="name" nameId="tpck.1169194664001" value="exp" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.SetType" typeId="tp2q.1226511727824" id="8269230326124799149">
                <node role="elementType" roleId="tp2q.1226511765987" type="tpee.FloatType" typeId="tpee.1070534436861" id="8269230326124799150" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8269230326124799151">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.HashSetCreator" typeId="tp2q.1226516258405" id="8269230326124799152">
                  <node role="elementType" roleId="tp2q.1237721435807" type="tpee.FloatType" typeId="tpee.1070534436861" id="8269230326124799153" />
                  <node role="initValue" roleId="tp2q.1237721435808" type="tpee.FloatingPointFloatConstant" typeId="tpee.5279705229678483897" id="8269230326124799154">
                    <property name="value" nameId="tpee.5279705229678483899" value="5.5f" />
                  </node>
                  <node role="initValue" roleId="tp2q.1237721435808" type="tpee.FloatingPointFloatConstant" typeId="tpee.5279705229678483897" id="8269230326124799155">
                    <property name="value" nameId="tpee.5279705229678483899" value="6.6f" />
                  </node>
                  <node role="initValue" roleId="tp2q.1237721435808" type="tpee.FloatingPointFloatConstant" typeId="tpee.5279705229678483897" id="8269230326124799156">
                    <property name="value" nameId="tpee.5279705229678483899" value="7.7f" />
                  </node>
                  <node role="initValue" roleId="tp2q.1237721435808" type="tpee.FloatingPointFloatConstant" typeId="tpee.5279705229678483897" id="8269230326124799157">
                    <property name="value" nameId="tpee.5279705229678483899" value="8.8f" />
                  </node>
                  <node role="initValue" roleId="tp2q.1237721435808" type="tpee.FloatingPointFloatConstant" typeId="tpee.5279705229678483897" id="8269230326124799158">
                    <property name="value" nameId="tpee.5279705229678483899" value="9.9f" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8269230326124799159">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799160">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799161">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799142" resolveInfo="fs" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddAllSetElementsOperation" typeId="tp2q.1226592602759" id="8269230326124799162">
                <node role="argument" roleId="tp2q.1226592623721" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799163">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799148" resolveInfo="exp" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8269230326124799164">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799165">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799166">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799142" resolveInfo="fs" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddAllSetElementsOperation" typeId="tp2q.1226592602759" id="8269230326124799167">
                <node role="argument" roleId="tp2q.1226592623721" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799168">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799148" resolveInfo="exp" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="8269230326124799169">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799170">
              <property name="value" nameId="tpee.1068580320021" value="5" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799171">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799172">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799142" resolveInfo="fs" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="8269230326124799173" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8269230326124799174">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799175">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799148" resolveInfo="exp" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799176">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799142" resolveInfo="fs" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8269230326124799177">
        <property name="methodName" nameId="tpe3.1171931690128" value="intSet" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8269230326124799178" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8269230326124799179" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8269230326124799180">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8269230326124799181">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8269230326124799182">
              <property name="name" nameId="tpck.1169194664001" value="is" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.SetType" typeId="tp2q.1226511727824" id="8269230326124799183">
                <node role="elementType" roleId="tp2q.1226511765987" type="tpee.IntegerType" typeId="tpee.1070534370425" id="8269230326124799184" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8269230326124799185">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomContainerCreator" typeId="tp2q.1331913329176106419" id="8269230326124799186">
                  <link role="containerDeclaration" roleId="tp2q.1331913329176106420" targetNodeId="y4jj.1279588871815200341" resolveInfo="intHashSet" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8269230326124799187">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799188">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799189">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799182" resolveInfo="is" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddAllSetElementsOperation" typeId="tp2q.1226592602759" id="8269230326124799190">
                <node role="argument" roleId="tp2q.1226592623721" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8269230326124799191">
                  <node role="creator" roleId="tpee.1145553007750" type="tp2q.SequenceCreator" typeId="tp2q.1224414427926" id="8269230326124799192">
                    <node role="elementType" roleId="tp2q.1224414456414" type="tpee.IntegerType" typeId="tpee.1070534370425" id="8269230326124799193" />
                    <node role="initializer" roleId="tp2q.1224414466839" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="8269230326124799194">
                      <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="8269230326124799195">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="8269230326124799196">
                          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8269230326124799197">
                            <property name="name" nameId="tpck.1169194664001" value="i" />
                            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="8269230326124799198" />
                            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799199">
                              <property name="value" nameId="tpee.1068580320021" value="1" />
                            </node>
                          </node>
                          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="8269230326124799200">
                            <node role="statement" roleId="tpee.1068581517665" type="tp2c.YieldStatement" typeId="tp2c.1200830824066" id="8269230326124799201">
                              <node role="expression" roleId="tp2c.1200830928149" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799202">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799197" resolveInfo="i" />
                              </node>
                            </node>
                          </node>
                          <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanOrEqualsExpression" typeId="tpee.1153422305557" id="8269230326124799203">
                            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799204">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799197" resolveInfo="i" />
                            </node>
                            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799205">
                              <property name="value" nameId="tpee.1068580320021" value="10" />
                            </node>
                          </node>
                          <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="8269230326124799206">
                            <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799207">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799197" resolveInfo="i" />
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
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8269230326124799208">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799209">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8269230326124799210">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tp82.1205510239182" resolveInfo="assertIterableEqualsAsSet" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799211">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="8269230326124799212" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8269230326124799213">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tp82.1205754306142" resolveInfo="input10" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799214">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799182" resolveInfo="is" />
                </node>
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="8269230326124799215" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8269230326124799216">
        <property name="methodName" nameId="tpe3.1171931690128" value="longSet" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8269230326124799217" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8269230326124799218" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8269230326124799219">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8269230326124799220">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8269230326124799221">
              <property name="name" nameId="tpck.1169194664001" value="ls" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.SetType" typeId="tp2q.1226511727824" id="8269230326124799222">
                <node role="elementType" roleId="tp2q.1226511765987" type="tpee.LongType" typeId="tpee.1068581242867" id="8269230326124799223" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8269230326124799224">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomContainerCreator" typeId="tp2q.1331913329176106419" id="8269230326124799225">
                  <link role="containerDeclaration" roleId="tp2q.1331913329176106420" targetNodeId="y4jj.1279588871815200356" resolveInfo="longHashSet" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8269230326124799226">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799227">
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.VisitAllOperation" typeId="tp2q.1204980550705" id="8269230326124799228">
                <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="8269230326124799229">
                  <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="8269230326124799230">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8269230326124799231">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799232">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799233">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799221" resolveInfo="ls" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddSetElementOperation" typeId="tp2q.1226566855640" id="8269230326124799234">
                          <node role="argument" roleId="tp2q.1226567214363" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8269230326124799235">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799236" resolveInfo="i" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="8269230326124799236">
                    <property name="name" nameId="tpck.1169194664001" value="i" />
                    <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754489923" />
                  </node>
                </node>
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799238">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8269230326124799239">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="8269230326124799240">
                    <node role="componentType" roleId="tpee.1154542793668" type="tpee.LongType" typeId="tpee.1068581242867" id="8269230326124799241" />
                    <node role="initValue" roleId="tpee.1154542803372" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799242">
                      <property name="value" nameId="tpee.1068580320021" value="5" />
                    </node>
                    <node role="initValue" roleId="tpee.1154542803372" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799243">
                      <property name="value" nameId="tpee.1068580320021" value="4" />
                    </node>
                    <node role="initValue" roleId="tpee.1154542803372" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799244">
                      <property name="value" nameId="tpee.1068580320021" value="3" />
                    </node>
                    <node role="initValue" roleId="tpee.1154542803372" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799245">
                      <property name="value" nameId="tpee.1068580320021" value="2" />
                    </node>
                    <node role="initValue" roleId="tpee.1154542803372" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799246">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                    <node role="initValue" roleId="tpee.1154542803372" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799247">
                      <property name="value" nameId="tpee.1068580320021" value="2" />
                    </node>
                    <node role="initValue" roleId="tpee.1154542803372" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799248">
                      <property name="value" nameId="tpee.1068580320021" value="3" />
                    </node>
                    <node role="initValue" roleId="tpee.1154542803372" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799249">
                      <property name="value" nameId="tpee.1068580320021" value="4" />
                    </node>
                    <node role="initValue" roleId="tpee.1154542803372" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799250">
                      <property name="value" nameId="tpee.1068580320021" value="5" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.AsSequenceOperation" typeId="tp2q.1240325842691" id="8269230326124799251" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8269230326124799252">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799253">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8269230326124799254">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tp82.1205510239182" resolveInfo="assertIterableEqualsAsSet" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799255">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="8269230326124799256" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8269230326124799257">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tp82.1204793778541" resolveInfo="input5" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799258">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799259">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799221" resolveInfo="ls" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.SelectOperation" typeId="tp2q.1202128969694" id="8269230326124799260">
                    <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="8269230326124799261">
                      <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="8269230326124799262">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8269230326124799263">
                          <node role="expression" roleId="tpee.1068580123156" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8269230326124799264">
                            <node role="type" roleId="tpee.1070534934091" type="tpee.IntegerType" typeId="tpee.1070534370425" id="8269230326124799265" />
                            <node role="expression" roleId="tpee.1070534934092" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8269230326124799266">
                              <node role="type" roleId="tpee.1070534934091" type="tpee.LongType" typeId="tpee.1068581242867" id="8269230326124799267" />
                              <node role="expression" roleId="tpee.1070534934092" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8269230326124799268">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799269" resolveInfo="l" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="8269230326124799269">
                        <property name="name" nameId="tpck.1169194664001" value="l" />
                        <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754489917" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="8269230326124799271" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8269230326124799272">
        <property name="methodName" nameId="tpe3.1171931690128" value="shortSet" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8269230326124799273" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8269230326124799274" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8269230326124799275">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8269230326124799276">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8269230326124799277">
              <property name="name" nameId="tpck.1169194664001" value="shs" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.SetType" typeId="tp2q.1226511727824" id="8269230326124799278">
                <node role="elementType" roleId="tp2q.1226511765987" type="tpee.ShortType" typeId="tpee.1070533982221" id="8269230326124799279" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8269230326124799280">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomContainerCreator" typeId="tp2q.1331913329176106419" id="8269230326124799281">
                  <link role="containerDeclaration" roleId="tp2q.1331913329176106420" targetNodeId="y4jj.1279588871815200370" resolveInfo="shortHashSet" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8269230326124799282">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799283">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799284">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799277" resolveInfo="shs" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddSetElementOperation" typeId="tp2q.1226566855640" id="8269230326124799285">
                <node role="argument" roleId="tp2q.1226567214363" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8269230326124799286">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ShortType" typeId="tpee.1070533982221" id="8269230326124799287" />
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799288">
                    <property name="value" nameId="tpee.1068580320021" value="65535" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8269230326124799289">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799290">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799291">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799277" resolveInfo="shs" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddSetElementOperation" typeId="tp2q.1226566855640" id="8269230326124799292">
                <node role="argument" roleId="tp2q.1226567214363" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8269230326124799293">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ShortType" typeId="tpee.1070533982221" id="8269230326124799294" />
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799295">
                    <property name="value" nameId="tpee.1068580320021" value="-1" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="8269230326124799296">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8269230326124799297">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8269230326124799298">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8269230326124799299">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8269230326124799277" resolveInfo="shs" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="8269230326124799300" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8269230326124799301">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="tp82.1204129267857" resolveInfo="Util_Test" />
    </node>
  </root>
  <root id="5332044122260427020">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5332044122260427021" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="5332044122260427022">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5332044122260427023" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5332044122260427024" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5332044122260427025" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="5332044122260427026">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="5332044122260427027">
        <property name="methodName" nameId="tpe3.1171931690128" value="byteByte" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5332044122260427028" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5332044122260427029" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5332044122260427030">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5332044122260427031">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5332044122260427032">
              <property name="name" nameId="tpck.1169194664001" value="mbb" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.MapType" typeId="tp2q.1197683403723" id="5332044122260427033">
                <node role="valueType" roleId="tp2q.1197683475734" type="tpee.ByteType" typeId="tpee.1070534604311" id="5332044122260427037" />
                <node role="keyType" roleId="tp2q.1197683466920" type="tpee.ByteType" typeId="tpee.1070534604311" id="5332044122260427036" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="5332044122260427039">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomMapCreator" typeId="tp2q.1576845966386891367" id="5332044122260427040">
                  <link role="containerDeclaration" roleId="tp2q.1576845966386891370" targetNodeId="y4jj.1279588871815200385" resolveInfo="byteByteHashMap" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5332044122260427043">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="5332044122260427057">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5332044122260427078">
                <node role="type" roleId="tpee.1070534934091" type="tpee.ByteType" typeId="tpee.1070534604311" id="5332044122260427083" />
                <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5332044122260427060">
                  <property name="value" nameId="tpee.1068580320021" value="2" />
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="5332044122260427045">
                <node role="key" roleId="tp2q.1197932525128" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5332044122260427068">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ByteType" typeId="tpee.1070534604311" id="5332044122260427073" />
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5332044122260427050">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                </node>
                <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5332044122260427044">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5332044122260427032" resolveInfo="mbb" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="5332044122260427086">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5332044122260427089">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5332044122260427091">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5332044122260427090">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5332044122260427032" resolveInfo="mbb" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="5332044122260427095" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="5332044122260427097">
        <property name="methodName" nameId="tpe3.1171931690128" value="byteObject" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5332044122260427098" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5332044122260427099" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5332044122260427100">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5332044122260427101">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5332044122260427102">
              <property name="name" nameId="tpck.1169194664001" value="mbo" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.MapType" typeId="tp2q.1197683403723" id="5332044122260427103">
                <node role="keyType" roleId="tp2q.1197683466920" type="tpee.ByteType" typeId="tpee.1070534604311" id="5332044122260427106" />
                <node role="valueType" roleId="tp2q.1197683475734" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3476222717107163178">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6227590151851057351">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomMapCreator" typeId="tp2q.1576845966386891367" id="6227590151851057352">
                  <link role="containerDeclaration" roleId="tp2q.1576845966386891370" targetNodeId="y4jj.6651873253984105358" resolveInfo="byteObjectHashMap" />
                  <node role="valueType" roleId="tp2q.1197687035757" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6227590151851057353">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6227590151851057355">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6227590151851057382">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6227590151851057387" />
              <node role="lValue" roleId="tpee.1068498886295" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="6227590151851057357">
                <node role="key" roleId="tp2q.1197932525128" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6227590151851057368">
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851057375">
                    <property name="value" nameId="tpee.1068580320021" value="255" />
                  </node>
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ByteType" typeId="tpee.1070534604311" id="6227590151851057372" />
                </node>
                <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851057356">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5332044122260427102" resolveInfo="mbo" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="6227590151851057391">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851057392">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6227590151851057393">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851057397">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5332044122260427102" resolveInfo="mbo" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="6227590151851057395" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6227590151851078721">
        <property name="methodName" nameId="tpe3.1171931690128" value="doubleDouble" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6227590151851078722" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6227590151851078723" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6227590151851078724">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6227590151851078726">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6227590151851078727">
              <property name="name" nameId="tpck.1169194664001" value="mdd" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.MapType" typeId="tp2q.1197683403723" id="6227590151851078728">
                <node role="valueType" roleId="tp2q.1197683475734" type="tpee.DoubleType" typeId="tpee.1070534513062" id="6227590151851078732" />
                <node role="keyType" roleId="tp2q.1197683466920" type="tpee.DoubleType" typeId="tpee.1070534513062" id="6227590151851078731" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6227590151851078734">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomMapCreator" typeId="tp2q.1576845966386891367" id="6227590151851078735">
                  <link role="containerDeclaration" roleId="tp2q.1576845966386891370" targetNodeId="y4jj.7602110602933849931" resolveInfo="doubleDoubleHashMap" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6227590151851078737">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6227590151851078738">
              <property name="name" nameId="tpck.1169194664001" value="mdd2" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.MapType" typeId="tp2q.1197683403723" id="6227590151851078739">
                <node role="valueType" roleId="tp2q.1197683475734" type="tpee.DoubleType" typeId="tpee.1070534513062" id="6227590151851078744" />
                <node role="keyType" roleId="tp2q.1197683466920" type="tpee.DoubleType" typeId="tpee.1070534513062" id="6227590151851078743" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6227590151851078746">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomMapCreator" typeId="tp2q.1576845966386891367" id="6227590151851078747">
                  <link role="containerDeclaration" roleId="tp2q.1576845966386891370" targetNodeId="y4jj.7602110602933850459" resolveInfo="ObjectDoubleHashMap" />
                  <node role="keyType" roleId="tp2q.1197687026896" type="tpee.DoubleType" typeId="tpee.1070534513062" id="6227590151851078748" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6227590151851078750">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6227590151851078751">
              <property name="name" nameId="tpck.1169194664001" value="mdd3" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.MapType" typeId="tp2q.1197683403723" id="6227590151851078752">
                <node role="valueType" roleId="tp2q.1197683475734" type="tpee.DoubleType" typeId="tpee.1070534513062" id="6227590151851078756" />
                <node role="keyType" roleId="tp2q.1197683466920" type="tpee.DoubleType" typeId="tpee.1070534513062" id="6227590151851078755" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6227590151851078758">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomMapCreator" typeId="tp2q.1576845966386891367" id="6227590151851078759">
                  <link role="containerDeclaration" roleId="tp2q.1576845966386891370" targetNodeId="y4jj.7602110602933849971" resolveInfo="doubleObjectHashMap" />
                  <node role="valueType" roleId="tp2q.1197687035757" type="tpee.DoubleType" typeId="tpee.1070534513062" id="6227590151851078760" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6227590151851078762">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6227590151851078783">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="6227590151851078791">
                <property name="value" nameId="tpee.1113006610751" value="2.71828" />
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="6227590151851078764">
                <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851078763">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851078727" resolveInfo="mdd" />
                </node>
                <node role="key" roleId="tp2q.1197932525128" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="6227590151851078776">
                  <property name="value" nameId="tpee.1113006610751" value="3.1415" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="6227590151851078795">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851078798">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6227590151851078800">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851078799">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851078727" resolveInfo="mdd" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="6227590151851078804" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6227590151851078807">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6227590151851078818">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851078813">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851078738" resolveInfo="mdd2" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.PutAllOperation" typeId="tp2q.1240906768633" id="6227590151851078822">
                <node role="map" roleId="tp2q.1240906921264" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851078826">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851078727" resolveInfo="mdd" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="6227590151851078830">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851078833">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851078738" resolveInfo="mdd2" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851078834">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851078727" resolveInfo="mdd" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6227590151851078836">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6227590151851078892">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6227590151851078943">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6227590151851078907">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851078906">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851078727" resolveInfo="mdd" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetValuesOperation" typeId="tp2q.1237909114519" id="6227590151851078929" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetFirstOperation" typeId="tp2q.1165525191778" id="6227590151851078957" />
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="6227590151851078838">
                <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851078837">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851078751" resolveInfo="mdd3" />
                </node>
                <node role="key" roleId="tp2q.1197932525128" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6227590151851078863">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6227590151851078844">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851078843">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851078727" resolveInfo="mdd" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetKeysOperation" typeId="tp2q.1201872418428" id="6227590151851078852" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetFirstOperation" typeId="tp2q.1165525191778" id="6227590151851078874" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="6227590151851078967">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851078970">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851078751" resolveInfo="mdd3" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851078971">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851078727" resolveInfo="mdd" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6227590151851173041">
        <property name="methodName" nameId="tpe3.1171931690128" value="floatFloat" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6227590151851173042" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6227590151851173043" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6227590151851173044">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6227590151851173045">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6227590151851173046">
              <property name="name" nameId="tpck.1169194664001" value="mff" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.MapType" typeId="tp2q.1197683403723" id="6227590151851173047">
                <node role="valueType" roleId="tp2q.1197683475734" type="tpee.FloatType" typeId="tpee.1070534436861" id="6227590151851173051" />
                <node role="keyType" roleId="tp2q.1197683466920" type="tpee.FloatType" typeId="tpee.1070534436861" id="6227590151851173050" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6227590151851173053">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomMapCreator" typeId="tp2q.1576845966386891367" id="6227590151851173054">
                  <link role="containerDeclaration" roleId="tp2q.1576845966386891370" targetNodeId="y4jj.7602110602933850049" resolveInfo="floatFloatHashMap" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6227590151851173056">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6227590151851173078">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6227590151851173091">
                <node role="type" roleId="tpee.1070534934091" type="tpee.FloatType" typeId="tpee.1070534436861" id="6227590151851173096" />
                <node role="expression" roleId="tpee.1070534934092" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="6227590151851173086">
                  <property name="value" nameId="tpee.1113006610751" value="2.0" />
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="6227590151851173058">
                <node role="key" roleId="tp2q.1197932525128" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6227590151851173063">
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="6227590151851173071">
                    <property name="value" nameId="tpee.1113006610751" value="1.0" />
                  </node>
                  <node role="type" roleId="tpee.1070534934091" type="tpee.FloatType" typeId="tpee.1070534436861" id="6227590151851173067" />
                </node>
                <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851173057">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851173046" resolveInfo="mff" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6227590151851173100">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6227590151851173101">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6227590151851173102">
                <node role="type" roleId="tpee.1070534934091" type="tpee.FloatType" typeId="tpee.1070534436861" id="6227590151851173103" />
                <node role="expression" roleId="tpee.1070534934092" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="6227590151851173104">
                  <property name="value" nameId="tpee.1113006610751" value="1.0" />
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="6227590151851173105">
                <node role="key" roleId="tp2q.1197932525128" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6227590151851173106">
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="6227590151851173107">
                    <property name="value" nameId="tpee.1113006610751" value="2.0" />
                  </node>
                  <node role="type" roleId="tpee.1070534934091" type="tpee.FloatType" typeId="tpee.1070534436861" id="6227590151851173108" />
                </node>
                <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851173109">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851173046" resolveInfo="mff" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6227590151851173117">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6227590151851173118">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6227590151851173119">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tp82.1205510696455" resolveInfo="assertIterableEqualsIgnoreOrder" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6227590151851173123">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851173122">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851173046" resolveInfo="mff" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetKeysOperation" typeId="tp2q.1201872418428" id="6227590151851173127" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6227590151851173136">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851173133">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851173046" resolveInfo="mff" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetValuesOperation" typeId="tp2q.1237909114519" id="6227590151851173144" />
                </node>
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6227590151851173120" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6227590151851174799">
        <property name="methodName" nameId="tpe3.1171931690128" value="intInt" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6227590151851174800" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6227590151851174801" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6227590151851174802">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6227590151851174803">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6227590151851174804">
              <property name="name" nameId="tpck.1169194664001" value="mii" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.MapType" typeId="tp2q.1197683403723" id="6227590151851174805">
                <node role="valueType" roleId="tp2q.1197683475734" type="tpee.IntegerType" typeId="tpee.1070534370425" id="6227590151851174809" />
                <node role="keyType" roleId="tp2q.1197683466920" type="tpee.IntegerType" typeId="tpee.1070534370425" id="6227590151851174808" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6227590151851174811">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomMapCreator" typeId="tp2q.1576845966386891367" id="6227590151851174812">
                  <link role="containerDeclaration" roleId="tp2q.1576845966386891370" targetNodeId="y4jj.7602110602933850161" resolveInfo="intIntHashMap" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="6227590151851174814">
            <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6227590151851174815">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="6227590151851174830">
                <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6227590151851174831">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6227590151851174846">
                    <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6227590151851174866">
                      <node role="rValue" roleId="tpee.1068498886297" type="tpee.MulExpression" typeId="tpee.1092119917967" id="6227590151851174875">
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851174880">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851174833" resolveInfo="y" />
                        </node>
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851174874">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851174817" resolveInfo="x" />
                        </node>
                      </node>
                      <node role="lValue" roleId="tpee.1068498886295" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="6227590151851174848">
                        <node role="key" roleId="tp2q.1197932525128" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6227590151851174856">
                          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851174926">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851174817" resolveInfo="x" />
                          </node>
                          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6227590151851174908">
                            <node role="expression" roleId="tpee.1079359253376" type="tpee.ShiftLeftExpression" typeId="tpee.1225892208569" id="6227590151851174915">
                              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851174920">
                                <property name="value" nameId="tpee.1068580320021" value="8" />
                              </node>
                              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851174923">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851174833" resolveInfo="y" />
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851174847">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851174804" resolveInfo="mii" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6227590151851174833">
                  <property name="name" nameId="tpck.1169194664001" value="y" />
                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="6227590151851174835" />
                  <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851174837">
                    <property name="value" nameId="tpee.1068580320021" value="0" />
                  </node>
                </node>
                <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="6227590151851174888">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ShiftLeftExpression" typeId="tpee.1225892208569" id="6227590151851174892">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851174895">
                      <property name="value" nameId="tpee.1068580320021" value="8" />
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851174891">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851174838">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851174833" resolveInfo="y" />
                  </node>
                </node>
                <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="6227590151851174844">
                  <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851174845">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851174833" resolveInfo="y" />
                  </node>
                </node>
              </node>
            </node>
            <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6227590151851174817">
              <property name="name" nameId="tpck.1169194664001" value="x" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="6227590151851174819" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851174821">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
            </node>
            <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="6227590151851174823">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ShiftLeftExpression" typeId="tpee.1225892208569" id="6227590151851174884">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851174887">
                  <property name="value" nameId="tpee.1068580320021" value="8" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851174826">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851174822">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851174817" resolveInfo="x" />
              </node>
            </node>
            <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="6227590151851174828">
              <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851174829">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851174817" resolveInfo="x" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="6227590151851176673">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6227590151851176680">
              <node role="expression" roleId="tpee.1070534934092" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6227590151851176690">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.ShiftLeftExpression" typeId="tpee.1225892208569" id="6227590151851176693">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851176696">
                    <property name="value" nameId="tpee.1068580320021" value="16" />
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851176692">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                </node>
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6227590151851176682">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              </node>
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6227590151851185573">
              <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6227590151851185574">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851185575">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851174804" resolveInfo="mii" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="6227590151851185576" />
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6227590151851185578">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="6227590151851187353">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6227590151851187356">
              <node role="expression" roleId="tpee.1070534934092" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6227590151851191229">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.MulExpression" typeId="tpee.1092119917967" id="6227590151851191230">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851191231">
                    <property name="value" nameId="tpee.1068580320021" value="13" />
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851191232">
                    <property name="value" nameId="tpee.1068580320021" value="42" />
                  </node>
                </node>
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6227590151851187358">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              </node>
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6227590151851187365">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6227590151851187368">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="6227590151851189323">
                <node role="key" roleId="tp2q.1197932525128" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6227590151851189324">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851189325">
                    <property name="value" nameId="tpee.1068580320021" value="13" />
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6227590151851189326">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ShiftLeftExpression" typeId="tpee.1225892208569" id="6227590151851189327">
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851189328">
                        <property name="value" nameId="tpee.1068580320021" value="8" />
                      </node>
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851189329">
                        <property name="value" nameId="tpee.1068580320021" value="42" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851189330">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851174804" resolveInfo="mii" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="6227590151851187425">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6227590151851187426">
              <node role="expression" roleId="tpee.1070534934092" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6227590151851191233">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.MulExpression" typeId="tpee.1092119917967" id="6227590151851191234">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851191235">
                    <property name="value" nameId="tpee.1068580320021" value="13" />
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851191236">
                    <property name="value" nameId="tpee.1068580320021" value="42" />
                  </node>
                </node>
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6227590151851187430">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              </node>
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6227590151851187431">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6227590151851187432">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="6227590151851189334">
                <node role="key" roleId="tp2q.1197932525128" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6227590151851189335">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851189336">
                    <property name="value" nameId="tpee.1068580320021" value="42" />
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6227590151851189337">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ShiftLeftExpression" typeId="tpee.1225892208569" id="6227590151851189338">
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851189339">
                        <property name="value" nameId="tpee.1068580320021" value="8" />
                      </node>
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851189340">
                        <property name="value" nameId="tpee.1068580320021" value="13" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851189341">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851174804" resolveInfo="mii" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6227590151851193120">
        <property name="methodName" nameId="tpe3.1171931690128" value="longLong" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6227590151851193121" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6227590151851193122" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6227590151851193123">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6227590151851193124">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6227590151851193125">
              <property name="name" nameId="tpck.1169194664001" value="mll" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.MapType" typeId="tp2q.1197683403723" id="6227590151851193126">
                <node role="valueType" roleId="tp2q.1197683475734" type="tpee.LongType" typeId="tpee.1068581242867" id="6227590151851193130" />
                <node role="keyType" roleId="tp2q.1197683466920" type="tpee.LongType" typeId="tpee.1068581242867" id="6227590151851193129" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6227590151851193132">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomMapCreator" typeId="tp2q.1576845966386891367" id="6227590151851193133">
                  <link role="containerDeclaration" roleId="tp2q.1576845966386891370" targetNodeId="y4jj.7602110602933850273" resolveInfo="longLongHashMap" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6227590151851193135">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6227590151851193152">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.LongLiteral" typeId="tpee.4269842503726207156" id="6227590151851193160">
                <property name="value" nameId="tpee.4269842503726207157" value="2L" />
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="6227590151851193137">
                <node role="key" roleId="tp2q.1197932525128" type="tpee.LongLiteral" typeId="tpee.4269842503726207156" id="6227590151851193145">
                  <property name="value" nameId="tpee.4269842503726207157" value="1L" />
                </node>
                <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851193136">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851193125" resolveInfo="mll" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="6227590151851193164">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.LongLiteral" typeId="tpee.4269842503726207156" id="6227590151851199105">
              <property name="value" nameId="tpee.4269842503726207157" value="2L" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="6227590151851193169">
              <node role="key" roleId="tp2q.1197932525128" type="tpee.LongLiteral" typeId="tpee.4269842503726207156" id="6227590151851197127">
                <property name="value" nameId="tpee.4269842503726207157" value="1L" />
              </node>
              <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851193168">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851193125" resolveInfo="mll" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6227590151851201083">
        <property name="methodName" nameId="tpe3.1171931690128" value="shortShort" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6227590151851201084" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6227590151851201085" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6227590151851201086">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6227590151851201087">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6227590151851201088">
              <property name="name" nameId="tpck.1169194664001" value="mss" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.MapType" typeId="tp2q.1197683403723" id="6227590151851201089">
                <node role="valueType" roleId="tp2q.1197683475734" type="tpee.ShortType" typeId="tpee.1070533982221" id="6227590151851201093" />
                <node role="keyType" roleId="tp2q.1197683466920" type="tpee.ShortType" typeId="tpee.1070533982221" id="6227590151851201092" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6227590151851201095">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomMapCreator" typeId="tp2q.1576845966386891367" id="6227590151851201096">
                  <link role="containerDeclaration" roleId="tp2q.1576845966386891370" targetNodeId="y4jj.7602110602933850397" resolveInfo="shortShortHashMap" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6227590151851201098">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6227590151851201125">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6227590151851201130">
                <node role="type" roleId="tpee.1070534934091" type="tpee.ShortType" typeId="tpee.1070533982221" id="6227590151851201131" />
                <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851201138">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="6227590151851201100">
                <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851201099">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851201088" resolveInfo="mss" />
                </node>
                <node role="key" roleId="tp2q.1197932525128" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6227590151851201110">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ShortType" typeId="tpee.1070533982221" id="6227590151851201115" />
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851201118">
                    <property name="value" nameId="tpee.1068580320021" value="2" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="6227590151851201142">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6227590151851203246">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ShortType" typeId="tpee.1070533982221" id="6227590151851203249" />
              <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851201145">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="6227590151851201147">
              <node role="key" roleId="tp2q.1197932525128" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6227590151851201157">
                <node role="type" roleId="tpee.1070534934091" type="tpee.ShortType" typeId="tpee.1070533982221" id="6227590151851201162" />
                <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6227590151851201152">
                  <property name="value" nameId="tpee.1068580320021" value="2" />
                </node>
              </node>
              <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6227590151851201146">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6227590151851201088" resolveInfo="mss" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6227590151851173114">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="tp82.1204129267857" resolveInfo="Util_Test" />
    </node>
  </root>
  <root id="2767227637715419112">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2767227637715419113" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="2767227637715419114">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2767227637715419115" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2767227637715419116" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2767227637715419117" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="2767227637715419118">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="4485853999107906411">
        <property name="methodName" nameId="tpe3.1171931690128" value="primLists" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4485853999107906412" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4485853999107906413" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4485853999107906414">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4485853999107907694">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4485853999107907695">
              <property name="name" nameId="tpck.1169194664001" value="lb" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="4485853999107907696">
                <node role="elementType" roleId="tp2q.1151688676805" type="tpee.ByteType" typeId="tpee.1070534604311" id="4485853999107907698" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4485853999107907700">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomContainerCreator" typeId="tp2q.1331913329176106419" id="4485853999107907701">
                  <link role="containerDeclaration" roleId="tp2q.1331913329176106420" targetNodeId="y4jj.4737294400113290500" resolveInfo="byteArrayList" />
                  <node role="initValue" roleId="tp2q.1237721435808" type="tpee.CastExpression" typeId="tpee.1070534934090" id="4485853999107908884">
                    <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4485853999107908902">
                      <property name="value" nameId="tpee.1068580320021" value="13" />
                    </node>
                    <node role="type" roleId="tpee.1070534934091" type="tpee.ByteType" typeId="tpee.1070534604311" id="4485853999107908901" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4485853999107907704">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4485853999107907705">
              <property name="name" nameId="tpck.1169194664001" value="ld" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="4485853999107907706">
                <node role="elementType" roleId="tp2q.1151688676805" type="tpee.DoubleType" typeId="tpee.1070534513062" id="4485853999107907708" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4485853999107907710">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomContainerCreator" typeId="tp2q.1331913329176106419" id="4485853999107907711">
                  <link role="containerDeclaration" roleId="tp2q.1331913329176106420" targetNodeId="y4jj.4737294400113332721" resolveInfo="doubleArrayList" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4485853999107907713">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4485853999107907714">
              <property name="name" nameId="tpck.1169194664001" value="lf" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="4485853999107907715">
                <node role="elementType" roleId="tp2q.1151688676805" type="tpee.FloatType" typeId="tpee.1070534436861" id="4485853999107907717" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4485853999107907719">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomContainerCreator" typeId="tp2q.1331913329176106419" id="4485853999107907720">
                  <link role="containerDeclaration" roleId="tp2q.1331913329176106420" targetNodeId="y4jj.4737294400113337801" resolveInfo="floatArrayList" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4485853999107907722">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4485853999107907723">
              <property name="name" nameId="tpck.1169194664001" value="li" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="4485853999107907724">
                <node role="elementType" roleId="tp2q.1151688676805" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4485853999107907726" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4485853999107907728">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomContainerCreator" typeId="tp2q.1331913329176106419" id="4485853999107907729">
                  <link role="containerDeclaration" roleId="tp2q.1331913329176106420" targetNodeId="y4jj.4737294400113337816" resolveInfo="intArrayList" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4485853999107907733">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4485853999107907734">
              <property name="name" nameId="tpck.1169194664001" value="ll" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="4485853999107907735">
                <node role="elementType" roleId="tp2q.1151688676805" type="tpee.LongType" typeId="tpee.1068581242867" id="4485853999107907737" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4485853999107907739">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomContainerCreator" typeId="tp2q.1331913329176106419" id="4485853999107907740">
                  <link role="containerDeclaration" roleId="tp2q.1331913329176106420" targetNodeId="y4jj.4737294400113337832" resolveInfo="longArrayList" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4485853999107906652">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4485853999107906653">
              <property name="name" nameId="tpck.1169194664001" value="ls" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="4485853999107906654">
                <node role="elementType" roleId="tp2q.1151688676805" type="tpee.ShortType" typeId="tpee.1070533982221" id="4485853999107906656" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4485853999107906658">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomContainerCreator" typeId="tp2q.1331913329176106419" id="4485853999107907702">
                  <link role="containerDeclaration" roleId="tp2q.1331913329176106420" targetNodeId="y4jj.4737294400113337847" resolveInfo="shortArrayList" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertInNotNull" typeId="tpe3.7080278351417106679" id="4485853999107935932">
            <node role="expression" roleId="tpe3.7080278351417106681" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4485853999107935934">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4485853999107907695" resolveInfo="lb" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertInNotNull" typeId="tpe3.7080278351417106679" id="4485853999107935936">
            <node role="expression" roleId="tpe3.7080278351417106681" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4485853999107935950">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4485853999107907705" resolveInfo="ld" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertInNotNull" typeId="tpe3.7080278351417106679" id="4485853999107935939">
            <node role="expression" roleId="tpe3.7080278351417106681" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4485853999107935951">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4485853999107907714" resolveInfo="lf" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertInNotNull" typeId="tpe3.7080278351417106679" id="4485853999107935942">
            <node role="expression" roleId="tpe3.7080278351417106681" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4485853999107935952">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4485853999107907723" resolveInfo="li" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertInNotNull" typeId="tpe3.7080278351417106679" id="4485853999107935945">
            <node role="expression" roleId="tpe3.7080278351417106681" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4485853999107935953">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4485853999107907734" resolveInfo="ll" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertInNotNull" typeId="tpe3.7080278351417106679" id="4485853999107935948">
            <node role="expression" roleId="tpe3.7080278351417106681" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4485853999107935954">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4485853999107906653" resolveInfo="ls" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="2767227637715419119">
        <property name="methodName" nameId="tpe3.1171931690128" value="byteList" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2767227637715419120" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2767227637715419121" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2767227637715419122">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2767227637715419123">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2767227637715419124">
              <property name="name" nameId="tpck.1169194664001" value="lb" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="2767227637715419125">
                <node role="elementType" roleId="tp2q.1151688676805" type="tpee.ByteType" typeId="tpee.1070534604311" id="2767227637715419127" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2767227637715419129">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomContainerCreator" typeId="tp2q.1331913329176106419" id="2767227637715419130">
                  <link role="containerDeclaration" roleId="tp2q.1331913329176106420" targetNodeId="y4jj.4737294400113290500" resolveInfo="byteArrayList" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2767227637715555741">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2767227637715555743">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2767227637715555742">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2767227637715419124" resolveInfo="lb" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="2767227637715555747">
                <node role="argument" roleId="tp2q.1160612519549" type="tpee.CastExpression" typeId="tpee.1070534934090" id="2767227637715588623">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ByteType" typeId="tpee.1070534604311" id="2767227637715588628" />
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2767227637715555751">
                    <property name="value" nameId="tpee.1068580320021" value="0" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2767227637715555755">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2767227637715555757">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2767227637715555756">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2767227637715419124" resolveInfo="lb" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="2767227637715555761">
                <node role="argument" roleId="tp2q.1160612519549" type="tpee.CastExpression" typeId="tpee.1070534934090" id="2767227637715588631">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ByteType" typeId="tpee.1070534604311" id="2767227637715588636" />
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2767227637715555767">
                    <property name="value" nameId="tpee.1068580320021" value="-1" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2767227637715555771">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2767227637715555773">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2767227637715555772">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2767227637715419124" resolveInfo="lb" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="2767227637715555777">
                <node role="argument" roleId="tp2q.1160612519549" type="tpee.CastExpression" typeId="tpee.1070534934090" id="2767227637715588639">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ByteType" typeId="tpee.1070534604311" id="2767227637715588644" />
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2767227637715555783">
                    <property name="value" nameId="tpee.1068580320021" value="256" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="2767227637715621487">
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2767227637715621493">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2767227637715621492">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2767227637715419124" resolveInfo="lb" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="2767227637715621497" />
            </node>
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2767227637715621491">
              <property name="value" nameId="tpee.1068580320021" value="3" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="2767227637715621499">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tp2q.ListElementAccessExpression" typeId="tp2q.1225711141656" id="2767227637715621503">
              <node role="index" roleId="tp2q.1225711191269" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2767227637715621507">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
              <node role="list" roleId="tp2q.1225711182005" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2767227637715621502">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2767227637715419124" resolveInfo="lb" />
              </node>
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tp2q.ListElementAccessExpression" typeId="tp2q.1225711141656" id="2767227637715621510">
              <node role="index" roleId="tp2q.1225711191269" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2767227637715621513">
                <property name="value" nameId="tpee.1068580320021" value="2" />
              </node>
              <node role="list" roleId="tp2q.1225711182005" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2767227637715621509">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2767227637715419124" resolveInfo="lb" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="2767227637715625442">
        <property name="methodName" nameId="tpe3.1171931690128" value="intList" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2767227637715625443" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2767227637715625444" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2767227637715625445">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2767227637715654456">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2767227637715654457">
              <property name="name" nameId="tpck.1169194664001" value="liPrim" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="2767227637715654458">
                <node role="elementType" roleId="tp2q.1151688676805" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2767227637715654460" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2767227637715654462">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.CustomContainerCreator" typeId="tp2q.1331913329176106419" id="2767227637715654463">
                  <link role="containerDeclaration" roleId="tp2q.1331913329176106420" targetNodeId="y4jj.4737294400113337816" resolveInfo="intArrayList" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2921267027982585672">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2921267027982585673">
              <property name="name" nameId="tpck.1169194664001" value="liBox" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="2921267027982585674">
                <node role="elementType" roleId="tp2q.1151688676805" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2921267027982585676" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2921267027982585678">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.ListCreatorWithInit" typeId="tp2q.1160600644654" id="2921267027982585679">
                  <node role="elementType" roleId="tp2q.1237721435807" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2921267027982585680" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2921267027982585652">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2921267027982585655">
              <property name="name" nameId="tpck.1169194664001" value="mem1" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.LongType" typeId="tpee.1068581242867" id="2921267027982585657" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2921267027982585649">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2921267027982585650" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2921267027982585651">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2921267027982585625" resolveInfo="getUsedMem" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="2921267027982585593">
            <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="2921267027982585594">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2921267027982585609">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2921267027982585611">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3383608405507462584">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2767227637715654457" resolveInfo="liPrim" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="2921267027982585615">
                    <node role="argument" roleId="tp2q.1160612519549" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2921267027982585621">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2921267027982585596" resolveInfo="i" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2921267027982585596">
              <property name="name" nameId="tpck.1169194664001" value="i" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2921267027982585598" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2921267027982585600">
                <property name="value" nameId="tpee.1068580320021" value="100000" />
              </node>
            </node>
            <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="2921267027982585602">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2921267027982585605">
                <property name="value" nameId="tpee.1068580320021" value="200000" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2921267027982585601">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2921267027982585596" resolveInfo="i" />
              </node>
            </node>
            <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="2921267027982585607">
              <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2921267027982585608">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2921267027982585596" resolveInfo="i" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2921267027982585664">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2921267027982585665">
              <property name="name" nameId="tpck.1169194664001" value="mem2" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.LongType" typeId="tpee.1068581242867" id="2921267027982585666" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2921267027982585668">
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2921267027982585669">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2921267027982585625" resolveInfo="getUsedMem" />
                </node>
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2921267027982585670" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="789821184115913454">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.CastExpression" typeId="tpee.1070534934090" id="789821184115913457">
              <node role="type" roleId="tpee.1070534934091" type="tpee.IntegerType" typeId="tpee.1070534370425" id="789821184115913459" />
              <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="789821184115913465">
                <property name="value" nameId="tpee.1068580320021" value="100000" />
              </node>
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.CastExpression" typeId="tpee.1070534934090" id="789821184115913466">
              <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="789821184115913470">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="789821184115913469">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2767227637715654457" resolveInfo="liPrim" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="789821184115913474" />
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.IntegerType" typeId="tpee.1070534370425" id="789821184115913468" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5699232652750172939">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5699232652750172941">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5699232652750172940">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2767227637715654457" resolveInfo="liPrim" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.ClearAllElementsOperation" typeId="tp2q.1227022210526" id="5699232652750172945" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5699232652750172931">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5699232652750172932">
              <property name="name" nameId="tpck.1169194664001" value="mem3" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.LongType" typeId="tpee.1068581242867" id="5699232652750172933" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5699232652750172934">
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5699232652750172935">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2921267027982585625" resolveInfo="getUsedMem" />
                </node>
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="5699232652750172936" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="2921267027982585683">
            <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="2921267027982585684">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2921267027982585685">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2921267027982585686">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="789821184115941257">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2921267027982585673" resolveInfo="liBox" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="2921267027982585688">
                    <node role="argument" roleId="tp2q.1160612519549" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2921267027982585689">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2921267027982585690" resolveInfo="i" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2921267027982585690">
              <property name="name" nameId="tpck.1169194664001" value="i" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2921267027982585691" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2921267027982585692">
                <property name="value" nameId="tpee.1068580320021" value="200000" />
              </node>
            </node>
            <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="2921267027982585693">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2921267027982585694">
                <property name="value" nameId="tpee.1068580320021" value="300000" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2921267027982585695">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2921267027982585690" resolveInfo="i" />
              </node>
            </node>
            <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="2921267027982585696">
              <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2921267027982585697">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2921267027982585690" resolveInfo="i" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2921267027982585707">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2921267027982585708">
              <property name="name" nameId="tpck.1169194664001" value="mem4" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.LongType" typeId="tpee.1068581242867" id="2921267027982585709" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2921267027982585710">
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2921267027982585711">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2921267027982585625" resolveInfo="getUsedMem" />
                </node>
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2921267027982585712" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="789821184115969060">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="789821184115969070">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.MulExpression" typeId="tpee.1092119917967" id="789821184115969063">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="2740940107228032192">
                  <property name="value" nameId="tpee.1113006610751" value="2.5" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="789821184115969066">
                  <node role="expression" roleId="tpee.1079359253376" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="789821184115969067">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="789821184115969068">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2921267027982585655" resolveInfo="mem1" />
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="789821184115969069">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2921267027982585665" resolveInfo="mem2" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="789821184115969073">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="789821184115969074">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="789821184115969075">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5699232652750172932" resolveInfo="mem3" />
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="789821184115969076">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2921267027982585708" resolveInfo="mem4" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="789821184115941245">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.CastExpression" typeId="tpee.1070534934090" id="789821184115941246">
              <node role="type" roleId="tpee.1070534934091" type="tpee.IntegerType" typeId="tpee.1070534370425" id="789821184115941247" />
              <node role="expression" roleId="tpee.1070534934092" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="789821184115941248">
                <property name="value" nameId="tpee.1068580320021" value="100000" />
              </node>
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.CastExpression" typeId="tpee.1070534934090" id="789821184115941249">
              <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="789821184115941250">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="789821184115941255">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2921267027982585673" resolveInfo="liBox" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="789821184115941252" />
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.IntegerType" typeId="tpee.1070534370425" id="789821184115941253" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2921267027982585625">
      <property name="name" nameId="tpck.1169194664001" value="getUsedMem" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="2921267027982585626" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2921267027982585628">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2921267027982585629">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2921267027982585630">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~System%dgc()%cvoid" resolveInfo="gc" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~System" resolveInfo="System" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="789821184116080318">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="789821184116080319">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~System" resolveInfo="System" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~System%dgc()%cvoid" resolveInfo="gc" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.TryCatchStatement" typeId="tpee.1164879751025" id="2921267027982585631">
          <node role="body" roleId="tpee.1164879758292" type="tpee.StatementList" typeId="tpee.1068580123136" id="2921267027982585632">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2921267027982585633">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2921267027982585634">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Thread%dsleep(long)%cvoid" resolveInfo="sleep" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Thread" resolveInfo="Thread" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2921267027982585635">
                  <property name="value" nameId="tpee.1068580320021" value="1000" />
                </node>
              </node>
            </node>
          </node>
          <node role="catchClause" roleId="tpee.1164903496223" type="tpee.CatchClause" typeId="tpee.1164903280175" id="2921267027982585636">
            <node role="throwable" roleId="tpee.1164903359217" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2921267027982585637">
              <property name="name" nameId="tpck.1169194664001" value="e" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2921267027982585638">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~InterruptedException" resolveInfo="InterruptedException" />
              </node>
            </node>
            <node role="catchBody" roleId="tpee.1164903359218" type="tpee.StatementList" typeId="tpee.1068580123136" id="2921267027982585639" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2921267027982585640">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2921267027982585641">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~System%dgc()%cvoid" resolveInfo="gc" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~System" resolveInfo="System" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="789821184115546626">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="789821184115546627">
            <property name="name" nameId="tpck.1169194664001" value="bean" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="789821184115546628">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="y50y.~MemoryMXBean" resolveInfo="MemoryMXBean" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="789821184115546629">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y50y.~ManagementFactory%dgetMemoryMXBean()%cjava%dlang%dmanagement%dMemoryMXBean" resolveInfo="getMemoryMXBean" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="y50y.~ManagementFactory" resolveInfo="ManagementFactory" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.CommentedStatementsBlock" typeId="tpee.1177326519037" id="4485853999107906410">
          <node role="statement" roleId="tpee.1177326540772" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="789821184115830208">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="789821184115830209">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="789821184115830210">
                <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="789821184115830211">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprintln(java%dlang%dString)%cvoid" resolveInfo="println" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="789821184115830213">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="789821184115830222">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="789821184115830217">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="789821184115830216">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="789821184115546627" resolveInfo="bean" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="789821184115830221">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y50y.~MemoryMXBean%dgetHeapMemoryUsage()%cjava%dlang%dmanagement%dMemoryUsage" resolveInfo="getHeapMemoryUsage" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="789821184115830226">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y50y.~MemoryUsage%dtoString()%cjava%dlang%dString" resolveInfo="toString" />
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="789821184115830212">
                    <property name="value" nameId="tpee.1070475926801" value="HEAP -------&gt; " />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="789821184115546631">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="789821184115546638">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="789821184115546633">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="789821184115546632">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="789821184115546627" resolveInfo="bean" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="789821184115546637">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y50y.~MemoryMXBean%dgetHeapMemoryUsage()%cjava%dlang%dmanagement%dMemoryUsage" resolveInfo="getHeapMemoryUsage" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="789821184115546642">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y50y.~MemoryUsage%dgetUsed()%clong" resolveInfo="getUsed" />
            </node>
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.LongType" typeId="tpee.1068581242867" id="2921267027982585658" />
    </node>
  </root>
</model>

