<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:77b60a8d-2582-4f88-b038-f330599ad949(buildtest)">
  <persistence version="7" />
  <language namespace="954c4d77-e24b-4e49-a5a5-5476c966c092(jetbrains.mps.gwt.client)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)" />
  <import index="9vrl" modelUID="r:9e8f23e3-7bd3-4292-ac1d-5693a6c373f3(jetbrains.mps.internal.collections)" version="-1" />
  <import index="nva4" modelUID="r:6a4f00d3-a72e-48b0-96be-a5139db9536c(jetbrains.mps.baseLanguage.closures)" version="-1" />
  <import index="taj" modelUID="f:java_stub#954c4d77-e24b-4e49-a5a5-5476c966c092#com.google.gwt.core.client(com.google.gwt.core.client@java_stub)" version="-1" />
  <import index="od37" modelUID="f:java_stub#954c4d77-e24b-4e49-a5a5-5476c966c092#com.google.gwt.user.client.ui(com.google.gwt.user.client.ui@java_stub)" version="-1" />
  <import index="63d2" modelUID="f:java_stub#954c4d77-e24b-4e49-a5a5-5476c966c092#com.google.gwt.dom.client(com.google.gwt.dom.client@java_stub)" version="-1" />
  <import index="vibg" modelUID="f:gwt_stub#954c4d77-e24b-4e49-a5a5-5476c966c092#com.google.gwt.user(com.google.gwt.user@gwt_stub)" version="-1" />
  <import index="jxw0" modelUID="f:gwt_stub#954c4d77-e24b-4e49-a5a5-5476c966c092#com.google.gwt.core(com.google.gwt.core@gwt_stub)" version="-1" />
  <import index="k1iy" modelUID="r:940623f0-75cf-4f64-98fc-aef3fadfaedd(jetbrains.mps.gwt.client.structure)" version="0" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <import index="tp2c" modelUID="r:00000000-0000-4000-0000-011c89590338(jetbrains.mps.baseLanguage.closures.structure)" version="3" implicit="yes" />
  <roots>
    <node type="k1iy.GWTModule" typeId="k1iy.1572321421811286040" id="3789315678729139397">
      <property name="name" nameId="tpck.1169194664001" value="buildtest" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="3789315678729139399">
      <property name="name" nameId="tpck.1169194664001" value="SampleModule" />
    </node>
  </roots>
  <root id="3789315678729139397">
    <node role="element" roleId="k1iy.1572321421811416508" type="k1iy.Inherits" typeId="k1iy.1572321421811299552" id="3789315678729222221">
      <link role="module" roleId="k1iy.1572321421811299553" targetNodeId="jxw0.~Core" resolveInfo="Core" />
    </node>
    <node role="element" roleId="k1iy.1572321421811416508" type="k1iy.Inherits" typeId="k1iy.1572321421811299552" id="3789315678729222222">
      <link role="module" roleId="k1iy.1572321421811299553" targetNodeId="vibg.~User" resolveInfo="User" />
    </node>
    <node role="element" roleId="k1iy.1572321421811416508" type="k1iy.Inherits" typeId="k1iy.1572321421811299552" id="3789315678729139406">
      <link role="module" roleId="k1iy.1572321421811299553" targetNodeId="9vrl.6309092871163554394" resolveInfo="runtime" />
    </node>
    <node role="element" roleId="k1iy.1572321421811416508" type="k1iy.Inherits" typeId="k1iy.1572321421811299552" id="3789315678729139408">
      <link role="module" roleId="k1iy.1572321421811299553" targetNodeId="nva4.1624295421069327411" resolveInfo="runtime" />
    </node>
    <node role="element" roleId="k1iy.1572321421811416508" type="k1iy.Source" typeId="k1iy.1572321421811416498" id="3789315678729139398" />
    <node role="element" roleId="k1iy.1572321421811416508" type="k1iy.EntryPoint" typeId="k1iy.1572321421811292807" id="3789315678729222698">
      <link role="entryPoint" roleId="k1iy.1572321421811292808" targetNodeId="3789315678729139399" resolveInfo="SampleModule" />
    </node>
  </root>
  <root id="3789315678729139399">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3789315678729139400" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="3789315678729139401">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3789315678729139402" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3789315678729139403" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3789315678729139404" />
    </node>
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3789315678729139409">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="taj.~EntryPoint" resolveInfo="EntryPoint" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="3789315678729139410">
      <property name="name" nameId="tpck.1169194664001" value="onModuleLoad" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3789315678729139411" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3789315678729139412" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3789315678729139413">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="3789315678729139415">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3789315678729139416">
            <property name="name" nameId="tpck.1169194664001" value="cmp" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3789315678729139417">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="od37.~Widget" resolveInfo="Widget" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3789315678729139418">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3789315678729139419">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3789315678729139428" resolveInfo="createComponent" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="3789315678729139420" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3789315678729139421">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3789315678729139422">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="3789315678729139423">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="od37.~RootLayoutPanel%dget()%ccom%dgoogle%dgwt%duser%dclient%dui%dRootLayoutPanel" resolveInfo="get" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="od37.~RootLayoutPanel" resolveInfo="RootLayoutPanel" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3789315678729139424">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="od37.~LayoutPanel%dadd(com%dgoogle%dgwt%duser%dclient%dui%dWidget)%cvoid" resolveInfo="add" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3789315678729139425">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3789315678729139416" resolveInfo="cmp" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="3789315678729139428">
      <property name="name" nameId="tpck.1169194664001" value="createComponent" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="3789315678729139429" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3789315678729139430">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="od37.~Widget" resolveInfo="Widget" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3789315678729139431">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="3789315678729139432">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3789315678729139433">
            <property name="name" nameId="tpck.1169194664001" value="lp" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3789315678729139434">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="od37.~DockLayoutPanel" resolveInfo="DockLayoutPanel" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3789315678729139435">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="3789315678729139436">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="od37.~DockLayoutPanel%d&lt;init&gt;(com%dgoogle%dgwt%ddom%dclient%dStyle$Unit)" resolveInfo="DockLayoutPanel" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="3789315678729139437">
                  <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="63d2.~Style$Unit" resolveInfo="Style.Unit" />
                  <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="63d2.~Style$Unit%dEM" resolveInfo="EM" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="3789315678729221738">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3789315678729221739">
            <property name="name" nameId="tpck.1169194664001" value="widgets" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp2q.DequeType" typeId="tp2q.3357971920378033937" id="3789315678729221740">
              <node role="elementType" roleId="tp2q.5686963296372573084" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3789315678729221741">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="od37.~Widget" resolveInfo="Widget" />
              </node>
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="3789315678729221742">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3789315678729144529" resolveInfo="createWidgets" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="3789315678729221743">
                <node role="parameter" roleId="tp2c.1199569906740" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="3789315678729221744">
                  <property name="name" nameId="tpck.1169194664001" value="i" />
                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="3789315678729221745" />
                </node>
                <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="3789315678729221746">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="3789315678729221747">
                    <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3789315678729221748">
                      <property name="name" nameId="tpck.1169194664001" value="label" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3789315678729221749">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="od37.~Label" resolveInfo="Label" />
                      </node>
                      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3789315678729221750">
                        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="3789315678729221751">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="od37.~Label%d&lt;init&gt;()" resolveInfo="Label" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3789315678729221752">
                    <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3789315678729221753">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3789315678729221754">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3789315678729221748" resolveInfo="label" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3789315678729221755">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="od37.~Label%dsetText(java%dlang%dString)%cvoid" resolveInfo="setText" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="3789315678729221756">
                          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="3789315678729221757">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3789315678729221744" resolveInfo="i" />
                          </node>
                          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3789315678729221758">
                            <property name="value" nameId="tpee.1070475926801" value="Label #" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3789315678729221759">
                    <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3789315678729221760">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3789315678729221748" resolveInfo="label" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3789315678729221761">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.SequenceCreator" typeId="tp2q.1224414427926" id="3789315678729221762">
                  <node role="elementType" roleId="tp2q.1224414456414" type="tpee.IntegerType" typeId="tpee.1070534370425" id="3789315678729221763" />
                  <node role="initializer" roleId="tp2q.1224414466839" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="3789315678729221764">
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="3789315678729221765">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="3789315678729221766">
                        <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3789315678729221767">
                          <property name="name" nameId="tpck.1169194664001" value="i" />
                          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="3789315678729221768" />
                          <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3789315678729221769">
                            <property name="value" nameId="tpee.1068580320021" value="1" />
                          </node>
                        </node>
                        <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="3789315678729221770">
                          <node role="statement" roleId="tpee.1068581517665" type="tp2c.YieldStatement" typeId="tp2c.1200830824066" id="3789315678729221771">
                            <node role="expression" roleId="tp2c.1200830928149" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3789315678729221772">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3789315678729221767" resolveInfo="i" />
                            </node>
                          </node>
                        </node>
                        <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanOrEqualsExpression" typeId="tpee.1153422305557" id="3789315678729221773">
                          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3789315678729221774">
                            <property name="value" nameId="tpee.1068580320021" value="10" />
                          </node>
                          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3789315678729221775">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3789315678729221767" resolveInfo="i" />
                          </node>
                        </node>
                        <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="3789315678729221776">
                          <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3789315678729221777">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3789315678729221767" resolveInfo="i" />
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
        <node role="statement" roleId="tpee.1068581517665" type="tpee.WhileStatement" typeId="tpee.1076505808687" id="3789315678729221779">
          <node role="condition" roleId="tpee.1076505808688" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3789315678729221783">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3789315678729221782">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3789315678729221739" resolveInfo="widgets" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.IsNotEmptyOperation" typeId="tp2q.1176501494711" id="3789315678729221787" />
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="3789315678729221781">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3789315678729221788">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3789315678729221790">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3789315678729221789">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3789315678729139433" resolveInfo="lp" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3789315678729221794">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="od37.~DockLayoutPanel%dadd(com%dgoogle%dgwt%duser%dclient%dui%dWidget)%cvoid" resolveInfo="add" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3789315678729221796">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3789315678729221795">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3789315678729221739" resolveInfo="widgets" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp2q.RemoveLastElementOperation" typeId="tp2q.1227026094155" id="3789315678729221800" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3789315678729139453">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3789315678729139454">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3789315678729139433" resolveInfo="lp" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="3789315678729144529">
      <property name="name" nameId="tpck.1169194664001" value="createWidgets" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3789315678729144531" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3789315678729144532">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="3789315678729158608">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3789315678729158609">
            <property name="name" nameId="tpck.1169194664001" value="widgets" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp2q.LinkedListType" typeId="tp2q.3358009230509553641" id="3789315678729158610">
              <node role="elementType" roleId="tp2q.1151688676805" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3789315678729158612">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="od37.~Widget" resolveInfo="Widget" />
              </node>
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3789315678729158614">
              <node role="creator" roleId="tpee.1145553007750" type="tp2q.LinkedListCreator" typeId="tp2q.1227008614712" id="3789315678729158615">
                <node role="elementType" roleId="tp2q.1237721435807" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3789315678729158616">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="od37.~Widget" resolveInfo="Widget" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3789315678729158620">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3789315678729158622">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="3789315678729158621">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3789315678729144547" resolveInfo="ints" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.VisitAllOperation" typeId="tp2q.1204980550705" id="3789315678729158626">
              <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="3789315678729158627">
                <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="3789315678729158628">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3789315678729158631">
                    <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3789315678729158633">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3789315678729158632">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3789315678729158609" resolveInfo="ssss" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddFirstElementOperation" typeId="tp2q.1227022159410" id="3789315678729158639">
                        <node role="argument" roleId="tp2q.1227022622978" type="tp2c.CompactInvokeFunctionExpression" typeId="tp2c.1235746970280" id="3789315678729221678">
                          <node role="parameter" roleId="tp2c.1235747002942" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="3789315678729221681">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3789315678729158629" resolveInfo="i" />
                          </node>
                          <node role="function" roleId="tp2c.1235746996653" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="3789315678729221679">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3789315678729144541" resolveInfo="f" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="3789315678729158629">
                  <property name="name" nameId="tpck.1169194664001" value="i" />
                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754489988" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3789315678729221683">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3789315678729221684">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3789315678729158609" resolveInfo="widgets" />
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tp2q.DequeType" typeId="tp2q.3357971920378033937" id="3789315678729144537">
        <node role="elementType" roleId="tp2q.5686963296372573084" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3789315678729144540">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="od37.~Widget" resolveInfo="Widget" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="3789315678729144541">
        <property name="name" nameId="tpck.1169194664001" value="f" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="3789315678729144542">
          <node role="resultType" roleId="tp2c.1199542457201" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3789315678729144546">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="od37.~Widget" resolveInfo="Widget" />
          </node>
          <node role="parameterType" roleId="tp2c.1199542501692" type="tpee.IntegerType" typeId="tpee.1070534370425" id="3789315678729144545" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="3789315678729144547">
        <property name="name" nameId="tpck.1169194664001" value="ints" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp2q.SequenceType" typeId="tp2q.1151689724996" id="3789315678729144549">
          <node role="elementType" roleId="tp2q.1151689745422" type="tpee.IntegerType" typeId="tpee.1070534370425" id="3789315678729144551" />
        </node>
      </node>
    </node>
  </root>
</model>

