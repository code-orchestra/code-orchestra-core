<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:6e5f3f83-4279-433d-9603-0c8b89b682e3(jetbrains.mps.ui.gwt.events)">
  <persistence version="7" />
  <language namespace="8a448bd0-1380-4c01-9820-0f051d33888c(jetbrains.mps.ui.modeling)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)" />
  <import index="3ly5" modelUID="r:840b989b-d75d-4268-abaa-4676d1720c58(jetbrains.mps.ui.events)" version="-1" />
  <import index="e8m3" modelUID="r:6878192c-cfd9-411c-9af0-6054cf03c27f(jetbrains.mps.ui.gwt.generator.template.main@generator)" version="-1" />
  <import index="g666" modelUID="f:java_stub#a5a5d5ab-3987-4848-9421-998f92430773#com.google.gwt.event.dom.client(jetbrains.mps.ui.gwt#9106854556042091019/com.google.gwt.event.dom.client@java_stub)" version="-1" />
  <import index="7s6f" modelUID="f:java_stub#a5a5d5ab-3987-4848-9421-998f92430773#com.google.gwt.user.client.ui(jetbrains.mps.ui.gwt#9106854556042091019/com.google.gwt.user.client.ui@java_stub)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="sqp9" modelUID="r:ba1d89ed-800e-4d0a-ad09-221b1011fbd1(jetbrains.mps.ui.modeling.structure)" version="2" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <roots>
    <node type="sqp9.EventHandlerTemplate" typeId="sqp9.8115675450774717215" id="9003987136928224013">
      <property name="name" nameId="tpck.1169194664001" value="ClickEvent" />
      <link role="event" roleId="sqp9.8115675450775148415" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
    </node>
  </roots>
  <root id="9003987136928224013">
    <node role="eventType" roleId="sqp9.8115675450774806489" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928224830">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="g666.~ClickEvent" resolveInfo="ClickEvent" />
    </node>
    <node role="setup" roleId="sqp9.8115675450774806490" type="sqp9.EventHandlerSetup" typeId="sqp9.8115675450774806491" id="9003987136928224016">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928224017">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928224832">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928224834">
            <node role="operand" roleId="tpee.1197027771414" type="sqp9.EventProducerParam" typeId="sqp9.5703963167136660800" id="9003987136928224833" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928224838">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="7s6f.~FocusWidget%daddClickHandler(com%dgoogle%dgwt%devent%ddom%dclient%dClickHandler)%ccom%dgoogle%dgwt%devent%dshared%dHandlerRegistration" resolveInfo="addClickHandler" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9003987136928224839">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="9003987136928229406">
                  <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="9003987136928229407">
                    <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
                    <link role="classifier" roleId="tpee.1170346070688" targetNodeId="g666.~ClickHandler" resolveInfo="ClickHandler" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Object%d&lt;init&gt;()" resolveInfo="Object" />
                    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928229408" />
                    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9003987136928229409">
                      <property name="isAbstract" nameId="tpee.1178608670077" value="false" />
                      <property name="name" nameId="tpck.1169194664001" value="onClick" />
                      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928229410" />
                      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="9003987136928229411" />
                      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="9003987136928229412">
                        <property name="name" nameId="tpck.1169194664001" value="e" />
                        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928229413">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="g666.~ClickEvent" resolveInfo="ClickEvent" />
                        </node>
                      </node>
                      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928229414">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="9003987136928240416">
                          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="9003987136928240417">
                            <property name="name" nameId="tpck.1169194664001" value="he" />
                            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928240418">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e8m3.8568902829141360905" resolveInfo="Executor" />
                              <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928240425">
                                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="g666.~ClickEvent" resolveInfo="ClickEvent" />
                              </node>
                            </node>
                            <node role="initializer" roleId="tpee.1068431790190" type="sqp9.EventHandlerParam" typeId="sqp9.8115675450774807738" id="9003987136928240423" />
                          </node>
                        </node>
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928240426">
                          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928240428">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9003987136928240427">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928240417" resolveInfo="he" />
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928240432">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e8m3.8568902829141360908" resolveInfo="doIt" />
                              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="9003987136928240433">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928229412" resolveInfo="e" />
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
    </node>
    <node role="producerType" roleId="sqp9.5703963167136336336" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928224831">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="7s6f.~FocusWidget" resolveInfo="FocusWidget" />
    </node>
  </root>
</model>

