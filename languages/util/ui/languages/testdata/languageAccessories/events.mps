<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:efa5d33c-6fd5-4d10-a901-6cd78341e945(jetbrains.mps.ui.internal.testdata.events)">
  <persistence version="7" />
  <language namespace="8a448bd0-1380-4c01-9820-0f051d33888c(jetbrains.mps.ui.modeling)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)" />
  <import index="cdmt" modelUID="r:83565bcd-fedf-48c1-8194-677ec562ba77(jetbrains.mps.ui.unittest.mockup)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="sqp9" modelUID="r:ba1d89ed-800e-4d0a-ad09-221b1011fbd1(jetbrains.mps.ui.modeling.structure)" version="2" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tp2c" modelUID="r:00000000-0000-4000-0000-011c89590338(jetbrains.mps.baseLanguage.closures.structure)" version="3" implicit="yes" />
  <roots>
    <node type="sqp9.Event" typeId="sqp9.8381258131358158046" id="6876714382651943226">
      <property name="handleable" nameId="sqp9.5263857617435649274" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="FooEvent" />
    </node>
    <node type="sqp9.EventHandlerTemplate" typeId="sqp9.8115675450774717215" id="5275753781174746113">
      <property name="name" nameId="tpck.1169194664001" value="FooHander" />
      <link role="event" roleId="sqp9.8115675450775148415" targetNodeId="6876714382651943226" resolveInfo="FooEvent" />
    </node>
  </roots>
  <root id="6876714382651943226">
    <node role="property" roleId="sqp9.5224413709454661150" type="sqp9.EventProperty" typeId="sqp9.5263857617434463752" id="6876714382651943227">
      <property name="name" nameId="tpck.1169194664001" value="bar" />
      <node role="dataType" roleId="sqp9.5263857617434463754" type="tpee.StringType" typeId="tpee.1225271177708" id="6876714382651943229" />
    </node>
  </root>
  <root id="5275753781174746113">
    <node role="eventType" roleId="sqp9.8115675450774806489" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5275753781174746114">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="cdmt.6876714382651943235" resolveInfo="MockEvent" />
    </node>
    <node role="producerType" roleId="sqp9.5703963167136336336" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5275753781174746115">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="cdmt.5211164146775800836" resolveInfo="MockWidget" />
    </node>
    <node role="setup" roleId="sqp9.8115675450774806490" type="sqp9.EventHandlerSetup" typeId="sqp9.8115675450774806491" id="5275753781174746116">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="5275753781174746117">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5275753781174746118">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5275753781174746119">
            <node role="operand" roleId="tpee.1197027771414" type="sqp9.EventProducerParam" typeId="sqp9.5703963167136660800" id="5275753781174746120" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5275753781174746121">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="cdmt.6876714382652027940" resolveInfo="addEventHandler" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5275753781174746122">
                <property name="value" nameId="tpee.1070475926801" value="foo" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="5275753781174746123">
                <node role="parameter" roleId="tp2c.1199569906740" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5275753781174746124">
                  <property name="name" nameId="tpck.1169194664001" value="wdg" />
                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5275753781174746125">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="cdmt.5211164146775800836" resolveInfo="MockWidget" />
                  </node>
                </node>
                <node role="parameter" roleId="tp2c.1199569906740" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5275753781174746126">
                  <property name="name" nameId="tpck.1169194664001" value="event" />
                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5275753781174746127">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="cdmt.6876714382651943235" resolveInfo="MockEvent" />
                  </node>
                </node>
                <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="5275753781174746128">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="3723152527274817966">
                    <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3723152527274817967">
                      <property name="name" nameId="tpck.1169194664001" value="h" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="3723152527274817968">
                        <node role="resultType" roleId="tp2c.1199542457201" type="tpee.VoidType" typeId="tpee.1068581517677" id="3723152527274817973" />
                        <node role="parameterType" roleId="tp2c.1199542501692" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3723152527274817971">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="cdmt.6876714382651943235" resolveInfo="MockEvent" />
                        </node>
                      </node>
                      <node role="initializer" roleId="tpee.1068431790190" type="sqp9.EventHandlerParam" typeId="sqp9.8115675450774807738" id="3723152527274817975" />
                    </node>
                  </node>
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5275753781174746129">
                    <node role="expression" roleId="tpee.1068580123156" type="tp2c.CompactInvokeFunctionExpression" typeId="tp2c.1235746970280" id="5275753781174746130">
                      <node role="parameter" roleId="tp2c.1235747002942" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5275753781174746131">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5275753781174746126" resolveInfo="event" />
                      </node>
                      <node role="function" roleId="tp2c.1235746996653" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3723152527274817976">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3723152527274817967" resolveInfo="h" />
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
    <node role="propertyGetter" roleId="sqp9.5263857617434470708" type="sqp9.EventPropertyGetter" typeId="sqp9.5263857617434466045" id="5275753781174746133">
      <link role="property" roleId="sqp9.5263857617434466082" targetNodeId="6876714382651943227" resolveInfo="bar" />
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="5275753781174746134">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5275753781174746135">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5275753781174746136">
            <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisEventParam" typeId="sqp9.8115675450774717217" id="5275753781174746137" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5275753781174746138">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="cdmt.6876714382652027680" resolveInfo="getProp" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5275753781174746139">
                <property name="value" nameId="tpee.1070475926801" value="bar" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
</model>

