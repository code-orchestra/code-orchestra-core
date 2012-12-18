<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:713811b0-d2b6-4c36-83ef-cabdc9db96f6(jetbrains.mps.ui.unittest.tests)">
  <persistence version="7" />
  <language namespace="f61473f9-130f-42f6-b98d-6c438812c2f6(jetbrains.mps.baseLanguage.unitTest)" />
  <language namespace="f85adbd8-2ec2-4572-bcfc-8dd799a7f025(jetbrains.mps.xmlUnitTest)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="fb26dccf-fa54-4e9a-8ddb-b66311a34393(jetbrains.mps.ui)" />
  <language namespace="d2e2015c-df3c-4295-8cb1-64d11969dd00(jetbrains.mps.ui.internal.testdata)" />
  <language namespace="fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)" />
  <language-engaged-on-generation namespace="d2e2015c-df3c-4295-8cb1-64d11969dd00(jetbrains.mps.ui.internal.testdata)" />
  <import index="5nad" modelUID="r:d4a6c696-53c3-4061-8ca7-f4d803aeab0a(jetbrains.mps.ui.internal.testdata.widgets)" version="-1" />
  <import index="cdmt" modelUID="r:83565bcd-fedf-48c1-8194-677ec562ba77(jetbrains.mps.ui.unittest.mockup)" version="-1" />
  <import index="4l8p" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#org.junit(MPS.Classpath/org.junit@java_stub)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tp2c" modelUID="r:00000000-0000-4000-0000-011c89590338(jetbrains.mps.baseLanguage.closures.structure)" version="3" implicit="yes" />
  <import index="fb0y" modelUID="r:4bcef4e7-5bde-4076-8e02-73a0681ac6a3(jetbrains.mps.ui.structure)" version="0" implicit="yes" />
  <import index="uhtq" modelUID="r:efa5d33c-6fd5-4d10-a901-6cd78341e945(jetbrains.mps.ui.internal.testdata.events)" version="-1" implicit="yes" />
  <import index="mass" modelUID="r:77603f21-ab6b-487f-82f9-e98e1903f0fc(jetbrains.mps.xmlUnitTest.structure)" version="-1" implicit="yes" />
  <import index="tpe3" modelUID="r:00000000-0000-4000-0000-011c895902d7(jetbrains.mps.baseLanguage.unitTest.structure)" version="-1" implicit="yes" />
  <import index="1taj" modelUID="r:36693452-2637-4608-8caa-ab32ee7c1be3(jetbrains.mps.ui.multiplexing)" version="-1" implicit="yes" />
  <roots>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="5211164146777102347">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="Widgets_noCtx" />
    </node>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="3633072329222756248">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="UITestBase" />
      <property name="isDeprecated" nameId="tpee.1224848525476" value="false" />
      <property name="abstractClass" nameId="tpee.1075300953594" value="true" />
    </node>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="3633072329222757661">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="Widgets_ctx" />
    </node>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="5520428330967866438">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="Views" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="5520428330967866691">
      <property name="name" nameId="tpck.1169194664001" value="FooBean" />
    </node>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="6876714382652043622">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="Events" />
    </node>
  </roots>
  <root id="5211164146777102347">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5211164146777102348" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="5211164146777102349">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5211164146777102350" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5211164146777102351" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5211164146777102352" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="5211164146777102353">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1850528335647327223">
        <property name="methodName" nameId="tpe3.1171931690128" value="panel1" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1850528335647327224" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1850528335647327225" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1850528335647327226">
          <node role="statement" roleId="tpee.1068581517665" type="mass.AssertXMLEquals" typeId="mass.5211164146777002721" id="1850528335647327227">
            <node role="expected" roleId="mass.5211164146777002723" type="mass.XMLStringLiteral" typeId="mass.5211164146776489223" id="1850528335647327228">
              <node role="xml" roleId="mass.5211164146776489224" type="mass.XMLLiteral" typeId="mass.5211164146776488214" id="5266766379151204571">
                <node role="element" roleId="mass.5211164146776488215" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736297">
                  <property name="name" nameId="tpck.1169194664001" value="panel" />
                  <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736298">
                    <property name="name" nameId="tpck.1169194664001" value="child" />
                    <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736299">
                      <property name="name" nameId="tpck.1169194664001" value="widget" />
                    </node>
                    <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736411">
                      <property name="name" nameId="tpck.1169194664001" value="comp" />
                      <property name="value" nameId="mass.5266766379151914052" value="*default*" />
                    </node>
                  </node>
                  <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736419">
                    <property name="name" nameId="tpck.1169194664001" value="type" />
                    <property name="value" nameId="mass.5266766379151914052" value="panel" />
                  </node>
                </node>
              </node>
            </node>
            <node role="actual" roleId="mass.5211164146777002724" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1850528335647327231">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1850528335647327232">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3633072329222756268" resolveInfo="toString" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp2c.CompactInvokeFunctionExpression" typeId="tp2c.1235746970280" id="3633072329222755566">
                  <node role="function" roleId="tp2c.1235746996653" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="3633072329222755567">
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="3633072329222755568">
                      <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="8923564134260572756">
                        <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="8923564134260572758">
                          <node role="statement" roleId="tpee.1068581517665" type="fb0y.UIObjectStatement" typeId="fb0y.8381258131358446225" id="3633072329222755569">
                            <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.8977668887014122504" resolveInfo="MockPanel" />
                            <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="3633072329222755570">
                              <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="5nad.8977668887014122505" resolveInfo="*default*" />
                              <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="3633072329222755571">
                                <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="5275753781174759688">
                                  <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.8977668887014122506" resolveInfo="MockWidget" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="context" roleId="fb0y.8923564134257084384" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5275753781174750230">
                          <node role="type" roleId="tpee.1070534934091" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="5275753781174750231">
                            <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="5nad.8977668887014122505" resolveInfo="*default*" />
                            <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="5nad.8977668887014122504" resolveInfo="MockPanel" />
                          </node>
                          <node role="expression" roleId="tpee.1070534934092" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5275753781174750232" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1850528335647327236" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6469323859730975315">
        <property name="methodName" nameId="tpe3.1171931690128" value="panel2" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6469323859730975316" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6469323859730975317" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6469323859730975318">
          <node role="statement" roleId="tpee.1068581517665" type="mass.AssertXMLEquals" typeId="mass.5211164146777002721" id="6469323859730975319">
            <node role="expected" roleId="mass.5211164146777002723" type="mass.XMLStringLiteral" typeId="mass.5211164146776489223" id="6469323859730975320">
              <node role="xml" roleId="mass.5211164146776489224" type="mass.XMLLiteral" typeId="mass.5211164146776488214" id="5266766379151204535">
                <node role="element" roleId="mass.5211164146776488215" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736256">
                  <property name="name" nameId="tpck.1169194664001" value="panel" />
                  <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736356">
                    <property name="name" nameId="tpck.1169194664001" value="child" />
                    <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736357">
                      <property name="name" nameId="tpck.1169194664001" value="widget" />
                      <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736433">
                        <property name="name" nameId="tpck.1169194664001" value="id" />
                        <property name="value" nameId="mass.5266766379151914052" value="north1" />
                      </node>
                    </node>
                    <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736437">
                      <property name="name" nameId="tpck.1169194664001" value="comp" />
                      <property name="value" nameId="mass.5266766379151914052" value="north" />
                    </node>
                  </node>
                  <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736387">
                    <property name="name" nameId="tpck.1169194664001" value="child" />
                    <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736388">
                      <property name="name" nameId="tpck.1169194664001" value="widget" />
                      <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736422">
                        <property name="name" nameId="tpck.1169194664001" value="id" />
                        <property name="value" nameId="mass.5266766379151914052" value="south1" />
                      </node>
                    </node>
                    <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736424">
                      <property name="name" nameId="tpck.1169194664001" value="comp" />
                      <property name="value" nameId="mass.5266766379151914052" value="south" />
                    </node>
                  </node>
                  <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736401">
                    <property name="name" nameId="tpck.1169194664001" value="child" />
                    <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736402">
                      <property name="name" nameId="tpck.1169194664001" value="widget" />
                      <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736432">
                        <property name="name" nameId="tpck.1169194664001" value="id" />
                        <property name="value" nameId="mass.5266766379151914052" value="south2" />
                      </node>
                    </node>
                    <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736425">
                      <property name="name" nameId="tpck.1169194664001" value="comp" />
                      <property name="value" nameId="mass.5266766379151914052" value="south" />
                    </node>
                  </node>
                  <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736412">
                    <property name="name" nameId="tpck.1169194664001" value="type" />
                    <property name="value" nameId="mass.5266766379151914052" value="dock" />
                  </node>
                </node>
              </node>
            </node>
            <node role="actual" roleId="mass.5211164146777002724" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6469323859730975327">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6469323859730975328">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3633072329222756268" resolveInfo="toString" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp2c.CompactInvokeFunctionExpression" typeId="tp2c.1235746970280" id="3633072329222755536">
                  <node role="function" roleId="tp2c.1235746996653" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="3633072329222755537">
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="3633072329222755538">
                      <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="8923564134260572777">
                        <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="8923564134260572779">
                          <node role="statement" roleId="tpee.1068581517665" type="fb0y.UIObjectStatement" typeId="fb0y.8381258131358446225" id="3633072329222755539">
                            <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.6469323859730975167" resolveInfo="MockDockPanel" />
                            <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="3633072329222755540">
                              <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="5nad.6469323859730975168" resolveInfo="north" />
                              <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="3633072329222755541">
                                <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="5275753781174759693">
                                  <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.8977668887014122506" resolveInfo="MockWidget" />
                                  <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="5275753781174759694">
                                    <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="5nad.4343029777915609934" resolveInfo="id" />
                                    <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="5275753781174759695">
                                      <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5275753781174759696">
                                        <property name="value" nameId="tpee.1070475926801" value="north1" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="3633072329222755546">
                              <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="5nad.6469323859730975169" resolveInfo="south" />
                              <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="3633072329222755547">
                                <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="5275753781174759701">
                                  <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.8977668887014122506" resolveInfo="MockWidget" />
                                  <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="5275753781174759702">
                                    <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="5nad.4343029777915609934" resolveInfo="id" />
                                    <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="5275753781174759703">
                                      <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5275753781174759704">
                                        <property name="value" nameId="tpee.1070475926801" value="south1" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                                <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="5275753781174759709">
                                  <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.8977668887014122506" resolveInfo="MockWidget" />
                                  <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="5275753781174759710">
                                    <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="5nad.4343029777915609934" resolveInfo="id" />
                                    <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="5275753781174759711">
                                      <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5275753781174759712">
                                        <property name="value" nameId="tpee.1070475926801" value="south2" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="context" roleId="fb0y.8923564134257084384" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5275753781174750241">
                          <node role="type" roleId="tpee.1070534934091" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="5275753781174750242">
                            <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="5nad.8977668887014122505" resolveInfo="*default*" />
                            <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="5nad.8977668887014122504" resolveInfo="MockPanel" />
                          </node>
                          <node role="expression" roleId="tpee.1070534934092" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5275753781174750243" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6469323859730975332" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="4343029777915764005">
        <property name="methodName" nameId="tpe3.1171931690128" value="panel3" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4343029777915764006" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4343029777915764007" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4343029777915764008">
          <node role="statement" roleId="tpee.1068581517665" type="mass.AssertXMLEquals" typeId="mass.5211164146777002721" id="4343029777915764009">
            <node role="expected" roleId="mass.5211164146777002723" type="mass.XMLStringLiteral" typeId="mass.5211164146776489223" id="4343029777915764012">
              <node role="xml" roleId="mass.5211164146776489224" type="mass.XMLLiteral" typeId="mass.5211164146776488214" id="5266766379151204499">
                <node role="element" roleId="mass.5211164146776488215" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736315">
                  <property name="name" nameId="tpck.1169194664001" value="panel" />
                  <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736381">
                    <property name="name" nameId="tpck.1169194664001" value="child" />
                    <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736382">
                      <property name="name" nameId="tpck.1169194664001" value="widget" />
                      <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736426">
                        <property name="name" nameId="tpck.1169194664001" value="id" />
                        <property name="value" nameId="mass.5266766379151914052" value="widg1" />
                      </node>
                    </node>
                    <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736428">
                      <property name="name" nameId="tpck.1169194664001" value="comp" />
                      <property name="value" nameId="mass.5266766379151914052" value="children" />
                    </node>
                  </node>
                  <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736324">
                    <property name="name" nameId="tpck.1169194664001" value="child" />
                    <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736325">
                      <property name="name" nameId="tpck.1169194664001" value="widget" />
                      <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736420">
                        <property name="name" nameId="tpck.1169194664001" value="id" />
                        <property name="value" nameId="mass.5266766379151914052" value="widg2" />
                      </node>
                    </node>
                    <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736416">
                      <property name="name" nameId="tpck.1169194664001" value="comp" />
                      <property name="value" nameId="mass.5266766379151914052" value="children" />
                    </node>
                  </node>
                  <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736330">
                    <property name="name" nameId="tpck.1169194664001" value="child" />
                    <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736393">
                      <property name="name" nameId="tpck.1169194664001" value="widget" />
                      <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736423">
                        <property name="name" nameId="tpck.1169194664001" value="id" />
                        <property name="value" nameId="mass.5266766379151914052" value="widg3" />
                      </node>
                    </node>
                    <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736408">
                      <property name="name" nameId="tpck.1169194664001" value="comp" />
                      <property name="value" nameId="mass.5266766379151914052" value="children" />
                    </node>
                  </node>
                  <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736415">
                    <property name="name" nameId="tpck.1169194664001" value="type" />
                    <property name="value" nameId="mass.5266766379151914052" value="horiz" />
                  </node>
                </node>
              </node>
            </node>
            <node role="actual" roleId="mass.5211164146777002724" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4343029777915767654">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4343029777915767655">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3633072329222756268" resolveInfo="toString" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp2c.CompactInvokeFunctionExpression" typeId="tp2c.1235746970280" id="3633072329222733230">
                  <node role="function" roleId="tp2c.1235746996653" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="3633072329222733231">
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="3633072329222733232">
                      <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="8923564134260572798">
                        <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="8923564134260572800">
                          <node role="statement" roleId="tpee.1068581517665" type="fb0y.UIObjectStatement" typeId="fb0y.8381258131358446225" id="3633072329222733233">
                            <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.4343029777915763961" resolveInfo="MockHPanel" />
                            <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="3633072329222733234">
                              <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="5nad.4343029777915769854" resolveInfo="children" />
                              <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="3633072329222733235">
                                <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="5275753781174759717">
                                  <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.8977668887014122506" resolveInfo="MockWidget" />
                                  <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="5275753781174759718">
                                    <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="5nad.4343029777915609934" resolveInfo="id" />
                                    <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="5275753781174759719">
                                      <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5275753781174759720">
                                        <property name="value" nameId="tpee.1070475926801" value="widg1" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                                <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="5275753781174759725">
                                  <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.8977668887014122506" resolveInfo="MockWidget" />
                                  <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="5275753781174759726">
                                    <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="5nad.4343029777915609934" resolveInfo="id" />
                                    <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="5275753781174759727">
                                      <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5275753781174759728">
                                        <property name="value" nameId="tpee.1070475926801" value="widg2" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                                <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="5275753781174759733">
                                  <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.8977668887014122506" resolveInfo="MockWidget" />
                                  <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="5275753781174759734">
                                    <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="5nad.4343029777915609934" resolveInfo="id" />
                                    <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="5275753781174759735">
                                      <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5275753781174759736">
                                        <property name="value" nameId="tpee.1070475926801" value="widg3" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="context" roleId="fb0y.8923564134257084384" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5275753781174750252">
                          <node role="type" roleId="tpee.1070534934091" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="5275753781174750253">
                            <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="5nad.8977668887014122505" resolveInfo="*default*" />
                            <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="5nad.8977668887014122504" resolveInfo="MockPanel" />
                          </node>
                          <node role="expression" roleId="tpee.1070534934092" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5275753781174750254" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4343029777915767656" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="2462638993234615802">
        <property name="methodName" nameId="tpe3.1171931690128" value="panel4" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2462638993234615803" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2462638993234615804" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2462638993234615805">
          <node role="statement" roleId="tpee.1068581517665" type="mass.AssertXMLEquals" typeId="mass.5211164146777002721" id="2462638993234615806">
            <node role="expected" roleId="mass.5211164146777002723" type="mass.XMLStringLiteral" typeId="mass.5211164146776489223" id="2462638993234615807">
              <node role="xml" roleId="mass.5211164146776489224" type="mass.XMLLiteral" typeId="mass.5211164146776488214" id="5266766379151204427">
                <node role="element" roleId="mass.5211164146776488215" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736212">
                  <property name="name" nameId="tpck.1169194664001" value="panel" />
                  <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736348">
                    <property name="name" nameId="tpck.1169194664001" value="child" />
                    <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736349">
                      <property name="name" nameId="tpck.1169194664001" value="widget" />
                      <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736427">
                        <property name="name" nameId="tpck.1169194664001" value="id" />
                        <property name="value" nameId="mass.5266766379151914052" value="tab1" />
                      </node>
                      <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736435">
                        <property name="name" nameId="tpck.1169194664001" value="tab" />
                        <property name="value" nameId="mass.5266766379151914052" value="first" />
                      </node>
                    </node>
                    <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736436">
                      <property name="name" nameId="tpck.1169194664001" value="comp" />
                      <property name="value" nameId="mass.5266766379151914052" value="tabs" />
                    </node>
                  </node>
                  <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736225">
                    <property name="name" nameId="tpck.1169194664001" value="child" />
                    <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736396">
                      <property name="name" nameId="tpck.1169194664001" value="widget" />
                      <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736429">
                        <property name="name" nameId="tpck.1169194664001" value="id" />
                        <property name="value" nameId="mass.5266766379151914052" value="tab2" />
                      </node>
                      <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736438">
                        <property name="name" nameId="tpck.1169194664001" value="tab" />
                        <property name="value" nameId="mass.5266766379151914052" value="second" />
                      </node>
                    </node>
                    <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736413">
                      <property name="name" nameId="tpck.1169194664001" value="comp" />
                      <property name="value" nameId="mass.5266766379151914052" value="tabs" />
                    </node>
                  </node>
                  <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736365">
                    <property name="name" nameId="tpck.1169194664001" value="child" />
                    <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736366">
                      <property name="name" nameId="tpck.1169194664001" value="widget" />
                      <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736430">
                        <property name="name" nameId="tpck.1169194664001" value="id" />
                        <property name="value" nameId="mass.5266766379151914052" value="tab3" />
                      </node>
                      <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736421">
                        <property name="name" nameId="tpck.1169194664001" value="tab" />
                        <property name="value" nameId="mass.5266766379151914052" value="third" />
                      </node>
                    </node>
                    <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736431">
                      <property name="name" nameId="tpck.1169194664001" value="comp" />
                      <property name="value" nameId="mass.5266766379151914052" value="tabs" />
                    </node>
                  </node>
                  <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736407">
                    <property name="name" nameId="tpck.1169194664001" value="type" />
                    <property name="value" nameId="mass.5266766379151914052" value="tabbed" />
                  </node>
                </node>
              </node>
            </node>
            <node role="actual" roleId="mass.5211164146777002724" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2462638993234615823">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2462638993234615824">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3633072329222756268" resolveInfo="toString" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp2c.CompactInvokeFunctionExpression" typeId="tp2c.1235746970280" id="2462638993234615825">
                  <node role="function" roleId="tp2c.1235746996653" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="2462638993234615826">
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="2462638993234615827">
                      <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="8923564134260572819">
                        <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="8923564134260572821">
                          <node role="statement" roleId="tpee.1068581517665" type="fb0y.UIObjectStatement" typeId="fb0y.8381258131358446225" id="2462638993234615828">
                            <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.2462638993234615716" resolveInfo="MockTabPanel" />
                            <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="2462638993234615829">
                              <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="5nad.2462638993234615717" resolveInfo="tabs" />
                              <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="2462638993234615830">
                                <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="5275753781174759741">
                                  <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.8977668887014122506" resolveInfo="MockWidget" />
                                  <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="5275753781174759742">
                                    <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="5nad.4343029777915609934" resolveInfo="id" />
                                    <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="5275753781174759743">
                                      <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5275753781174759744">
                                        <property name="value" nameId="tpee.1070475926801" value="tab1" />
                                      </node>
                                    </node>
                                  </node>
                                  <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="5275753781174767504">
                                    <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="5nad.2462638993234615718" resolveInfo="tabName" />
                                    <node role="value" roleId="fb0y.6424935405034937365" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5275753781174767510">
                                      <property name="value" nameId="tpee.1070475926801" value="first" />
                                    </node>
                                  </node>
                                </node>
                                <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="5275753781174759749">
                                  <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.8977668887014122506" resolveInfo="MockWidget" />
                                  <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="5275753781174759750">
                                    <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="5nad.4343029777915609934" resolveInfo="id" />
                                    <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="5275753781174759751">
                                      <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5275753781174759752">
                                        <property name="value" nameId="tpee.1070475926801" value="tab2" />
                                      </node>
                                    </node>
                                  </node>
                                  <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="5275753781174767515">
                                    <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="5nad.2462638993234615718" resolveInfo="tabName" />
                                    <node role="value" roleId="fb0y.6424935405034937365" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5275753781174767521">
                                      <property name="value" nameId="tpee.1070475926801" value="second" />
                                    </node>
                                  </node>
                                </node>
                                <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="5275753781174759757">
                                  <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.8977668887014122506" resolveInfo="MockWidget" />
                                  <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="5275753781174759758">
                                    <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="5nad.4343029777915609934" resolveInfo="id" />
                                    <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="5275753781174759759">
                                      <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5275753781174759760">
                                        <property name="value" nameId="tpee.1070475926801" value="tab3" />
                                      </node>
                                    </node>
                                  </node>
                                  <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="5275753781174767526">
                                    <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="5nad.2462638993234615718" resolveInfo="tabName" />
                                    <node role="value" roleId="fb0y.6424935405034937365" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5275753781174767532">
                                      <property name="value" nameId="tpee.1070475926801" value="third" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="context" roleId="fb0y.8923564134257084384" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5275753781174750263">
                          <node role="type" roleId="tpee.1070534934091" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="5275753781174750264">
                            <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="5nad.8977668887014122505" resolveInfo="*default*" />
                            <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="5nad.8977668887014122504" resolveInfo="MockPanel" />
                          </node>
                          <node role="expression" roleId="tpee.1070534934092" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5275753781174750265" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2462638993234615843" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3633072329222756255">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3633072329222756248" resolveInfo="UITestBase_Test" />
    </node>
    <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="3723152527274798396">
      <link role="annotation" roleId="tpee.1188208074048" targetNodeId="1taj.8590671622324574702" resolveInfo="Variant" />
      <node role="value" roleId="tpee.1188214630783" type="tpee.ImplicitAnnotationInstanceValue" typeId="tpee.2580416627845338977" id="3723152527274798397">
        <link role="key" roleId="tpee.1188214555875" targetNodeId="1taj.8590671622324574704" resolveInfo="value" />
        <node role="value" roleId="tpee.1188214607812" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3723152527274798398">
          <property name="value" nameId="tpee.1070475926801" value="Test" />
        </node>
      </node>
    </node>
  </root>
  <root id="3633072329222756248">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3633072329222756249" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="3633072329222756250">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3633072329222756251" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3633072329222756252" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3633072329222756253" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="3633072329222756254">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="3633072329222756975">
        <property name="methodName" nameId="tpe3.1171931690128" value="dummy" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3633072329222756976" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3633072329222756977" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3633072329222756978">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.RemarkStatement" typeId="tpee.1168622733562" id="3633072329222756979">
            <property name="value" nameId="tpee.1168623065899" value=" this is not a test, just a placeholder" />
          </node>
        </node>
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="600037073069310458">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="4l8p.~Ignore" resolveInfo="Ignore" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="3633072329222756268">
      <property name="name" nameId="tpck.1169194664001" value="toString" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="3633072329222756269">
        <property name="name" nameId="tpck.1169194664001" value="uio" />
        <node role="type" roleId="tpee.5680397130376446158" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="3633072329222756270">
          <link role="uiObject" roleId="fb0y.2144302022143885809" targetNodeId="5nad.8977668887014122506" resolveInfo="MockWidget" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3633072329222756271" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3633072329222756272">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3633072329222756273">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3633072329222756274">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="3633072329222756275">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="3633072329222756276">
                <node role="expression" roleId="tpee.1070534934092" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="3633072329222756277">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3633072329222756269" resolveInfo="uio" />
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3633072329222756278">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3633072329222756279">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Object%dtoString()%cjava%dlang%dString" resolveInfo="toString" />
            </node>
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="3633072329222756280" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6151000417381779560">
      <property name="name" nameId="tpck.1169194664001" value="setUIProperty" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6151000417381779561" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6151000417381779562" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6151000417381779563">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6151000417381779572">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6151000417381779579">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6151000417381779573">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6151000417381779575">
                <node role="expression" roleId="tpee.1070534934092" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6151000417381779578">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6151000417381779564" resolveInfo="uio" />
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6151000417381779577">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="cdmt.5211164146775800836" resolveInfo="MockWidget" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6151000417381779583">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="cdmt.4343029777915609950" resolveInfo="setProp" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6151000417381779585">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6151000417381779566" resolveInfo="prop" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6151000417381779587">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6151000417381779569" resolveInfo="value" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6151000417381779564">
        <property name="name" nameId="tpck.1169194664001" value="uio" />
        <node role="type" roleId="tpee.5680397130376446158" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="6151000417381779565">
          <link role="uiObject" roleId="fb0y.2144302022143885809" targetNodeId="5nad.8977668887014122506" resolveInfo="MockWidget" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6151000417381779566">
        <property name="name" nameId="tpck.1169194664001" value="prop" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="6151000417381779568" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6151000417381779569">
        <property name="name" nameId="tpck.1169194664001" value="value" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="6151000417381779571" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6876714382652044093">
      <property name="name" nameId="tpck.1169194664001" value="triggerEvent" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6876714382652044094" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6876714382652044095" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6876714382652044096">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6876714382652044109">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6876714382652044116">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6876714382652044110">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6876714382652044112">
                <node role="expression" roleId="tpee.1070534934092" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6876714382652044115">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6876714382652044097" resolveInfo="uio" />
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6876714382652044114">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="cdmt.5211164146775800836" resolveInfo="MockWidget" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6876714382652044120">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="cdmt.6876714382652042918" resolveInfo="triggerEvent" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6876714382652044122">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6876714382652044099" resolveInfo="eventKey" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6876714382652044124">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6876714382652044102" resolveInfo="event" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6876714382652044097">
        <property name="name" nameId="tpck.1169194664001" value="uio" />
        <node role="type" roleId="tpee.5680397130376446158" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="6876714382652044098">
          <link role="uiObject" roleId="fb0y.2144302022143885809" targetNodeId="5nad.8977668887014122506" resolveInfo="MockWidget" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6876714382652044099">
        <property name="name" nameId="tpck.1169194664001" value="eventKey" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="6876714382652044101" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6876714382652044102">
        <property name="name" nameId="tpck.1169194664001" value="event" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6876714382652044104">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="cdmt.6876714382651943235" resolveInfo="MockEvent" />
        </node>
      </node>
    </node>
    <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="3723152527274798385">
      <link role="annotation" roleId="tpee.1188208074048" targetNodeId="1taj.8590671622324574702" resolveInfo="Variant" />
      <node role="value" roleId="tpee.1188214630783" type="tpee.ImplicitAnnotationInstanceValue" typeId="tpee.2580416627845338977" id="3723152527274798388">
        <link role="key" roleId="tpee.1188214555875" targetNodeId="1taj.8590671622324574704" resolveInfo="value" />
        <node role="value" roleId="tpee.1188214607812" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3723152527274798389">
          <property name="value" nameId="tpee.1070475926801" value="Test" />
        </node>
      </node>
    </node>
  </root>
  <root id="3633072329222757661">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4650868106319731940">
      <property name="name" nameId="tpck.1169194664001" value="ctx" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4650868106319731942" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4650868106319731943">
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="8923564134260572710">
          <node role="context" roleId="fb0y.8923564134257084384" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5275753781174754512">
            <node role="expression" roleId="tpee.1070534934092" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5275753781174754513" />
            <node role="type" roleId="tpee.1070534934091" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="5275753781174754521">
              <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="5nad.3633072329222834074" resolveInfo="*default*" />
              <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="5nad.3633072329222834073" resolveInfo="CMockPanel" />
            </node>
          </node>
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="8923564134260572712">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.UIObjectStatement" typeId="fb0y.8381258131358446225" id="4650868106319731973">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.8977668887014122504" resolveInfo="MockPanel" />
            </node>
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="4650868106319731958">
        <link role="uiObject" roleId="fb0y.2144302022143885809" targetNodeId="5nad.8977668887014122504" resolveInfo="MockPanel" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3633072329222757662" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="3633072329222757663">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3633072329222757664" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3633072329222757665" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3633072329222757666" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="3633072329222757667">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="3633072329222842313">
        <property name="methodName" nameId="tpe3.1171931690128" value="panelCtx1" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3633072329222842314" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3633072329222842315" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3633072329222842316">
          <node role="statement" roleId="tpee.1068581517665" type="mass.AssertXMLEquals" typeId="mass.5211164146777002721" id="3633072329222842317">
            <node role="expected" roleId="mass.5211164146777002723" type="mass.XMLStringLiteral" typeId="mass.5211164146776489223" id="3633072329222842318">
              <node role="xml" roleId="mass.5211164146776489224" type="mass.XMLLiteral" typeId="mass.5211164146776488214" id="5266766379151204469">
                <node role="element" roleId="mass.5211164146776488215" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736179">
                  <property name="name" nameId="tpck.1169194664001" value="panel" />
                  <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736374">
                    <property name="name" nameId="tpck.1169194664001" value="child" />
                    <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736375">
                      <property name="name" nameId="tpck.1169194664001" value="widget" />
                    </node>
                    <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736434">
                      <property name="name" nameId="tpck.1169194664001" value="comp" />
                      <property name="value" nameId="mass.5266766379151914052" value="*default*" />
                    </node>
                  </node>
                  <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736409">
                    <property name="name" nameId="tpck.1169194664001" value="type" />
                    <property name="value" nameId="mass.5266766379151914052" value="cpanel" />
                  </node>
                </node>
              </node>
            </node>
            <node role="actual" roleId="mass.5211164146777002724" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3633072329222842325">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3633072329222842326">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3633072329222756268" resolveInfo="toString" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp2c.CompactInvokeFunctionExpression" typeId="tp2c.1235746970280" id="3633072329222842327">
                  <node role="parameter" roleId="tp2c.1235747002942" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4650868106319731981">
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4650868106319731982">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4650868106319731940" resolveInfo="ctx" />
                    </node>
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4650868106319731983" />
                  </node>
                  <node role="function" roleId="tp2c.1235746996653" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="3633072329222842328">
                    <node role="parameter" roleId="tp2c.1199569906740" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="3633072329222842347">
                      <property name="name" nameId="tpck.1169194664001" value="ctx" />
                      <node role="type" roleId="tpee.5680397130376446158" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="3633072329222842362">
                        <link role="uiObject" roleId="fb0y.2144302022143885809" targetNodeId="5nad.8977668887014122504" resolveInfo="MockPanel" />
                      </node>
                    </node>
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="3633072329222842329">
                      <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="8923564134260572667">
                        <node role="context" roleId="fb0y.8923564134257084384" type="fb0y.CompartmentReferenceExpression" typeId="fb0y.5776545240964919716" id="8923564134260572685">
                          <link role="container" roleId="fb0y.5776545240964919734" targetNodeId="5nad.3633072329222834074" resolveInfo="*default*" />
                          <node role="uiObject" roleId="fb0y.5776545240964919718" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8923564134260572686">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3633072329222842347" resolveInfo="ctx" />
                          </node>
                        </node>
                        <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="8923564134260572669">
                          <node role="statement" roleId="tpee.1068581517665" type="fb0y.UIObjectStatement" typeId="fb0y.8381258131358446225" id="3633072329222842330">
                            <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.3633072329222834073" resolveInfo="CMockPanel" />
                            <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="3633072329222842331">
                              <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="5nad.3633072329222834074" resolveInfo="*default*" />
                              <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="3633072329222842332">
                                <node role="statement" roleId="tpee.1068581517665" type="fb0y.UIObjectStatement" typeId="fb0y.8381258131358446225" id="3633072329222842333">
                                  <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.3633072329222834069" resolveInfo="CMockWidget" />
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
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="3633072329222842334" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4650868106319771979">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3633072329222756248" resolveInfo="UITestBase_Test" />
    </node>
    <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="3723152527274798393">
      <link role="annotation" roleId="tpee.1188208074048" targetNodeId="1taj.8590671622324574702" resolveInfo="Variant" />
      <node role="value" roleId="tpee.1188214630783" type="tpee.ImplicitAnnotationInstanceValue" typeId="tpee.2580416627845338977" id="3723152527274798394">
        <link role="key" roleId="tpee.1188214555875" targetNodeId="1taj.8590671622324574704" resolveInfo="value" />
        <node role="value" roleId="tpee.1188214607812" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3723152527274798395">
          <property name="value" nameId="tpee.1070475926801" value="Test" />
        </node>
      </node>
    </node>
  </root>
  <root id="5520428330967866438">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5520428330967866439" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="5520428330967866440">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5520428330967866441" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5520428330967866442" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5520428330967866443" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="5520428330967866444">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="5520428330967866446">
        <property name="methodName" nameId="tpe3.1171931690128" value="simpleViewBinding" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5520428330967866447" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5520428330967866448" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5520428330967866449">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5520428330967866731">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5520428330967866732">
              <property name="name" nameId="tpck.1169194664001" value="fb" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5520428330967866733">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5520428330967866691" resolveInfo="FooBean" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="5520428330967866743">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="5520428330967866744">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="5520428330967866693" resolveInfo="FooBean" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6151000417381776674">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6151000417381776692">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6151000417381776675">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5520428330967866732" resolveInfo="fb" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6151000417381776700">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="5520428330967866790" resolveInfo="setFoo" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6151000417381776705">
                  <property name="value" nameId="tpee.1070475926801" value="bar" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="4966327669329868857">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4966327669329868858">
              <property name="value" nameId="tpee.1070475926801" value="bar" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4966327669329868859">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4966327669329868860">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5520428330967866732" resolveInfo="fb" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4966327669329868861">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="5520428330967866777" resolveInfo="getFoo" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6151000417381778078">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6151000417381778079">
              <property name="name" nameId="tpck.1169194664001" value="mw" />
              <node role="type" roleId="tpee.5680397130376446158" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="6151000417381778080">
                <link role="uiObject" roleId="fb0y.2144302022143885809" targetNodeId="5nad.8977668887014122506" resolveInfo="MockWidget" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tp2c.CompactInvokeFunctionExpression" typeId="tp2c.1235746970280" id="6151000417381778102">
                <node role="function" roleId="tp2c.1235746996653" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="6151000417381778103">
                  <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="6151000417381778104">
                    <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="8923564134260572636">
                      <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="8923564134260572638">
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.UIObjectStatement" typeId="fb0y.8381258131358446225" id="6151000417381778105">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.8977668887014122506" resolveInfo="MockWidget" />
                          <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="6151000417381778106">
                            <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="5nad.4343029777915609934" resolveInfo="id" />
                            <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="6151000417381778107">
                              <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6151000417381778108">
                                <property name="value" nameId="tpee.1070475926801" value="1234" />
                              </node>
                            </node>
                          </node>
                          <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="6151000417381778109">
                            <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="5nad.5520428330967866485" resolveInfo="foo" />
                            <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.BeanPropertyView" typeId="fb0y.8381258131358737422" id="6151000417381778110">
                              <link role="getter" roleId="fb0y.8381258131358762488" targetNodeId="5520428330967866777" resolveInfo="getFoo" />
                              <node role="bean" roleId="fb0y.8381258131358796371" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6151000417381778111">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5520428330967866732" resolveInfo="fb" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node role="context" roleId="fb0y.8923564134257084384" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5275753781174750195">
                        <node role="type" roleId="tpee.1070534934091" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="5275753781174750196">
                          <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="5nad.8977668887014122505" resolveInfo="*default*" />
                          <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="5nad.8977668887014122504" resolveInfo="MockPanel" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5275753781174750197" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="6151000417381778059" />
          <node role="statement" roleId="tpee.1068581517665" type="mass.AssertXMLEquals" typeId="mass.5211164146777002721" id="5520428330967866450">
            <node role="actual" roleId="mass.5211164146777002724" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5520428330967866453">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5520428330967866454">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3633072329222756268" resolveInfo="toString" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6151000417381778136">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6151000417381778079" resolveInfo="mw" />
                </node>
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="5520428330967866455" />
            </node>
            <node role="expected" roleId="mass.5211164146777002723" type="mass.XMLStringLiteral" typeId="mass.5211164146776489223" id="5520428330967866820">
              <node role="xml" roleId="mass.5211164146776489224" type="mass.XMLLiteral" typeId="mass.5211164146776488214" id="5266766379151204491">
                <node role="element" roleId="mass.5211164146776488215" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736310">
                  <property name="name" nameId="tpck.1169194664001" value="widget" />
                  <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736414">
                    <property name="name" nameId="tpck.1169194664001" value="id" />
                    <property name="value" nameId="mass.5266766379151914052" value="1234" />
                  </node>
                  <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736417">
                    <property name="name" nameId="tpck.1169194664001" value="foo" />
                    <property name="value" nameId="mass.5266766379151914052" value="bar" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6151000417381780822">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6151000417381780823">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6151000417381780824">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6151000417381779560" resolveInfo="setUIProperty" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6151000417381780830">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6151000417381778079" resolveInfo="mw" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6151000417381780840">
                  <property name="value" nameId="tpee.1070475926801" value="foo" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6151000417381780859">
                  <property name="value" nameId="tpee.1070475926801" value="doh" />
                </node>
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6151000417381780825" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="mass.AssertXMLEquals" typeId="mass.5211164146777002721" id="6151000417381778179">
            <node role="actual" roleId="mass.5211164146777002724" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6151000417381778180">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6151000417381778181">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3633072329222756268" resolveInfo="toString" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6151000417381778182">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6151000417381778079" resolveInfo="mw" />
                </node>
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6151000417381778183" />
            </node>
            <node role="expected" roleId="mass.5211164146777002723" type="mass.XMLStringLiteral" typeId="mass.5211164146776489223" id="6151000417381778184">
              <node role="xml" roleId="mass.5211164146776489224" type="mass.XMLLiteral" typeId="mass.5211164146776488214" id="5266766379151204483">
                <node role="element" roleId="mass.5211164146776488215" type="mass.Element" typeId="mass.5266766379151914058" id="1000636560472736251">
                  <property name="name" nameId="tpck.1169194664001" value="widget" />
                  <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736410">
                    <property name="name" nameId="tpck.1169194664001" value="id" />
                    <property name="value" nameId="mass.5266766379151914052" value="1234" />
                  </node>
                  <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="1000636560472736418">
                    <property name="name" nameId="tpck.1169194664001" value="foo" />
                    <property name="value" nameId="mass.5266766379151914052" value="doh" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="6151000417381780873">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6151000417381780880">
              <property name="value" nameId="tpee.1070475926801" value="doh" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6151000417381780890">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6151000417381780889">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5520428330967866732" resolveInfo="fb" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6151000417381780898">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="5520428330967866777" resolveInfo="getFoo" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5520428330967866445">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3633072329222756248" resolveInfo="UITestBase_Test" />
    </node>
    <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="3723152527274798390">
      <link role="annotation" roleId="tpee.1188208074048" targetNodeId="1taj.8590671622324574702" resolveInfo="Variant" />
      <node role="value" roleId="tpee.1188214630783" type="tpee.ImplicitAnnotationInstanceValue" typeId="tpee.2580416627845338977" id="3723152527274798391">
        <link role="key" roleId="tpee.1188214555875" targetNodeId="1taj.8590671622324574704" resolveInfo="value" />
        <node role="value" roleId="tpee.1188214607812" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3723152527274798392">
          <property name="value" nameId="tpee.1070475926801" value="Test" />
        </node>
      </node>
    </node>
  </root>
  <root id="5520428330967866691">
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="5520428330967866782">
      <property name="name" nameId="tpck.1169194664001" value="foo" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="5520428330967866783" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="5520428330967866785" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="5520428330967866777">
      <property name="name" nameId="tpck.1169194664001" value="getFoo" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="5520428330967866781" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5520428330967866779" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5520428330967866780">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5520428330967866786">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5520428330967866787">
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="5520428330967866788">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="5520428330967866782" resolveInfo="foo" />
            </node>
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="5520428330967866789" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="5520428330967866790">
      <property name="name" nameId="tpck.1169194664001" value="setFoo" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5520428330967866794">
        <property name="name" nameId="tpck.1169194664001" value="val" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="5520428330967866796" />
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5520428330967866791" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5520428330967866792" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5520428330967866793">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5520428330967866797">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="5520428330967866804">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5520428330967866807">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5520428330967866794" resolveInfo="val" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5520428330967866799">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="5520428330967866798" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="5520428330967866803">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="5520428330967866782" resolveInfo="foo" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5520428330967866692" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="5520428330967866693">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5520428330967866694" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5520428330967866695" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5520428330967866696" />
    </node>
  </root>
  <root id="6876714382652043622">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6876714382652043623" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6876714382652043624">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6876714382652043625" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6876714382652043626" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6876714382652043627" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="6876714382652043628">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6876714382652043630">
        <property name="methodName" nameId="tpe3.1171931690128" value="simpleEventHandling" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6876714382652043631" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6876714382652043632" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6876714382652043633">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6876714382652043856">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6876714382652043857">
              <property name="name" nameId="tpck.1169194664001" value="volatileValue" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="6876714382652043858" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6876714382652043868">
                <property name="value" nameId="tpee.1070475926801" value="notset" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6876714382652043634">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6876714382652043635">
              <property name="name" nameId="tpck.1169194664001" value="mw" />
              <node role="type" roleId="tpee.5680397130376446158" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="6876714382652043636">
                <link role="uiObject" roleId="fb0y.2144302022143885809" targetNodeId="5nad.8977668887014122506" resolveInfo="MockWidget" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tp2c.CompactInvokeFunctionExpression" typeId="tp2c.1235746970280" id="6876714382652043637">
                <node role="function" roleId="tp2c.1235746996653" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="6876714382652043638">
                  <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="6876714382652043639">
                    <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="8923564134260572611">
                      <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="8923564134260572613">
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.UIObjectStatement" typeId="fb0y.8381258131358446225" id="6876714382652043640">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="5nad.8977668887014122506" resolveInfo="MockWidget" />
                          <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="6876714382652043815">
                            <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="uhtq.6876714382651943226" resolveInfo="FooEvent" />
                            <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="6876714382652043825">
                              <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="6876714382652043826">
                                <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="6876714382652043827">
                                  <property name="name" nameId="tpck.1169194664001" value="event" />
                                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490097" />
                                </node>
                                <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="6876714382652043829">
                                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6876714382652043873">
                                    <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6876714382652043903">
                                      <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6876714382652043919">
                                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6876714382652043912">
                                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6876714382652043827" resolveInfo="event" />
                                        </node>
                                        <node role="operation" roleId="tpee.1197027833540" type="fb0y.EventPropertyAccessOp" typeId="fb0y.5224413709454835433" id="6876714382652043929">
                                          <link role="property" roleId="fb0y.5224413709454841979" targetNodeId="uhtq.6876714382651943227" resolveInfo="bar" />
                                        </node>
                                      </node>
                                      <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6876714382652043874">
                                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6876714382652043857" resolveInfo="volatileValue" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="6876714382652043641">
                            <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="5nad.4343029777915609934" resolveInfo="id" />
                            <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="6876714382652043642">
                              <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6876714382652043643">
                                <property name="value" nameId="tpee.1070475926801" value="1234" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node role="context" roleId="fb0y.8923564134257084384" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5275753781174750174">
                        <node role="type" roleId="tpee.1070534934091" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="5275753781174750181">
                          <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="5nad.8977668887014122505" resolveInfo="*default*" />
                          <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="5nad.8977668887014122504" resolveInfo="MockPanel" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5275753781174750186" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6876714382652043971">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6876714382652043972">
              <property name="name" nameId="tpck.1169194664001" value="evt" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6876714382652043973">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="cdmt.6876714382651943235" resolveInfo="MockEvent" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6876714382652043983">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6876714382652043984">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="cdmt.6876714382651943237" resolveInfo="MockEvent" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6876714382652043994">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6876714382652044000">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6876714382652043995">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6876714382652043972" resolveInfo="evt" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6876714382652044008">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="cdmt.6876714382652027670" resolveInfo="setProp" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6876714382652044013">
                  <property name="value" nameId="tpee.1070475926801" value="bar" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6876714382652044023">
                  <property name="value" nameId="tpee.1070475926801" value="SET" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="6876714382652044033">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6876714382652044040">
              <property name="value" nameId="tpee.1070475926801" value="notset" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6876714382652044045">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6876714382652043857" resolveInfo="volatileValue" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6876714382652044055">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6876714382652044129">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6876714382652044130">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6876714382652044093" resolveInfo="triggerEvent" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6876714382652044136">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6876714382652043635" resolveInfo="mw" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6876714382652044146">
                  <property name="value" nameId="tpee.1070475926801" value="foo" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6876714382652044165">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6876714382652043972" resolveInfo="evt" />
                </node>
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6876714382652044131" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="4670030048850418138">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4670030048850418141">
              <property name="value" nameId="tpee.1070475926801" value="SET" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4670030048850418142">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6876714382652043857" resolveInfo="volatileValue" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6876714382652043629">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3633072329222756248" resolveInfo="UITestBase_Test" />
    </node>
    <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="3723152527274798382">
      <link role="annotation" roleId="tpee.1188208074048" targetNodeId="1taj.8590671622324574702" resolveInfo="Variant" />
      <node role="value" roleId="tpee.1188214630783" type="tpee.ImplicitAnnotationInstanceValue" typeId="tpee.2580416627845338977" id="3723152527274798383">
        <link role="key" roleId="tpee.1188214555875" targetNodeId="1taj.8590671622324574704" resolveInfo="value" />
        <node role="value" roleId="tpee.1188214607812" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3723152527274798384">
          <property name="value" nameId="tpee.1070475926801" value="Test" />
        </node>
      </node>
    </node>
  </root>
</model>

