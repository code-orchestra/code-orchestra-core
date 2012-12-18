<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:61c770cf-d088-4c1b-909e-3424021db8f2(jetbrains.mps.ui.sandbox)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="fb26dccf-fa54-4e9a-8ddb-b66311a34393(jetbrains.mps.ui)" />
  <language namespace="fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)" />
  <language namespace="954c4d77-e24b-4e49-a5a5-5476c966c092(jetbrains.mps.gwt.client)" />
  <language namespace="8a448bd0-1380-4c01-9820-0f051d33888c(jetbrains.mps.ui.modeling)" />
  <language-engaged-on-generation namespace="e5c2a44a-6085-4aeb-a5b6-851cecd2d926(jetbrains.mps.ui.gwt)" />
  <language-engaged-on-generation namespace="51805413-e01e-4f51-bf62-a054ab51eb54(jetbrains.mps.ui.swing)" />
  <language-engaged-on-generation namespace="71c80332-b17f-4f0a-be23-b5cba1d261f7(jetbrains.mps.ui.swt)" />
  <import index="gtag" modelUID="r:10f25532-8045-4769-a24c-e48e027baa9d(jetbrains.mps.ui.sandbox.gwt)" version="0" />
  <import index="2yj1" modelUID="r:c1b84d62-80cc-499b-b655-943c00c7ba88(jetbrains.mps.ui.widgets)" version="1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(java.lang@java_stub)" version="-1" />
  <import index="vibg" modelUID="f:gwt_stub#954c4d77-e24b-4e49-a5a5-5476c966c092#com.google.gwt.user(jetbrains.mps.gwt.client/com.google.gwt.user@gwt_stub)" version="-1" />
  <import index="ries" modelUID="f:gwt_stub#954c4d77-e24b-4e49-a5a5-5476c966c092#com.google.gwt.user.theme.standard(jetbrains.mps.gwt.client/com.google.gwt.user.theme.standard@gwt_stub)" version="-1" />
  <import index="k1iy" modelUID="r:940623f0-75cf-4f64-98fc-aef3fadfaedd(jetbrains.mps.gwt.client.structure)" version="0" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tp2c" modelUID="r:00000000-0000-4000-0000-011c89590338(jetbrains.mps.baseLanguage.closures.structure)" version="3" implicit="yes" />
  <import index="sqp9" modelUID="r:ba1d89ed-800e-4d0a-ad09-221b1011fbd1(jetbrains.mps.ui.modeling.structure)" version="2" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="fb0y" modelUID="r:4bcef4e7-5bde-4076-8e02-73a0681ac6a3(jetbrains.mps.ui.structure)" version="0" implicit="yes" />
  <import index="1taj" modelUID="r:36693452-2637-4608-8caa-ab32ee7c1be3(jetbrains.mps.ui.multiplexing)" version="-1" implicit="yes" />
  <import index="3ly5" modelUID="r:840b989b-d75d-4268-abaa-4676d1720c58(jetbrains.mps.ui.events)" version="-1" implicit="yes" />
  <roots>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="7046856741208198715">
      <property name="name" nameId="tpck.1169194664001" value="UIDemo" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="7046856741208199003">
      <property name="name" nameId="tpck.1169194664001" value="BusinessObject" />
    </node>
    <node type="k1iy.GWTModule" typeId="k1iy.1572321421811286040" id="7046856741208290890">
      <property name="name" nameId="tpck.1169194664001" value="UIDemo" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="7001216437968616991">
      <property name="name" nameId="tpck.1169194664001" value="PanelsDemo" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="1438009850184735648">
      <property name="name" nameId="tpck.1169194664001" value="ControlsDemo" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="3546006303814922744">
      <property name="name" nameId="tpck.1169194664001" value="WindowsDemo" />
    </node>
  </roots>
  <root id="7046856741208198715">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4917245576577584056">
      <property name="name" nameId="tpck.1169194664001" value="getDemoContainer" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4917245576577584058" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577584059">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4917245576577584062">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4917245576577584064">
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4917245576577584065">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="4917245576577584052" resolveInfo="demoContainer" />
            </node>
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4917245576577584066" />
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="4917245576577584061">
        <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.380233880019413653" resolveInfo="center" />
        <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="3546006303815365743">
      <property name="name" nameId="tpck.1169194664001" value="getRootPanel" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3546006303815365745" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3546006303815365746">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="3546006303815365800">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3546006303815365816">
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="3546006303815365817">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="3546006303815365772" resolveInfo="rootPanel" />
            </node>
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="3546006303815365818" />
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="3546006303815365753">
        <link role="uiObject" roleId="fb0y.2144302022143885809" targetNodeId="2yj1.3546006303814975218" resolveInfo="RootPanel" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7046856741208198728">
      <property name="name" nameId="tpck.1169194664001" value="getTitle" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="7046856741208198729" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7046856741208198730" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7046856741208198731">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7046856741208198732">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7046856741208198733">
            <property name="value" nameId="tpee.1070475926801" value="UIDemo" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7046856741208198734">
      <property name="name" nameId="tpck.1169194664001" value="createComponent" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7046856741208198735">
        <property name="name" nameId="tpck.1169194664001" value="panel" />
        <node role="type" roleId="tpee.5680397130376446158" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="7046856741208198736">
          <link role="uiObject" roleId="fb0y.2144302022143885809" targetNodeId="2yj1.3546006303814975218" resolveInfo="RootPanel" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="7046856741208198737" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7046856741208198738">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3546006303815365826">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="3546006303815365842">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="3546006303815365845">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7046856741208198735" resolveInfo="panel" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3546006303815365828">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="3546006303815365827" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="3546006303815365835">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="3546006303815365772" resolveInfo="rootPanel" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="8923564134259836698">
          <node role="context" roleId="fb0y.8923564134257084384" type="fb0y.CompartmentReferenceExpression" typeId="fb0y.5776545240964919716" id="8923564134259836702">
            <link role="container" roleId="fb0y.5776545240964919734" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
            <node role="uiObject" roleId="fb0y.5776545240964919718" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8923564134259836703">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7046856741208198735" resolveInfo="panel" />
            </node>
          </node>
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="8923564134259836700">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.UIObjectStatement" typeId="fb0y.8381258131358446225" id="7046856741208198739">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
              <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="7046856741208198749">
                <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.262873202871571548" resolveInfo="west" />
                <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="7046856741208198750">
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="513490887686307578">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.513490887686296700" resolveInfo="StackPanel" />
                    <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="513490887686307581">
                      <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.513490887686296701" resolveInfo="stack" />
                      <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="513490887686307582">
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="7001216437968717264">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.513490887686296702" resolveInfo="StackItem" />
                          <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="7001216437968717265">
                            <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                            <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="7001216437968717266">
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="6196826443637271186">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.4007322171505962920" resolveInfo="VerticalPanel" />
                                <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="6196826443637271187">
                                  <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                                  <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="6196826443637271188">
                                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7001216437968717267">
                                      <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7001216437968717271">
                                        <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7001216437968717268">
                                          <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7001216437968717270">
                                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="7001216437968616993" resolveInfo="PanelsDemo" />
                                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4917245576577584067" />
                                          </node>
                                        </node>
                                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7001216437968717275">
                                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="7001216437968619200" resolveInfo="buildUI" />
                                          <node role="actualArgument" roleId="tpee.1068499141038" type="fb0y.EnclosingContextCompartmentExpression" typeId="fb0y.5776545240964029369" id="7001216437968717277" />
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="7001216437968739784">
                            <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.513490887686296703" resolveInfo="title" />
                            <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="7001216437968739788">
                              <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7001216437968739790">
                                <property name="value" nameId="tpee.1070475926801" value="Panels" />
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="513490887686307604">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.513490887686296702" resolveInfo="StackItem" />
                          <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="513490887686307609">
                            <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.513490887686296703" resolveInfo="title" />
                            <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="513490887686307611">
                              <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="513490887686307613">
                                <property name="value" nameId="tpee.1070475926801" value="Controls" />
                              </node>
                            </node>
                          </node>
                          <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="513490887686307605">
                            <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                            <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="513490887686307606">
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="2204726755035722856">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.4007322171505962920" resolveInfo="VerticalPanel" />
                                <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="2204726755035722857">
                                  <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                                  <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="2204726755035722858">
                                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1438009850184747104">
                                      <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1438009850184747109">
                                        <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1438009850184747105">
                                          <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1438009850184747107">
                                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1438009850184735650" resolveInfo="ControlsDemo" />
                                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1438009850184747108" />
                                          </node>
                                        </node>
                                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1438009850184747113">
                                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1438009850184746914" resolveInfo="buildUI" />
                                          <node role="actualArgument" roleId="tpee.1068499141038" type="fb0y.EnclosingContextCompartmentExpression" typeId="fb0y.5776545240964029369" id="1438009850184747114" />
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="3351556818517745215">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.513490887686296702" resolveInfo="StackItem" />
                          <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="3351556818517745216">
                            <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.513490887686296703" resolveInfo="title" />
                            <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="3351556818517745217">
                              <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3351556818517745218">
                                <property name="value" nameId="tpee.1070475926801" value="Windows" />
                              </node>
                            </node>
                          </node>
                          <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="3351556818517745219">
                            <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                            <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="3351556818517745220">
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="3351556818517745221">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.4007322171505962920" resolveInfo="VerticalPanel" />
                                <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="3351556818517745222">
                                  <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                                  <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="3351556818517745223">
                                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3351556818517745224">
                                      <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3351556818517745225">
                                        <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3351556818517745226">
                                          <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="3351556818517745227">
                                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3546006303814922746" resolveInfo="WindowsDemo" />
                                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="3351556818517745228" />
                                          </node>
                                        </node>
                                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3351556818517745229">
                                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3546006303814935655" resolveInfo="buildUI" />
                                          <node role="actualArgument" roleId="tpee.1068499141038" type="fb0y.EnclosingContextCompartmentExpression" typeId="fb0y.5776545240964029369" id="3351556818517745230" />
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="5220699420101875166">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.513490887686296702" resolveInfo="StackItem" />
                          <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="5220699420101875167">
                            <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                            <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="5220699420101875168">
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="5220699420101875169">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.4007322171505962920" resolveInfo="VerticalPanel" />
                                <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="5220699420101875170">
                                  <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                                  <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="5220699420101875171">
                                    <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="5220699420101875172">
                                      <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770748" resolveInfo="RadioButton" />
                                      <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="5220699420101875173">
                                        <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                        <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="5220699420101875174">
                                          <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5220699420101875175">
                                            <property name="value" nameId="tpee.1070475926801" value="Stage 1" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                    <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="5220699420101875176">
                                      <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770748" resolveInfo="RadioButton" />
                                      <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="5220699420101875177">
                                        <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                        <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="5220699420101875178">
                                          <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5220699420101875179">
                                            <property name="value" nameId="tpee.1070475926801" value="Stage 2" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                    <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="5220699420101875180">
                                      <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770748" resolveInfo="RadioButton" />
                                      <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="5220699420101875181">
                                        <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                        <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="5220699420101875182">
                                          <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5220699420101875183">
                                            <property name="value" nameId="tpee.1070475926801" value="Stage 3" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="5220699420101875184">
                            <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.513490887686296703" resolveInfo="title" />
                            <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="5220699420101875185">
                              <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5220699420101875186">
                                <property name="value" nameId="tpee.1070475926801" value="Тырыпыры" />
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="513490887686307583">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.513490887686296702" resolveInfo="StackItem" />
                          <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="513490887686307607">
                            <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                            <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="513490887686307608">
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="2204726755035722860">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.4007322171505962920" resolveInfo="VerticalPanel" />
                                <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="2204726755035722861">
                                  <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                                  <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="2204726755035722862">
                                    <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="513490887686307631">
                                      <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770748" resolveInfo="RadioButton" />
                                      <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="513490887686307632">
                                        <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                        <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="513490887686307633">
                                          <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="513490887686307634">
                                            <property name="value" nameId="tpee.1070475926801" value="Stage 1" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                    <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="513490887686307635">
                                      <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770748" resolveInfo="RadioButton" />
                                      <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="513490887686307636">
                                        <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                        <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="513490887686307637">
                                          <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="513490887686307638">
                                            <property name="value" nameId="tpee.1070475926801" value="Stage 2" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                    <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="513490887686307639">
                                      <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770748" resolveInfo="RadioButton" />
                                      <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="513490887686307640">
                                        <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                        <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="513490887686307641">
                                          <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="513490887686307642">
                                            <property name="value" nameId="tpee.1070475926801" value="Stage 3" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="513490887686307614">
                            <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.513490887686296703" resolveInfo="title" />
                            <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="513490887686307616">
                              <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="513490887686307618">
                                <property name="value" nameId="tpee.1070475926801" value="Ёмаё" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="2204726755035669297">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2204726755035669294" resolveInfo="size" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2204726755035704373">
                        <property name="value" nameId="tpee.1068580320021" value="16" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="7046856741208198770">
                <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.380233880019413653" resolveInfo="center" />
                <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="7046856741208198771">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4917245576577584068">
                    <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4917245576577584075">
                      <node role="rValue" roleId="tpee.1068498886297" type="fb0y.EnclosingContextCompartmentExpression" typeId="fb0y.5776545240964029369" id="4917245576577584078" />
                      <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4917245576577584070">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4917245576577584069" />
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4917245576577584074">
                          <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="4917245576577584052" resolveInfo="demoContainer" />
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
      <node role="returnType" roleId="tpee.1068580123133" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="7046856741208198796">
        <link role="uiObject" roleId="fb0y.2144302022143885809" targetNodeId="2yj1.7421785601023770754" resolveInfo="Panel" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7046856741208198797">
      <property name="name" nameId="tpck.1169194664001" value="tab1" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7046856741208198798">
        <property name="name" nameId="tpck.1169194664001" value="tpane" />
        <node role="type" roleId="tpee.5680397130376446158" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="7046856741208198799">
          <link role="uiObject" roleId="fb0y.2144302022143885809" targetNodeId="2yj1.6424935405034500197" resolveInfo="TabbedPanel" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="7046856741208198800" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7046856741208198801" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7046856741208198802">
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="8923564134259836690">
          <node role="context" roleId="fb0y.8923564134257084384" type="fb0y.CompartmentReferenceExpression" typeId="fb0y.5776545240964919716" id="8923564134259836694">
            <link role="container" roleId="fb0y.5776545240964919734" targetNodeId="2yj1.6424935405034500198" resolveInfo="tabs" />
            <node role="uiObject" roleId="fb0y.5776545240964919718" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8923564134259836695">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7046856741208198798" resolveInfo="tpane" />
            </node>
          </node>
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="8923564134259836692">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4733308734234135649">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.352695393470301153" resolveInfo="HorizontalPanel" />
              <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="4733308734234135650">
                <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="4733308734234135651">
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4733308734234135652">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770748" resolveInfo="RadioButton" />
                    <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4733308734234135653">
                      <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                      <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4733308734234135654">
                        <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4733308734234135655">
                          <property name="value" nameId="tpee.1070475926801" value="Stage 1" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4733308734234135656">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770748" resolveInfo="RadioButton" />
                    <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4733308734234135657">
                      <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                      <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4733308734234135658">
                        <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4733308734234135659">
                          <property name="value" nameId="tpee.1070475926801" value="Stage 2" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4733308734234135660">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770748" resolveInfo="RadioButton" />
                    <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4733308734234135661">
                      <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                      <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4733308734234135662">
                        <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4733308734234135663">
                          <property name="value" nameId="tpee.1070475926801" value="Stage 3" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="4733308734234306539">
                <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.6424935405034832713" resolveInfo="name" />
                <node role="value" roleId="fb0y.6424935405034937365" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4733308734234306542">
                  <property name="value" nameId="tpee.1070475926801" value="Radiobuttons" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7046856741208198825">
      <property name="name" nameId="tpck.1169194664001" value="tab2" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="7046856741208198826" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7046856741208198827" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7046856741208198828">
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="8923564134259836682">
          <node role="context" roleId="fb0y.8923564134257084384" type="fb0y.CompartmentReferenceExpression" typeId="fb0y.5776545240964919716" id="8923564134259836686">
            <link role="container" roleId="fb0y.5776545240964919734" targetNodeId="2yj1.6424935405034500198" resolveInfo="tabs" />
            <node role="uiObject" roleId="fb0y.5776545240964919718" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8923564134259836687">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7046856741208198866" resolveInfo="tpane" />
            </node>
          </node>
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="8923564134259836684">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4733308734234135665">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.4007322171505962920" resolveInfo="VerticalPanel" />
              <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="4733308734234135666">
                <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="4733308734234135667">
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4733308734234135696">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770742" resolveInfo="CheckBox" />
                    <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4733308734234135697">
                      <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                      <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4733308734234135698">
                        <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4733308734234135699">
                          <property name="value" nameId="tpee.1070475926801" value="kino" />
                        </node>
                      </node>
                    </node>
                    <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4733308734234135700">
                      <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770743" resolveInfo="checked" />
                      <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.BeanPropertyView" typeId="fb0y.8381258131358737422" id="4733308734234135701">
                        <link role="getter" roleId="fb0y.8381258131358762488" targetNodeId="7046856741208199082" resolveInfo="isKino" />
                        <node role="bean" roleId="fb0y.8381258131358796371" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4733308734234135702">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4733308734234135703" />
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4733308734234135704">
                            <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7046856741208199000" resolveInfo="bo" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4733308734234135705">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770742" resolveInfo="CheckBox" />
                    <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4733308734234135706">
                      <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                      <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4733308734234135707">
                        <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4733308734234135708">
                          <property name="value" nameId="tpee.1070475926801" value="vino" />
                        </node>
                      </node>
                    </node>
                    <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4733308734234135709">
                      <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770743" resolveInfo="checked" />
                      <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.BeanPropertyView" typeId="fb0y.8381258131358737422" id="4733308734234135710">
                        <link role="getter" roleId="fb0y.8381258131358762488" targetNodeId="7046856741208199062" resolveInfo="isVino" />
                        <node role="bean" roleId="fb0y.8381258131358796371" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4733308734234135711">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4733308734234135712" />
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4733308734234135713">
                            <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7046856741208199000" resolveInfo="bo" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4733308734234135714">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770742" resolveInfo="CheckBox" />
                    <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4733308734234135715">
                      <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                      <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4733308734234135716">
                        <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4733308734234135717">
                          <property name="value" nameId="tpee.1070475926801" value="domino" />
                        </node>
                      </node>
                    </node>
                    <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4733308734234135718">
                      <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770743" resolveInfo="checked" />
                      <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.BeanPropertyView" typeId="fb0y.8381258131358737422" id="4733308734234135719">
                        <link role="getter" roleId="fb0y.8381258131358762488" targetNodeId="7046856741208199042" resolveInfo="isDomino" />
                        <node role="bean" roleId="fb0y.8381258131358796371" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4733308734234135720">
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4733308734234135721">
                            <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7046856741208199000" resolveInfo="bo" />
                          </node>
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4733308734234135722" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="4733308734234295137">
                <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.6424935405034832713" resolveInfo="name" />
                <node role="value" roleId="fb0y.6424935405034937365" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4733308734234295140">
                  <property name="value" nameId="tpee.1070475926801" value="Checkboxes" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7046856741208198866">
        <property name="name" nameId="tpck.1169194664001" value="tpane" />
        <node role="type" roleId="tpee.5680397130376446158" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="7046856741208198867">
          <link role="uiObject" roleId="fb0y.2144302022143885809" targetNodeId="2yj1.6424935405034500197" resolveInfo="TabbedPanel" />
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7046856741208198987" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="7046856741208198988">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7046856741208198989" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7046856741208198990" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7046856741208198991">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7046856741208198992">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7046856741208198993">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7046856741208198994">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7046856741208198995">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="7046856741208199014" resolveInfo="BusinessObject" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7046856741208198996">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7046856741208198997" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7046856741208198998">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7046856741208199000" resolveInfo="bo" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="7046856741208199000">
      <property name="name" nameId="tpck.1169194664001" value="bo" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7046856741208199001" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7046856741208199002">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="7046856741208199003" resolveInfo="BusinessObject" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="4917245576577584052">
      <property name="name" nameId="tpck.1169194664001" value="demoContainer" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="4917245576577584053" />
      <node role="type" roleId="tpee.5680397130376446158" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="4917245576577584054">
        <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
        <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.380233880019413653" resolveInfo="center" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="3546006303815365772">
      <property name="name" nameId="tpck.1169194664001" value="rootPanel" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="3546006303815365773" />
      <node role="type" roleId="tpee.5680397130376446158" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="3546006303815365778">
        <link role="uiObject" roleId="fb0y.2144302022143885809" targetNodeId="2yj1.3546006303814975218" resolveInfo="RootPanel" />
      </node>
    </node>
    <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="8590671622324486331">
      <link role="annotation" roleId="tpee.1188208074048" targetNodeId="1taj.8590671622324268192" resolveInfo="GenerateVariants" />
      <node role="value" roleId="tpee.1188214630783" type="tpee.AnnotationInstanceValue" typeId="tpee.1188214545140" id="8590671622324507730">
        <link role="key" roleId="tpee.1188214555875" targetNodeId="1taj.8590671622324287920" resolveInfo="value" />
        <node role="value" roleId="tpee.1188214607812" type="tpee.ArrayLiteral" typeId="tpee.1188220165133" id="8590671622324544129">
          <node role="item" roleId="tpee.1188220173759" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8590671622324544131">
            <property name="value" nameId="tpee.1070475926801" value="GWT" />
          </node>
          <node role="item" roleId="tpee.1188220173759" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8590671622324544141">
            <property name="value" nameId="tpee.1070475926801" value="SWT" />
          </node>
          <node role="item" roleId="tpee.1188220173759" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8590671622324544145">
            <property name="value" nameId="tpee.1070475926801" value="Swing" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="7046856741208199003">
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="7046856741208199004">
      <property name="name" nameId="tpck.1169194664001" value="kino" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="7046856741208199005" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="7046856741208199006" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="7046856741208199007">
      <property name="name" nameId="tpck.1169194664001" value="vino" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="7046856741208199008" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="7046856741208199009" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="7046856741208199010">
      <property name="name" nameId="tpck.1169194664001" value="domino" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="7046856741208199011" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="7046856741208199012" />
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7046856741208199013" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="7046856741208199014">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7046856741208199015" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7046856741208199016" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7046856741208199017" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7046856741208199018">
      <property name="name" nameId="tpck.1169194664001" value="toString" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7046856741208199019" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7046856741208199020">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7046856741208199021">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="7046856741208199022">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7046856741208199023">
              <property name="value" nameId="tpee.1070475926801" value="]" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="7046856741208199024">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="7046856741208199025">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="7046856741208199026">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="7046856741208199027">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="7046856741208199028">
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7046856741208199029">
                        <property name="value" nameId="tpee.1070475926801" value="[kino=" />
                      </node>
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7046856741208199030">
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7046856741208199031">
                          <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7046856741208199004" resolveInfo="kino" />
                        </node>
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7046856741208199032" />
                      </node>
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7046856741208199033">
                      <property name="value" nameId="tpee.1070475926801" value=", vino=" />
                    </node>
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7046856741208199034">
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7046856741208199035">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7046856741208199007" resolveInfo="vino" />
                    </node>
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7046856741208199036" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7046856741208199037">
                  <property name="value" nameId="tpee.1070475926801" value=", domino=" />
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7046856741208199038">
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7046856741208199039">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7046856741208199010" resolveInfo="domino" />
                </node>
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7046856741208199040" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="7046856741208199041" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7046856741208199042">
      <property name="name" nameId="tpck.1169194664001" value="isDomino" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7046856741208199043" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7046856741208199044">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7046856741208199045">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7046856741208199046">
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7046856741208199047">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7046856741208199010" resolveInfo="domino" />
            </node>
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7046856741208199048" />
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="7046856741208199049" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7046856741208199050">
      <property name="name" nameId="tpck.1169194664001" value="setDomino" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7046856741208199051">
        <property name="name" nameId="tpck.1169194664001" value="b" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="7046856741208199052" />
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7046856741208199053" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7046856741208199054" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7046856741208199055">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7046856741208199056">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7046856741208199057">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7046856741208199058">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7046856741208199051" resolveInfo="b" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7046856741208199059">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7046856741208199060" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7046856741208199061">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7046856741208199010" resolveInfo="domino" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7046856741208199062">
      <property name="name" nameId="tpck.1169194664001" value="isVino" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7046856741208199063" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7046856741208199064">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7046856741208199065">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7046856741208199066">
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7046856741208199067">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7046856741208199007" resolveInfo="vino" />
            </node>
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7046856741208199068" />
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="7046856741208199069" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7046856741208199070">
      <property name="name" nameId="tpck.1169194664001" value="setVino" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7046856741208199071">
        <property name="name" nameId="tpck.1169194664001" value="b" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="7046856741208199072" />
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7046856741208199073" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7046856741208199074" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7046856741208199075">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7046856741208199076">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7046856741208199077">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7046856741208199078">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7046856741208199071" resolveInfo="b" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7046856741208199079">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7046856741208199080" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7046856741208199081">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7046856741208199007" resolveInfo="vino" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7046856741208199082">
      <property name="name" nameId="tpck.1169194664001" value="isKino" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="7046856741208199083" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7046856741208199084" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7046856741208199085">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7046856741208199086">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7046856741208199087">
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7046856741208199088">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7046856741208199004" resolveInfo="kino" />
            </node>
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7046856741208199089" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7046856741208199090">
      <property name="name" nameId="tpck.1169194664001" value="setKino" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7046856741208199091">
        <property name="name" nameId="tpck.1169194664001" value="b" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="7046856741208199092" />
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7046856741208199093" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7046856741208199094" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7046856741208199095">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7046856741208199096">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7046856741208199097">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7046856741208199098">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7046856741208199091" resolveInfo="b" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7046856741208199099">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7046856741208199100" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7046856741208199101">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7046856741208199004" resolveInfo="kino" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7006844861053446198">
      <property name="name" nameId="tpck.1169194664001" value="getBar" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7006844861053446200" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7006844861053446201">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7006844861053446219">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="7006844861053446220">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7006844861053446210" resolveInfo="bar" />
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="7006844861053446202" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7006844861053446203">
      <property name="name" nameId="tpck.1169194664001" value="setBar" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7006844861053446207">
        <property name="name" nameId="tpck.1169194664001" value="bar" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="7006844861053446209" />
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7006844861053446204" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7006844861053446205" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7006844861053446206">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7006844861053446213">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7006844861053446214">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7006844861053446215">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7006844861053446216" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7006844861053446217">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7006844861053446210" resolveInfo="bar" />
              </node>
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7006844861053446218">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7006844861053446207" resolveInfo="bar" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="7006844861053446210">
      <property name="name" nameId="tpck.1169194664001" value="bar" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="7006844861053446211" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="7006844861053446212" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7006844861053503161">
        <property name="value" nameId="tpee.1070475926801" value="" />
      </node>
    </node>
  </root>
  <root id="7046856741208290890">
    <node role="element" roleId="k1iy.1572321421811416508" type="k1iy.Inherits" typeId="k1iy.1572321421811299552" id="7046856741208293875">
      <link role="module" roleId="k1iy.1572321421811299553" targetNodeId="vibg.~User" resolveInfo="User" />
    </node>
    <node role="element" roleId="k1iy.1572321421811416508" type="k1iy.Inherits" typeId="k1iy.1572321421811299552" id="7046856741208356230">
      <link role="module" roleId="k1iy.1572321421811299553" targetNodeId="ries.~Standard" resolveInfo="Standard" />
    </node>
    <node role="element" roleId="k1iy.1572321421811416508" type="k1iy.Source" typeId="k1iy.1572321421811416498" id="7046856741208290898">
      <node role="pattern" roleId="k1iy.1572321421811299560" type="k1iy.Exclude" typeId="k1iy.1572321421811299558" id="7046856741208290903">
        <node role="pattern" roleId="k1iy.1572321421811299571" type="k1iy.Pattern" typeId="k1iy.1572321421811299563" id="7046856741208290904">
          <property name="value" nameId="k1iy.1572321421811299564" value="swing/**" />
        </node>
      </node>
      <node role="pattern" roleId="k1iy.1572321421811299560" type="k1iy.Exclude" typeId="k1iy.1572321421811299558" id="7046856741208290906">
        <node role="pattern" roleId="k1iy.1572321421811299571" type="k1iy.Pattern" typeId="k1iy.1572321421811299563" id="7046856741208290907">
          <property name="value" nameId="k1iy.1572321421811299564" value="swt/**" />
        </node>
      </node>
      <node role="pattern" roleId="k1iy.1572321421811299560" type="k1iy.Exclude" typeId="k1iy.1572321421811299558" id="1880762541167995421">
        <node role="pattern" roleId="k1iy.1572321421811299571" type="k1iy.Pattern" typeId="k1iy.1572321421811299563" id="1880762541167995422">
          <property name="value" nameId="k1iy.1572321421811299564" value="*_SWT.java" />
        </node>
      </node>
      <node role="pattern" roleId="k1iy.1572321421811299560" type="k1iy.Exclude" typeId="k1iy.1572321421811299558" id="1880762541167995424">
        <node role="pattern" roleId="k1iy.1572321421811299571" type="k1iy.Pattern" typeId="k1iy.1572321421811299563" id="1880762541167995425">
          <property name="value" nameId="k1iy.1572321421811299564" value="*_Swing.java" />
        </node>
      </node>
      <node role="pattern" roleId="k1iy.1572321421811299560" type="k1iy.Exclude" typeId="k1iy.1572321421811299558" id="1880762541168041966">
        <node role="pattern" roleId="k1iy.1572321421811299571" type="k1iy.Pattern" typeId="k1iy.1572321421811299563" id="1880762541168041967">
          <property name="value" nameId="k1iy.1572321421811299564" value="J*.java" />
        </node>
      </node>
    </node>
    <node role="element" roleId="k1iy.1572321421811416508" type="k1iy.EntryPoint" typeId="k1iy.1572321421811292807" id="7046856741208290909">
      <link role="entryPoint" roleId="k1iy.1572321421811292808" targetNodeId="gtag.1880762541167901524" resolveInfo="GWTDemo" />
    </node>
    <node role="renameTo" roleId="k1iy.1572321421813882749" type="k1iy.RenameTo" typeId="k1iy.1572321421813875986" id="7046856741208290892">
      <property name="value" nameId="k1iy.1572321421813882746" value="uidemo" />
    </node>
  </root>
  <root id="7001216437968616991">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7001216437968619200">
      <property name="name" nameId="tpck.1169194664001" value="buildUI" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7001216437968619201" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7001216437968619202" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7001216437968619203">
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="7001216437968619210">
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="7001216437968619212">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="7001216437968647893">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7001216437968619238" resolveInfo="Hyperlink" />
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="7001216437968701599">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.6196826443637184763" resolveInfo="href" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="7001216437968701601">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7001216437968701603">
                    <property name="value" nameId="tpee.1070475926801" value="Vertical" />
                  </node>
                </node>
              </node>
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="7001216437968701604">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7001216437968645434" resolveInfo="historyToken" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="7001216437968701606">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7001216437968701608">
                    <property name="value" nameId="tpee.1070475926801" value="vertical" />
                  </node>
                </node>
              </node>
              <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="7001216437968739824">
                <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="7001216437968739826">
                  <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="7001216437968739827">
                    <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="7001216437968739828">
                      <property name="name" nameId="tpck.1169194664001" value="event" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754489946" />
                    </node>
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="7001216437968739830">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7001216437968739864">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7001216437968739865">
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7001216437968739866">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4917245576577604705" resolveInfo="verticalPanel" />
                          </node>
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7001216437968739867" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577605386">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7001216437968619238" resolveInfo="Hyperlink" />
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577605387">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.6196826443637184763" resolveInfo="href" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577605388">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577605389">
                    <property name="value" nameId="tpee.1070475926801" value="Horizontal" />
                  </node>
                </node>
              </node>
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577605390">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7001216437968645434" resolveInfo="historyToken" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577605391">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577605392">
                    <property name="value" nameId="tpee.1070475926801" value="horizontal" />
                  </node>
                </node>
              </node>
              <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="4917245576577605393">
                <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="4917245576577605394">
                  <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="4917245576577605395">
                    <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="4917245576577605396">
                      <property name="name" nameId="tpck.1169194664001" value="event" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490252" />
                    </node>
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605398">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4917245576577605399">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4917245576577605400">
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4917245576577605401">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4917245576577604887" resolveInfo="horizontalPanel" />
                          </node>
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4917245576577605402" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577605405">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7001216437968619238" resolveInfo="Hyperlink" />
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577605406">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.6196826443637184763" resolveInfo="href" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577605407">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577605408">
                    <property name="value" nameId="tpee.1070475926801" value="Dock" />
                  </node>
                </node>
              </node>
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577605409">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7001216437968645434" resolveInfo="historyToken" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577605410">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577605411">
                    <property name="value" nameId="tpee.1070475926801" value="dock" />
                  </node>
                </node>
              </node>
              <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="4917245576577605412">
                <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="4917245576577605413">
                  <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="4917245576577605414">
                    <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="4917245576577605415">
                      <property name="name" nameId="tpck.1169194664001" value="event" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754489707" />
                    </node>
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605417">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4917245576577605418">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4917245576577605419">
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4917245576577605420">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4917245576577605069" resolveInfo="dockPanel" />
                          </node>
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4917245576577605421" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577605424">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7001216437968619238" resolveInfo="Hyperlink" />
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577605425">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.6196826443637184763" resolveInfo="href" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577605426">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577605427">
                    <property name="value" nameId="tpee.1070475926801" value="Flow" />
                  </node>
                </node>
              </node>
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577605428">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7001216437968645434" resolveInfo="historyToken" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577605429">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577605430">
                    <property name="value" nameId="tpee.1070475926801" value="flow" />
                  </node>
                </node>
              </node>
              <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="4917245576577605431">
                <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="4917245576577605432">
                  <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="4917245576577605433">
                    <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="4917245576577605434">
                      <property name="name" nameId="tpck.1169194664001" value="event" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490478" />
                    </node>
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605436">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4917245576577605437">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4917245576577605438">
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4917245576577605439">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="7001216437968619217" resolveInfo="flowPanel" />
                          </node>
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4917245576577605440" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="3120418922187560524">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7001216437968619238" resolveInfo="Hyperlink" />
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="3120418922187560525">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.6196826443637184763" resolveInfo="href" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="3120418922187560526">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3120418922187560527">
                    <property name="value" nameId="tpee.1070475926801" value="Layout" />
                  </node>
                </node>
              </node>
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="3120418922187560528">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7001216437968645434" resolveInfo="historyToken" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="3120418922187560529">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3120418922187560530">
                    <property name="value" nameId="tpee.1070475926801" value="layout" />
                  </node>
                </node>
              </node>
              <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="3120418922187560531">
                <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="3120418922187560532">
                  <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="3120418922187560533">
                    <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="3120418922187560534">
                      <property name="name" nameId="tpck.1169194664001" value="event" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490553" />
                    </node>
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="3120418922187560536">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3120418922187560537">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3120418922187560538">
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3120418922187560539">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2663453265346430508" resolveInfo="layoutPanel" />
                          </node>
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="3120418922187560540" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="6107522156819412249">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7001216437968619238" resolveInfo="Hyperlink" />
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="6107522156819412250">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.6196826443637184763" resolveInfo="href" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="6107522156819412251">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6107522156819412252">
                    <property name="value" nameId="tpee.1070475926801" value="Grid" />
                  </node>
                </node>
              </node>
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="6107522156819412253">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7001216437968645434" resolveInfo="historyToken" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="6107522156819412254">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6107522156819412255">
                    <property name="value" nameId="tpee.1070475926801" value="grid" />
                  </node>
                </node>
              </node>
              <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="6107522156819412256">
                <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="6107522156819412257">
                  <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="6107522156819412258">
                    <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="6107522156819412259">
                      <property name="name" nameId="tpck.1169194664001" value="event" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490294" />
                    </node>
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="6107522156819412261">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6107522156819412262">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6107522156819412263">
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6107522156819412264">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8508807536211587315" resolveInfo="gridLayoutPanel" />
                          </node>
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6107522156819412265" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="context" roleId="fb0y.8923564134257084384" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7001216437968619231">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7001216437968619224" resolveInfo="menu" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="6107522156819411903" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7001216437968619224">
        <property name="name" nameId="tpck.1169194664001" value="menu" />
        <node role="type" roleId="tpee.5680397130376446158" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="7001216437968619225">
          <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
          <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.7421785601023770754" resolveInfo="Panel" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4917245576577604705">
      <property name="name" nameId="tpck.1169194664001" value="verticalPanel" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4917245576577604706" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4917245576577604707" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577604708">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4917245576577604709">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4917245576577604710">
            <property name="name" nameId="tpck.1169194664001" value="dc" />
            <property name="isFinal" nameId="tpee.1176718929932" value="true" />
            <node role="type" roleId="tpee.5680397130376446158" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="4917245576577604711">
              <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
              <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.380233880019413653" resolveInfo="center" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4917245576577604712">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4917245576577604713">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4917245576577604714" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4917245576577604715">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="4917245576577584037" resolveInfo="uidemo" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4917245576577604716">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4917245576577584056" resolveInfo="getDemoContainer" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="4917245576577604717">
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577604718">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ClearCompartmentStatement" typeId="fb0y.4981225789808986371" id="4917245576577604719" />
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577604720">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.6424935405034500197" resolveInfo="TabbedPanel" />
              <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="4917245576577604721">
                <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.6424935405034500198" resolveInfo="tabs" />
                <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577604722">
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="7617727720684691789">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7617727720684691215" resolveInfo="FillPanel" />
                    <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="7617727720684691792">
                      <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.4850120319523368884" resolveInfo="child" />
                      <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="7617727720684691793">
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577604723">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.4007322171505962920" resolveInfo="VerticalPanel" />
                          <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="4917245576577604726">
                            <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                            <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577604727">
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577604728">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770748" resolveInfo="RadioButton" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577604729">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577604730">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577604731">
                                      <property name="value" nameId="tpee.1070475926801" value="Stage 1" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577604732">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770748" resolveInfo="RadioButton" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577604733">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577604734">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577604735">
                                      <property name="value" nameId="tpee.1070475926801" value="Stage 2" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577604736">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770748" resolveInfo="RadioButton" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577604737">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577604738">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577604739">
                                      <property name="value" nameId="tpee.1070475926801" value="Stage 3" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="7617727720684702915">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.6424935405034832713" resolveInfo="name" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7617727720684702916">
                        <property name="value" nameId="tpee.1070475926801" value="Vertical" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ForceLayoutStatement" typeId="fb0y.6653319296676631683" id="873604604379988759" />
          </node>
          <node role="context" roleId="fb0y.8923564134257084384" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4917245576577604880">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4917245576577604710" resolveInfo="dc" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4917245576577604887">
      <property name="name" nameId="tpck.1169194664001" value="horizontalPanel" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4917245576577604888" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4917245576577604889" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577604890">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4917245576577604891">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4917245576577604892">
            <property name="name" nameId="tpck.1169194664001" value="dc" />
            <property name="isFinal" nameId="tpee.1176718929932" value="true" />
            <node role="type" roleId="tpee.5680397130376446158" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="4917245576577604893">
              <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
              <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.380233880019413653" resolveInfo="center" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4917245576577604894">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4917245576577604895">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4917245576577604896" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4917245576577604897">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="4917245576577584037" resolveInfo="uidemo" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4917245576577604898">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4917245576577584056" resolveInfo="getDemoContainer" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="4917245576577604899">
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577604900">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ClearCompartmentStatement" typeId="fb0y.4981225789808986371" id="4917245576577604901" />
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577604902">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.6424935405034500197" resolveInfo="TabbedPanel" />
              <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="4917245576577604903">
                <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.6424935405034500198" resolveInfo="tabs" />
                <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577604904">
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="7617727720684484289">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7617727720684691215" resolveInfo="FillPanel" />
                    <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="7617727720684484292">
                      <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.4850120319523368884" resolveInfo="child" />
                      <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="7617727720684484293">
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577604922">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.352695393470301153" resolveInfo="HorizontalPanel" />
                          <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="4917245576577604925">
                            <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.6196826443637826585" resolveInfo="line" />
                            <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577604926">
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577604927">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577604928">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577604929">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577604930">
                                      <property name="value" nameId="tpee.1070475926801" value="Button1" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577604931">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577604932">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577604933">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577604934">
                                      <property name="value" nameId="tpee.1070475926801" value="Button2" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577604935">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577604936">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577604937">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577604938">
                                      <property name="value" nameId="tpee.1070475926801" value="Button3" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577604939">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577604940">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577604941">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577604942">
                                      <property name="value" nameId="tpee.1070475926801" value="Button4" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577604943">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577604944">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577604945">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577604946">
                                      <property name="value" nameId="tpee.1070475926801" value="Button5" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="7617727720684503796">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.6424935405034832713" resolveInfo="name" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7617727720684503797">
                        <property name="value" nameId="tpee.1070475926801" value="Horizontal" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ForceLayoutStatement" typeId="fb0y.6653319296676631683" id="873604604379988754" />
          </node>
          <node role="context" roleId="fb0y.8923564134257084384" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4917245576577605062">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4917245576577604892" resolveInfo="dc" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4917245576577605069">
      <property name="name" nameId="tpck.1169194664001" value="dockPanel" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4917245576577605070" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4917245576577605071" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605072">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4917245576577605073">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4917245576577605074">
            <property name="name" nameId="tpck.1169194664001" value="dc" />
            <property name="isFinal" nameId="tpee.1176718929932" value="true" />
            <node role="type" roleId="tpee.5680397130376446158" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="4917245576577605075">
              <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.380233880019413653" resolveInfo="center" />
              <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4917245576577605076">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4917245576577605077">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4917245576577605078" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4917245576577605079">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="4917245576577584037" resolveInfo="uidemo" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4917245576577605080">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4917245576577584056" resolveInfo="getDemoContainer" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="4917245576577605081">
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605082">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ClearCompartmentStatement" typeId="fb0y.4981225789808986371" id="4917245576577605083" />
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577605084">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.6424935405034500197" resolveInfo="TabbedPanel" />
              <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="4917245576577605085">
                <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.6424935405034500198" resolveInfo="tabs" />
                <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605086">
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577605129">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
                    <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="4917245576577605130">
                      <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.262873202871571544" resolveInfo="north" />
                      <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605131">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4917245576577605132">
                          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4917245576577605133">
                            <property name="name" nameId="tpck.1169194664001" value="cmp1" />
                            <node role="type" roleId="tpee.5680397130376446158" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="4917245576577605134">
                              <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
                              <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.262873202871571544" resolveInfo="north" />
                            </node>
                            <node role="initializer" roleId="tpee.1068431790190" type="fb0y.EnclosingContextCompartmentExpression" typeId="fb0y.5776545240964029369" id="4917245576577605135" />
                          </node>
                        </node>
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577605136">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                          <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577605137">
                            <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                            <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577605138">
                              <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577605139">
                                <property name="value" nameId="tpee.1070475926801" value="North" />
                              </node>
                            </node>
                          </node>
                          <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="4917245576577605140">
                            <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                            <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="4917245576577605141">
                              <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="4917245576577605142">
                                <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="4917245576577605143">
                                  <property name="name" nameId="tpck.1169194664001" value="event" />
                                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754489778" />
                                </node>
                                <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605145">
                                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="4917245576577605146">
                                    <node role="context" roleId="fb0y.8923564134257084384" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4917245576577605147">
                                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4917245576577605133" resolveInfo="cmp1" />
                                    </node>
                                    <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605148">
                                      <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577605149">
                                        <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                        <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577605150">
                                          <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                          <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577605151">
                                            <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577605152">
                                              <property name="value" nameId="tpee.1070475926801" value="North" />
                                            </node>
                                          </node>
                                        </node>
                                        <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="4917245576577605153">
                                          <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2204726755035669284" resolveInfo="size" />
                                          <node role="value" roleId="fb0y.6424935405034937365" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4917245576577605154">
                                            <property name="value" nameId="tpee.1068580320021" value="2" />
                                          </node>
                                        </node>
                                      </node>
                                      <node role="statement" roleId="tpee.1068581517665" type="fb0y.ForceLayoutStatement" typeId="fb0y.6653319296676631683" id="4917245576577605155" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="4917245576577605156">
                            <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2204726755035669284" resolveInfo="size" />
                            <node role="value" roleId="fb0y.6424935405034937365" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4917245576577605157">
                              <property name="value" nameId="tpee.1068580320021" value="2" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="4917245576577605158">
                      <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.262873202871571545" resolveInfo="south" />
                      <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605159">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4917245576577605160">
                          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4917245576577605161">
                            <property name="name" nameId="tpck.1169194664001" value="cmp2" />
                            <node role="type" roleId="tpee.5680397130376446158" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="4917245576577605162">
                              <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.262873202871571545" resolveInfo="south" />
                              <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
                            </node>
                            <node role="initializer" roleId="tpee.1068431790190" type="fb0y.EnclosingContextCompartmentExpression" typeId="fb0y.5776545240964029369" id="4917245576577605163" />
                          </node>
                        </node>
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577605164">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                          <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577605165">
                            <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                            <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577605166">
                              <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577605167">
                                <property name="value" nameId="tpee.1070475926801" value="South" />
                              </node>
                            </node>
                          </node>
                          <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="4917245576577605168">
                            <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                            <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="4917245576577605169">
                              <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="4917245576577605170">
                                <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="4917245576577605171">
                                  <property name="name" nameId="tpck.1169194664001" value="event" />
                                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490082" />
                                </node>
                                <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605173">
                                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="4917245576577605174">
                                    <node role="context" roleId="fb0y.8923564134257084384" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4917245576577605175">
                                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4917245576577605161" resolveInfo="cmp2" />
                                    </node>
                                    <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605176">
                                      <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577605177">
                                        <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                        <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577605178">
                                          <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                          <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577605179">
                                            <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577605180">
                                              <property name="value" nameId="tpee.1070475926801" value="South" />
                                            </node>
                                          </node>
                                        </node>
                                        <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="4917245576577605181">
                                          <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2204726755035669288" resolveInfo="size" />
                                          <node role="value" roleId="fb0y.6424935405034937365" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4917245576577605182">
                                            <property name="value" nameId="tpee.1068580320021" value="2" />
                                          </node>
                                        </node>
                                      </node>
                                      <node role="statement" roleId="tpee.1068581517665" type="fb0y.ForceLayoutStatement" typeId="fb0y.6653319296676631683" id="4917245576577605183" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="4917245576577605184">
                            <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2204726755035669288" resolveInfo="size" />
                            <node role="value" roleId="fb0y.6424935405034937365" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4917245576577605185">
                              <property name="value" nameId="tpee.1068580320021" value="2" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="4917245576577605186">
                      <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.262873202871571546" resolveInfo="east" />
                      <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605187">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4917245576577605188">
                          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4917245576577605189">
                            <property name="name" nameId="tpck.1169194664001" value="cmp3" />
                            <node role="type" roleId="tpee.5680397130376446158" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="4917245576577605190">
                              <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
                              <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.262873202871571546" resolveInfo="east" />
                            </node>
                            <node role="initializer" roleId="tpee.1068431790190" type="fb0y.EnclosingContextCompartmentExpression" typeId="fb0y.5776545240964029369" id="4917245576577605191" />
                          </node>
                        </node>
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577605192">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                          <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577605193">
                            <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                            <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577605194">
                              <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577605195">
                                <property name="value" nameId="tpee.1070475926801" value="East" />
                              </node>
                            </node>
                          </node>
                          <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="4917245576577605196">
                            <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                            <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="4917245576577605197">
                              <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="4917245576577605198">
                                <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="4917245576577605199">
                                  <property name="name" nameId="tpck.1169194664001" value="event" />
                                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754489584" />
                                </node>
                                <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605201">
                                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="4917245576577605202">
                                    <node role="context" roleId="fb0y.8923564134257084384" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4917245576577605203">
                                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4917245576577605189" resolveInfo="cmp3" />
                                    </node>
                                    <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605204">
                                      <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577605205">
                                        <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                        <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577605206">
                                          <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                          <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577605207">
                                            <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577605208">
                                              <property name="value" nameId="tpee.1070475926801" value="East" />
                                            </node>
                                          </node>
                                        </node>
                                        <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="4917245576577605209">
                                          <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2204726755035669291" resolveInfo="size" />
                                          <node role="value" roleId="fb0y.6424935405034937365" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4917245576577605210">
                                            <property name="value" nameId="tpee.1068580320021" value="8" />
                                          </node>
                                        </node>
                                      </node>
                                      <node role="statement" roleId="tpee.1068581517665" type="fb0y.ForceLayoutStatement" typeId="fb0y.6653319296676631683" id="4917245576577605211" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="4917245576577605212">
                            <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2204726755035669291" resolveInfo="size" />
                            <node role="value" roleId="fb0y.6424935405034937365" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4917245576577605213">
                              <property name="value" nameId="tpee.1068580320021" value="8" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="4917245576577605214">
                      <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.262873202871571548" resolveInfo="west" />
                      <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605215">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4917245576577605216">
                          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4917245576577605217">
                            <property name="name" nameId="tpck.1169194664001" value="cmp4" />
                            <node role="type" roleId="tpee.5680397130376446158" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="4917245576577605218">
                              <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.262873202871571548" resolveInfo="west" />
                              <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
                            </node>
                            <node role="initializer" roleId="tpee.1068431790190" type="fb0y.EnclosingContextCompartmentExpression" typeId="fb0y.5776545240964029369" id="4917245576577605219" />
                          </node>
                        </node>
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577605220">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                          <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577605221">
                            <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                            <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577605222">
                              <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577605223">
                                <property name="value" nameId="tpee.1070475926801" value="West" />
                              </node>
                            </node>
                          </node>
                          <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="4917245576577605224">
                            <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                            <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="4917245576577605225">
                              <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="4917245576577605226">
                                <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="4917245576577605227">
                                  <property name="name" nameId="tpck.1169194664001" value="event" />
                                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490037" />
                                </node>
                                <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605229">
                                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="4917245576577605230">
                                    <node role="context" roleId="fb0y.8923564134257084384" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4917245576577605231">
                                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4917245576577605217" resolveInfo="cmp4" />
                                    </node>
                                    <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605232">
                                      <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577605233">
                                        <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                        <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577605234">
                                          <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                          <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577605235">
                                            <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577605236">
                                              <property name="value" nameId="tpee.1070475926801" value="West" />
                                            </node>
                                          </node>
                                        </node>
                                        <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="4917245576577605237">
                                          <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2204726755035669294" resolveInfo="size" />
                                          <node role="value" roleId="fb0y.6424935405034937365" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4917245576577605238">
                                            <property name="value" nameId="tpee.1068580320021" value="8" />
                                          </node>
                                        </node>
                                      </node>
                                      <node role="statement" roleId="tpee.1068581517665" type="fb0y.ForceLayoutStatement" typeId="fb0y.6653319296676631683" id="4917245576577605239" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="4917245576577605240">
                            <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2204726755035669294" resolveInfo="size" />
                            <node role="value" roleId="fb0y.6424935405034937365" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4917245576577605241">
                              <property name="value" nameId="tpee.1068580320021" value="8" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="4917245576577605242">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.6424935405034832713" resolveInfo="name" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577605243">
                        <property name="value" nameId="tpee.1070475926801" value="Dock" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ForceLayoutStatement" typeId="fb0y.6653319296676631683" id="873604604379988749" />
          </node>
          <node role="context" roleId="fb0y.8923564134257084384" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4917245576577605244">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4917245576577605074" resolveInfo="dc" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7001216437968619217">
      <property name="name" nameId="tpck.1169194664001" value="flowPanel" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7001216437968619218" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7001216437968619219" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7001216437968619220">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4917245576577590983">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4917245576577590984">
            <property name="name" nameId="tpck.1169194664001" value="dc" />
            <property name="isFinal" nameId="tpee.1176718929932" value="true" />
            <node role="type" roleId="tpee.5680397130376446158" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="4917245576577590985">
              <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.380233880019413653" resolveInfo="center" />
              <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4917245576577590986">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4917245576577590987">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4917245576577590988" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4917245576577590989">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="4917245576577584037" resolveInfo="uidemo" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4917245576577590990">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4917245576577584056" resolveInfo="getDemoContainer" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="7001216437968619233">
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="7001216437968619235">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ClearCompartmentStatement" typeId="fb0y.4981225789808986371" id="7001216437968739893" />
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="7001216437968739912">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.6424935405034500197" resolveInfo="TabbedPanel" />
              <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="7001216437968739917">
                <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.6424935405034500198" resolveInfo="tabs" />
                <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="7001216437968739918">
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577605305">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.4917245576577583971" resolveInfo="FlowPanel" />
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="4917245576577605308">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.6424935405034832713" resolveInfo="name" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577605314">
                        <property name="value" nameId="tpee.1070475926801" value="Flow" />
                      </node>
                    </node>
                    <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="4917245576577605317">
                      <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                      <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605318">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="4917245576577605321">
                          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4917245576577605322">
                            <property name="name" nameId="tpck.1169194664001" value="i" />
                            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4917245576577605327" />
                            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4917245576577605333">
                              <property name="value" nameId="tpee.1068580320021" value="1" />
                            </node>
                          </node>
                          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="4917245576577605324">
                            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4917245576577605352">
                              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="4917245576577605355">
                                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="4917245576577605359">
                                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4917245576577605370">
                                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4917245576577605379">
                                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4917245576577605322" resolveInfo="i" />
                                    </node>
                                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4917245576577605363">
                                      <property name="value" nameId="tpee.1070475926801" value="Button" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanOrEqualsExpression" typeId="tpee.1153422305557" id="4917245576577605339">
                            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4917245576577605344">
                              <property name="value" nameId="tpee.1068580320021" value="100" />
                            </node>
                            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4917245576577605336">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4917245576577605322" resolveInfo="i" />
                            </node>
                          </node>
                          <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="4917245576577605348">
                            <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4917245576577605349">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4917245576577605322" resolveInfo="i" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ForceLayoutStatement" typeId="fb0y.6653319296676631683" id="873604604379988740" />
          </node>
          <node role="context" roleId="fb0y.8923564134257084384" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4917245576577590991">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4917245576577590984" resolveInfo="dc" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2663453265346430508">
      <property name="name" nameId="tpck.1169194664001" value="layoutPanel" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2663453265346430509" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2663453265346430510" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2663453265346430511">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2663453265346430512">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2663453265346430513">
            <property name="name" nameId="tpck.1169194664001" value="dc" />
            <property name="isFinal" nameId="tpee.1176718929932" value="true" />
            <node role="type" roleId="tpee.5680397130376446158" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="2663453265346430514">
              <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
              <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.380233880019413653" resolveInfo="center" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2663453265346430515">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2663453265346430516">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2663453265346430517" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2663453265346430518">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="4917245576577584037" resolveInfo="uidemo" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2663453265346430519">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4917245576577584056" resolveInfo="getDemoContainer" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="2663453265346430520">
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="2663453265346430521">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ClearCompartmentStatement" typeId="fb0y.4981225789808986371" id="2663453265346430522" />
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="3120418922187570604">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.6424935405034500197" resolveInfo="TabbedPanel" />
              <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="3120418922187570607">
                <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.6424935405034500198" resolveInfo="tabs" />
                <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="3120418922187570608">
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="2925275022462354340">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7617727720684691215" resolveInfo="FillPanel" />
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="2925275022462354345">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.6424935405034832713" resolveInfo="name" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2925275022462354346">
                        <property name="value" nameId="tpee.1070475926801" value="Layout" />
                      </node>
                    </node>
                    <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="2925275022462354349">
                      <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.4850120319523368884" resolveInfo="child" />
                      <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="2925275022462354350">
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="2663453265346430523">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.2663453265346089636" resolveInfo="LayoutPanel" />
                          <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="2663453265346451899">
                            <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.2663453265346089637" resolveInfo="layoutChildren" />
                            <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="2663453265346488294">
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="2663453265346488295">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="3120418922187550752">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="3120418922187550754">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3120418922187550756">
                                      <property name="value" nameId="tpee.1070475926801" value="Button #1" />
                                    </node>
                                  </node>
                                </node>
                                <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="2663453265346488296">
                                  <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2663453265346089638" resolveInfo="cons" />
                                  <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="2663453265347082201">
                                    <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.BoxLayoutConstraint" typeId="sqp9.2663453265346256985" id="2663453265347082202">
                                      <node role="hConstraint" roleId="sqp9.2663453265346257008" type="sqp9.HorizontalConstraint" typeId="sqp9.2663453265345747738" id="2663453265347082203">
                                        <node role="left" roleId="sqp9.2663453265345747761" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="2663453265348159934">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684387396">
                                            <property name="value" nameId="tpee.1068580320021" value="0" />
                                          </node>
                                        </node>
                                        <node role="width" roleId="sqp9.2663453265345747806" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397531">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397532">
                                            <property name="value" nameId="tpee.1068580320021" value="80" />
                                          </node>
                                        </node>
                                      </node>
                                      <node role="vConstraint" roleId="sqp9.2663453265346257075" type="sqp9.VerticalConstraint" typeId="sqp9.2663453265345756447" id="2663453265347082204">
                                        <node role="top" roleId="sqp9.2663453265345756470" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="5052799592146212635">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5052799592146212636">
                                            <property name="value" nameId="tpee.1068580320021" value="0" />
                                          </node>
                                        </node>
                                        <node role="height" roleId="sqp9.2663453265345756504" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397595">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397596">
                                            <property name="value" nameId="tpee.1068580320021" value="60" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="7617727720684397573">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="7617727720684397574">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="7617727720684397575">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7617727720684397576">
                                      <property name="value" nameId="tpee.1070475926801" value="Button #2" />
                                    </node>
                                  </node>
                                </node>
                                <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="7617727720684397577">
                                  <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2663453265346089638" resolveInfo="cons" />
                                  <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="7617727720684397578">
                                    <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.BoxLayoutConstraint" typeId="sqp9.2663453265346256985" id="7617727720684397579">
                                      <node role="hConstraint" roleId="sqp9.2663453265346257008" type="sqp9.HorizontalConstraint" typeId="sqp9.2663453265345747738" id="7617727720684397580">
                                        <node role="left" roleId="sqp9.2663453265345747761" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397581">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397582">
                                            <property name="value" nameId="tpee.1068580320021" value="80" />
                                          </node>
                                        </node>
                                        <node role="width" roleId="sqp9.2663453265345747806" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397583">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397584">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
                                          </node>
                                        </node>
                                      </node>
                                      <node role="vConstraint" roleId="sqp9.2663453265346257075" type="sqp9.VerticalConstraint" typeId="sqp9.2663453265345756447" id="7617727720684397585">
                                        <node role="top" roleId="sqp9.2663453265345756470" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397586">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397587">
                                            <property name="value" nameId="tpee.1068580320021" value="0" />
                                          </node>
                                        </node>
                                        <node role="height" roleId="sqp9.2663453265345756504" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397604">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397605">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="7617727720684397613">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="7617727720684397614">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="7617727720684397615">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7617727720684397616">
                                      <property name="value" nameId="tpee.1070475926801" value="Button #3" />
                                    </node>
                                  </node>
                                </node>
                                <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="7617727720684397617">
                                  <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2663453265346089638" resolveInfo="cons" />
                                  <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="7617727720684397618">
                                    <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.BoxLayoutConstraint" typeId="sqp9.2663453265346256985" id="7617727720684397619">
                                      <node role="hConstraint" roleId="sqp9.2663453265346257008" type="sqp9.HorizontalConstraint" typeId="sqp9.2663453265345747738" id="7617727720684397620">
                                        <node role="left" roleId="sqp9.2663453265345747761" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397621">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397622">
                                            <property name="value" nameId="tpee.1068580320021" value="80" />
                                          </node>
                                        </node>
                                        <node role="width" roleId="sqp9.2663453265345747806" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397623">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397624">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
                                          </node>
                                        </node>
                                      </node>
                                      <node role="vConstraint" roleId="sqp9.2663453265346257075" type="sqp9.VerticalConstraint" typeId="sqp9.2663453265345756447" id="7617727720684397625">
                                        <node role="top" roleId="sqp9.2663453265345756470" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397626">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397627">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
                                          </node>
                                        </node>
                                        <node role="height" roleId="sqp9.2663453265345756504" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397628">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397629">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="7617727720684397635">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="7617727720684397636">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="7617727720684397637">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7617727720684397638">
                                      <property name="value" nameId="tpee.1070475926801" value="Button #4" />
                                    </node>
                                  </node>
                                </node>
                                <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="7617727720684397639">
                                  <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2663453265346089638" resolveInfo="cons" />
                                  <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="7617727720684397640">
                                    <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.BoxLayoutConstraint" typeId="sqp9.2663453265346256985" id="7617727720684397641">
                                      <node role="hConstraint" roleId="sqp9.2663453265346257008" type="sqp9.HorizontalConstraint" typeId="sqp9.2663453265345747738" id="7617727720684397642">
                                        <node role="left" roleId="sqp9.2663453265345747761" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397643">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397644">
                                            <property name="value" nameId="tpee.1068580320021" value="80" />
                                          </node>
                                        </node>
                                        <node role="width" roleId="sqp9.2663453265345747806" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397645">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397646">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
                                          </node>
                                        </node>
                                      </node>
                                      <node role="vConstraint" roleId="sqp9.2663453265346257075" type="sqp9.VerticalConstraint" typeId="sqp9.2663453265345756447" id="7617727720684397647">
                                        <node role="top" roleId="sqp9.2663453265345756470" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397648">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397649">
                                            <property name="value" nameId="tpee.1068580320021" value="40" />
                                          </node>
                                        </node>
                                        <node role="height" roleId="sqp9.2663453265345756504" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397650">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397651">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="7617727720684397657">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="7617727720684397658">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="7617727720684397659">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7617727720684397660">
                                      <property name="value" nameId="tpee.1070475926801" value="Button #5" />
                                    </node>
                                  </node>
                                </node>
                                <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="7617727720684397661">
                                  <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2663453265346089638" resolveInfo="cons" />
                                  <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="7617727720684397662">
                                    <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.BoxLayoutConstraint" typeId="sqp9.2663453265346256985" id="7617727720684397663">
                                      <node role="hConstraint" roleId="sqp9.2663453265346257008" type="sqp9.HorizontalConstraint" typeId="sqp9.2663453265345747738" id="7617727720684397664">
                                        <node role="left" roleId="sqp9.2663453265345747761" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397665">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397666">
                                            <property name="value" nameId="tpee.1068580320021" value="0" />
                                          </node>
                                        </node>
                                        <node role="width" roleId="sqp9.2663453265345747806" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397667">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397668">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
                                          </node>
                                        </node>
                                      </node>
                                      <node role="vConstraint" roleId="sqp9.2663453265346257075" type="sqp9.VerticalConstraint" typeId="sqp9.2663453265345756447" id="7617727720684397669">
                                        <node role="top" roleId="sqp9.2663453265345756470" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397670">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397671">
                                            <property name="value" nameId="tpee.1068580320021" value="60" />
                                          </node>
                                        </node>
                                        <node role="height" roleId="sqp9.2663453265345756504" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397672">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397673">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="7617727720684397684">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="7617727720684397685">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="7617727720684397686">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7617727720684397687">
                                      <property name="value" nameId="tpee.1070475926801" value="Button #6" />
                                    </node>
                                  </node>
                                </node>
                                <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="7617727720684397688">
                                  <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2663453265346089638" resolveInfo="cons" />
                                  <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="7617727720684397689">
                                    <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.BoxLayoutConstraint" typeId="sqp9.2663453265346256985" id="7617727720684397690">
                                      <node role="hConstraint" roleId="sqp9.2663453265346257008" type="sqp9.HorizontalConstraint" typeId="sqp9.2663453265345747738" id="7617727720684397691">
                                        <node role="left" roleId="sqp9.2663453265345747761" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397692">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397693">
                                            <property name="value" nameId="tpee.1068580320021" value="40" />
                                          </node>
                                        </node>
                                        <node role="width" roleId="sqp9.2663453265345747806" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397694">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397695">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
                                          </node>
                                        </node>
                                      </node>
                                      <node role="vConstraint" roleId="sqp9.2663453265346257075" type="sqp9.VerticalConstraint" typeId="sqp9.2663453265345756447" id="7617727720684397696">
                                        <node role="top" roleId="sqp9.2663453265345756470" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397697">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397698">
                                            <property name="value" nameId="tpee.1068580320021" value="60" />
                                          </node>
                                        </node>
                                        <node role="height" roleId="sqp9.2663453265345756504" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397699">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397700">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="7617727720684397706">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="7617727720684397707">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="7617727720684397708">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7617727720684397709">
                                      <property name="value" nameId="tpee.1070475926801" value="Button #7" />
                                    </node>
                                  </node>
                                </node>
                                <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="7617727720684397710">
                                  <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2663453265346089638" resolveInfo="cons" />
                                  <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="7617727720684397711">
                                    <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.BoxLayoutConstraint" typeId="sqp9.2663453265346256985" id="7617727720684397712">
                                      <node role="hConstraint" roleId="sqp9.2663453265346257008" type="sqp9.HorizontalConstraint" typeId="sqp9.2663453265345747738" id="7617727720684397713">
                                        <node role="left" roleId="sqp9.2663453265345747761" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397714">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397715">
                                            <property name="value" nameId="tpee.1068580320021" value="60" />
                                          </node>
                                        </node>
                                        <node role="width" roleId="sqp9.2663453265345747806" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397716">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397717">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
                                          </node>
                                        </node>
                                      </node>
                                      <node role="vConstraint" roleId="sqp9.2663453265346257075" type="sqp9.VerticalConstraint" typeId="sqp9.2663453265345756447" id="7617727720684397718">
                                        <node role="top" roleId="sqp9.2663453265345756470" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397719">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397720">
                                            <property name="value" nameId="tpee.1068580320021" value="60" />
                                          </node>
                                        </node>
                                        <node role="height" roleId="sqp9.2663453265345756504" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397721">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397722">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="7617727720684397728">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="7617727720684397729">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="7617727720684397730">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7617727720684397731">
                                      <property name="value" nameId="tpee.1070475926801" value="Button #8" />
                                    </node>
                                  </node>
                                </node>
                                <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="7617727720684397732">
                                  <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2663453265346089638" resolveInfo="cons" />
                                  <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="7617727720684397733">
                                    <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.BoxLayoutConstraint" typeId="sqp9.2663453265346256985" id="7617727720684397734">
                                      <node role="hConstraint" roleId="sqp9.2663453265346257008" type="sqp9.HorizontalConstraint" typeId="sqp9.2663453265345747738" id="7617727720684397735">
                                        <node role="left" roleId="sqp9.2663453265345747761" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397736">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397737">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
                                          </node>
                                        </node>
                                        <node role="width" roleId="sqp9.2663453265345747806" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397738">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397739">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
                                          </node>
                                        </node>
                                      </node>
                                      <node role="vConstraint" roleId="sqp9.2663453265346257075" type="sqp9.VerticalConstraint" typeId="sqp9.2663453265345756447" id="7617727720684397740">
                                        <node role="top" roleId="sqp9.2663453265345756470" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397741">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397742">
                                            <property name="value" nameId="tpee.1068580320021" value="80" />
                                          </node>
                                        </node>
                                        <node role="height" roleId="sqp9.2663453265345756504" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397743">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397744">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="7617727720684397750">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="7617727720684397751">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="7617727720684397752">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7617727720684397753">
                                      <property name="value" nameId="tpee.1070475926801" value="Button #5" />
                                    </node>
                                  </node>
                                </node>
                                <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="7617727720684397754">
                                  <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.2663453265346089638" resolveInfo="cons" />
                                  <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="7617727720684397755">
                                    <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.BoxLayoutConstraint" typeId="sqp9.2663453265346256985" id="7617727720684397756">
                                      <node role="hConstraint" roleId="sqp9.2663453265346257008" type="sqp9.HorizontalConstraint" typeId="sqp9.2663453265345747738" id="7617727720684397757">
                                        <node role="left" roleId="sqp9.2663453265345747761" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397758">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397759">
                                            <property name="value" nameId="tpee.1068580320021" value="60" />
                                          </node>
                                        </node>
                                        <node role="width" roleId="sqp9.2663453265345747806" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397760">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397761">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
                                          </node>
                                        </node>
                                      </node>
                                      <node role="vConstraint" roleId="sqp9.2663453265346257075" type="sqp9.VerticalConstraint" typeId="sqp9.2663453265345756447" id="7617727720684397762">
                                        <node role="top" roleId="sqp9.2663453265345756470" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397763">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397764">
                                            <property name="value" nameId="tpee.1068580320021" value="80" />
                                          </node>
                                        </node>
                                        <node role="height" roleId="sqp9.2663453265345756504" type="sqp9.ExpressionWithUnit" typeId="sqp9.2663453265347366854" id="7617727720684397765">
                                          <property name="unit" nameId="sqp9.2663453265347399826" value="PERCENT" />
                                          <node role="expression" roleId="sqp9.2663453265347375376" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7617727720684397766">
                                            <property name="value" nameId="tpee.1068580320021" value="20" />
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
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ForceLayoutStatement" typeId="fb0y.6653319296676631683" id="873604604379988732" />
          </node>
          <node role="context" roleId="fb0y.8923564134257084384" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2663453265346430547">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2663453265346430513" resolveInfo="dc" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="8508807536211587315">
      <property name="name" nameId="tpck.1169194664001" value="gridLayoutPanel" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8508807536211587316" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8508807536211587317" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8508807536211587318">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8508807536211587331">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8508807536211587332">
            <property name="name" nameId="tpck.1169194664001" value="dc" />
            <property name="isFinal" nameId="tpee.1176718929932" value="true" />
            <node role="type" roleId="tpee.5680397130376446158" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="8508807536211587333">
              <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.380233880019413653" resolveInfo="center" />
              <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8508807536211587334">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8508807536211587335">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="8508807536211587336" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="8508807536211587337">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="4917245576577584037" resolveInfo="uidemo" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8508807536211587338">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4917245576577584056" resolveInfo="getDemoContainer" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="8508807536211632040">
          <node role="context" roleId="fb0y.8923564134257084384" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8508807536211632043">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8508807536211587332" resolveInfo="dc" />
          </node>
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="8508807536211632042">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ClearCompartmentStatement" typeId="fb0y.4981225789808986371" id="8508807536211632044" />
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="8508807536211632046">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.6424935405034500197" resolveInfo="TabbedPanel" />
              <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="8508807536211632072">
                <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.6424935405034500198" resolveInfo="tabs" />
                <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="8508807536211632073">
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="4850120319523319670">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7617727720684691215" resolveInfo="FillPanel" />
                    <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="4850120319523319770">
                      <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.4850120319523368884" resolveInfo="child" />
                      <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="4850120319523319771">
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="8508807536211637659">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.8508807536211634698" resolveInfo="GridPanel" />
                          <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="8508807536211637663">
                            <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.8508807536211634699" resolveInfo="gridChildren" />
                            <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="8508807536211637664">
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="3711114048337684269">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="3711114048337684270">
                                  <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.8508807536211634700" resolveInfo="cell" />
                                  <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="3711114048337684271">
                                    <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.CellLayoutConstraint" typeId="sqp9.8508807536211371475" id="3711114048337684272">
                                      <node role="columnConstraint" roleId="sqp9.8508807536211444937" type="sqp9.ColumnLayoutConstraint" typeId="sqp9.8508807536211371477" id="3711114048337684273">
                                        <node role="col" roleId="sqp9.8508807536211371478" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3711114048337684274">
                                          <property name="value" nameId="tpee.1068580320021" value="2" />
                                        </node>
                                      </node>
                                      <node role="rowConstraint" roleId="sqp9.8508807536211444938" type="sqp9.RowLayoutConstraint" typeId="sqp9.8508807536211371480" id="3711114048337684275">
                                        <node role="row" roleId="sqp9.8508807536211371481" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3711114048337684276">
                                          <property name="value" nameId="tpee.1068580320021" value="2" />
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="3711114048337684277">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="3711114048337684278">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3711114048337684279">
                                      <property name="value" nameId="tpee.1070475926801" value="Whatsup?" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="8508807536211637665">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="8508807536211637666">
                                  <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.8508807536211634700" resolveInfo="cell" />
                                  <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="8508807536212125889">
                                    <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.CellLayoutConstraint" typeId="sqp9.8508807536211371475" id="8508807536212125890">
                                      <node role="columnConstraint" roleId="sqp9.8508807536211444937" type="sqp9.ColumnLayoutConstraint" typeId="sqp9.8508807536211371477" id="8508807536212125891">
                                        <node role="col" roleId="sqp9.8508807536211371478" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8508807536212125895">
                                          <property name="value" nameId="tpee.1068580320021" value="0" />
                                        </node>
                                      </node>
                                      <node role="rowConstraint" roleId="sqp9.8508807536211444938" type="sqp9.RowLayoutConstraint" typeId="sqp9.8508807536211371480" id="8508807536212125893">
                                        <node role="row" roleId="sqp9.8508807536211371481" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8508807536212125896">
                                          <property name="value" nameId="tpee.1068580320021" value="0" />
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="8508807536212334414">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="8508807536212334416">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8508807536212335070">
                                      <property name="value" nameId="tpee.1070475926801" value="Boo-hoo!" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="6107522156819412459">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                                <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="6107522156819412476">
                                  <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.8508807536211634700" resolveInfo="cell" />
                                  <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="6107522156819428001">
                                    <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.CellLayoutConstraint" typeId="sqp9.8508807536211371475" id="6107522156819428002">
                                      <node role="columnConstraint" roleId="sqp9.8508807536211444937" type="sqp9.ColumnLayoutConstraint" typeId="sqp9.8508807536211371477" id="6107522156819428003">
                                        <node role="col" roleId="sqp9.8508807536211371478" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6107522156819428023">
                                          <property name="value" nameId="tpee.1068580320021" value="1" />
                                        </node>
                                      </node>
                                      <node role="rowConstraint" roleId="sqp9.8508807536211444938" type="sqp9.RowLayoutConstraint" typeId="sqp9.8508807536211371480" id="6107522156819428005">
                                        <node role="row" roleId="sqp9.8508807536211371481" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6107522156819428040">
                                          <property name="value" nameId="tpee.1068580320021" value="1" />
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="6107522156819428057">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="6107522156819428075">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6107522156819428093">
                                      <property name="value" nameId="tpee.1070475926801" value="Let's do it!" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="4850120319523319687">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.6424935405034832713" resolveInfo="name" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4850120319523319705">
                        <property name="value" nameId="tpee.1070475926801" value="Grid" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ForceLayoutStatement" typeId="fb0y.6653319296676631683" id="4850120319524031432" />
          </node>
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7001216437968616992" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="7001216437968616993">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7001216437968616994" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7001216437968616995" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7001216437968616996">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4917245576577584040">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4917245576577584041">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4917245576577584042">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4917245576577584043" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4917245576577584044">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="4917245576577584037" resolveInfo="uidemo" />
              </node>
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4917245576577584045">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4917245576577584035" resolveInfo="uidemo" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4917245576577584035">
        <property name="name" nameId="tpck.1169194664001" value="uidemo" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4917245576577584036">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="7046856741208198715" resolveInfo="UIDemo" />
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="4917245576577584037">
      <property name="name" nameId="tpck.1169194664001" value="uidemo" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="4917245576577584038" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4917245576577584039">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="7046856741208198715" resolveInfo="UIDemo" />
      </node>
    </node>
    <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="7457204276683673704">
      <link role="annotation" roleId="tpee.1188208074048" targetNodeId="1taj.8590671622324268192" resolveInfo="GenerateVariants" />
      <node role="value" roleId="tpee.1188214630783" type="tpee.AnnotationInstanceValue" typeId="tpee.1188214545140" id="7457204276683673705">
        <link role="key" roleId="tpee.1188214555875" targetNodeId="1taj.8590671622324287920" resolveInfo="value" />
        <node role="value" roleId="tpee.1188214607812" type="tpee.ArrayLiteral" typeId="tpee.1188220165133" id="7457204276683673706">
          <node role="item" roleId="tpee.1188220173759" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7457204276683673707">
            <property name="value" nameId="tpee.1070475926801" value="GWT" />
          </node>
          <node role="item" roleId="tpee.1188220173759" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7457204276683673708">
            <property name="value" nameId="tpee.1070475926801" value="SWT" />
          </node>
          <node role="item" roleId="tpee.1188220173759" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7457204276683673709">
            <property name="value" nameId="tpee.1070475926801" value="Swing" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="1438009850184735648">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1438009850184746914">
      <property name="name" nameId="tpck.1169194664001" value="buildUI" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1438009850184746915" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1438009850184746916" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184746917">
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="1438009850184746920">
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184746921">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="1438009850184746922">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7001216437968619238" resolveInfo="Hyperlink" />
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="1438009850184746923">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.6196826443637184763" resolveInfo="href" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="1438009850184746924">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1438009850184746925">
                    <property name="value" nameId="tpee.1070475926801" value="Tree" />
                  </node>
                </node>
              </node>
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="1438009850184746926">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7001216437968645434" resolveInfo="historyToken" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="1438009850184746927">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1438009850184746928">
                    <property name="value" nameId="tpee.1070475926801" value="tree" />
                  </node>
                </node>
              </node>
              <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="1438009850184746929">
                <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="1438009850184746930">
                  <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="1438009850184746931">
                    <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="1438009850184746932">
                      <property name="name" nameId="tpck.1169194664001" value="event" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490457" />
                    </node>
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184746934">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1438009850184746935">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1438009850184746936">
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1438009850184746937">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1438009850184747019" resolveInfo="tree" />
                          </node>
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1438009850184746938" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="1438009850184817044">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7001216437968619238" resolveInfo="Hyperlink" />
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="1438009850184817045">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.6196826443637184763" resolveInfo="href" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="1438009850184817046">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1438009850184817047">
                    <property name="value" nameId="tpee.1070475926801" value="Table" />
                  </node>
                </node>
              </node>
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="1438009850184817048">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7001216437968645434" resolveInfo="historyToken" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="1438009850184817049">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1438009850184817050">
                    <property name="value" nameId="tpee.1070475926801" value="tree" />
                  </node>
                </node>
              </node>
              <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="1438009850184817051">
                <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="1438009850184817052">
                  <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="1438009850184817053">
                    <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="1438009850184817054">
                      <property name="name" nameId="tpck.1169194664001" value="event" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490195" />
                    </node>
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184817056">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1438009850184817057">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1438009850184817058">
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1438009850184817059">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1438009850184816934" resolveInfo="table" />
                          </node>
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1438009850184817060" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="context" roleId="fb0y.8923564134257084384" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1438009850184747007">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1438009850184746918" resolveInfo="menu" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1438009850184746918">
        <property name="name" nameId="tpck.1169194664001" value="menu" />
        <node role="type" roleId="tpee.5680397130376446158" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="1438009850184746919">
          <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
          <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.7421785601023770754" resolveInfo="Panel" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1438009850184747019">
      <property name="name" nameId="tpck.1169194664001" value="tree" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1438009850184747020" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1438009850184747021" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184747022">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1438009850184747023">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1438009850184747024">
            <property name="name" nameId="tpck.1169194664001" value="dc" />
            <property name="isFinal" nameId="tpee.1176718929932" value="true" />
            <node role="type" roleId="tpee.5680397130376446158" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="1438009850184747025">
              <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
              <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.380233880019413653" resolveInfo="center" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1438009850184747026">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1438009850184747027">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1438009850184747028" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1438009850184747029">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="1438009850184746905" resolveInfo="uidemo" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1438009850184747030">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4917245576577584056" resolveInfo="getDemoContainer" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="1438009850184747031">
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184747032">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ClearCompartmentStatement" typeId="fb0y.4981225789808986371" id="1438009850184747033" />
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="1438009850184747034">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.6424935405034500197" resolveInfo="TabbedPanel" />
              <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="1438009850184747035">
                <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.6424935405034500198" resolveInfo="tabs" />
                <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184747036">
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="1438009850184747037">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7617727720684691215" resolveInfo="FillPanel" />
                    <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="1438009850184747038">
                      <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                      <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184747039">
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="1438009850184747077">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.6399754879758206688" resolveInfo="Tree" />
                          <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="1438009850184747078">
                            <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.6399754879758206689" resolveInfo="root" />
                            <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184747079">
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="1438009850184747080">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7936848552255362162" resolveInfo="RootTreeNode" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="1438009850184747081">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7936848552255362160" resolveInfo="userObject" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="1438009850184747082">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1438009850184747083">
                                      <property name="value" nameId="tpee.1070475926801" value="ROOT" />
                                    </node>
                                  </node>
                                </node>
                                <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="1438009850184747084">
                                  <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7936848552255362159" resolveInfo="children" />
                                  <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184747085">
                                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="1438009850184747086">
                                      <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1438009850184747087">
                                        <property name="name" nameId="tpck.1169194664001" value="i" />
                                        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1438009850184747088" />
                                        <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1438009850184747089">
                                          <property name="value" nameId="tpee.1068580320021" value="0" />
                                        </node>
                                      </node>
                                      <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184747090">
                                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="1438009850184747091">
                                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.6399754879758206671" resolveInfo="TreeNode" />
                                          <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="1438009850184747092">
                                            <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7936848552255362160" resolveInfo="userObject" />
                                            <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="1438009850184747093">
                                              <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1438009850184747094">
                                                <property name="value" nameId="tpee.1070475926801" value="Leaf" />
                                              </node>
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                      <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="1438009850184747095">
                                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1438009850184747096">
                                          <property name="value" nameId="tpee.1068580320021" value="5" />
                                        </node>
                                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1438009850184747097">
                                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1438009850184747087" resolveInfo="i" />
                                        </node>
                                      </node>
                                      <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="1438009850184747098">
                                        <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1438009850184747099">
                                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1438009850184747087" resolveInfo="i" />
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
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="1438009850184747055">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.6424935405034832713" resolveInfo="name" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1438009850184747056">
                        <property name="value" nameId="tpee.1070475926801" value="Tree" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ForceLayoutStatement" typeId="fb0y.6653319296676631683" id="1438009850184747057" />
          </node>
          <node role="context" roleId="fb0y.8923564134257084384" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1438009850184747058">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1438009850184747024" resolveInfo="dc" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1438009850184816934">
      <property name="name" nameId="tpck.1169194664001" value="table" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1438009850184816935" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1438009850184816936" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184816937">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1438009850184816938">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1438009850184816939">
            <property name="name" nameId="tpck.1169194664001" value="dc" />
            <property name="isFinal" nameId="tpee.1176718929932" value="true" />
            <node role="type" roleId="tpee.5680397130376446158" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="1438009850184816940">
              <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.380233880019413653" resolveInfo="center" />
              <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1438009850184816941">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1438009850184816942">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1438009850184816943" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1438009850184816944">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="1438009850184746905" resolveInfo="uidemo" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1438009850184816945">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4917245576577584056" resolveInfo="getDemoContainer" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="1438009850184816946">
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184816947">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ClearCompartmentStatement" typeId="fb0y.4981225789808986371" id="1438009850184816948" />
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="1438009850184816949">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.6424935405034500197" resolveInfo="TabbedPanel" />
              <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="1438009850184816950">
                <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.6424935405034500198" resolveInfo="tabs" />
                <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184816951">
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="1438009850184816952">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7617727720684691215" resolveInfo="FillPanel" />
                    <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="1438009850184816953">
                      <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                      <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184816954">
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="1438009850184816989">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.3616339824038852574" resolveInfo="Table" />
                          <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="1438009850184816990">
                            <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.3616339824038886159" resolveInfo="columns" />
                            <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184816991">
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="1438009850184816992">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.3616339824038886161" resolveInfo="TableColumn" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="1438009850184816993">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.3616339824038886162" resolveInfo="name" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="1438009850184816994">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1438009850184816995">
                                      <property name="value" nameId="tpee.1070475926801" value="Foo" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="1438009850184816996">
                                <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.3616339824038886161" resolveInfo="TableColumn" />
                                <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="1438009850184816997">
                                  <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.3616339824038886162" resolveInfo="name" />
                                  <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="1438009850184816998">
                                    <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1438009850184816999">
                                      <property name="value" nameId="tpee.1070475926801" value="Bar" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="1438009850184817000">
                            <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.3616339824038886160" resolveInfo="rows" />
                            <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184817001">
                              <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="1438009850184817002">
                                <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184817003">
                                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="1438009850184817004">
                                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.3616339824038886165" resolveInfo="TableRow" />
                                    <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="1438009850184817005">
                                      <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.3616339824038886166" resolveInfo="data" />
                                      <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="1438009850184817006">
                                        <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1438009850184817007">
                                          <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="1438009850184817008">
                                            <node role="initValue" roleId="tpee.1154542803372" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1438009850184817009">
                                              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1438009850184817010">
                                                <node role="expression" roleId="tpee.1079359253376" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1438009850184817011">
                                                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1438009850184817012">
                                                    <property name="value" nameId="tpee.1068580320021" value="32" />
                                                  </node>
                                                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1438009850184817013">
                                                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1438009850184817025" resolveInfo="i" />
                                                  </node>
                                                </node>
                                              </node>
                                              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1438009850184817014" />
                                            </node>
                                            <node role="initValue" roleId="tpee.1154542803372" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1438009850184817015">
                                              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1438009850184817016">
                                                <property name="value" nameId="tpee.1070475926801" value="" />
                                              </node>
                                              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1438009850184817017">
                                                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Character%dvalueOf(char)%cjava%dlang%dCharacter" resolveInfo="valueOf" />
                                                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Character" resolveInfo="Character" />
                                                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1438009850184817018">
                                                  <node role="expression" roleId="tpee.1070534934092" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1438009850184817019">
                                                    <node role="expression" roleId="tpee.1079359253376" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1438009850184817020">
                                                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1438009850184817021">
                                                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1438009850184817025" resolveInfo="i" />
                                                      </node>
                                                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.CharConstant" typeId="tpee.1200397529627" id="1438009850184817022">
                                                        <property name="charConstant" nameId="tpee.1200397540847" value=" " />
                                                      </node>
                                                    </node>
                                                  </node>
                                                  <node role="type" roleId="tpee.1070534934091" type="tpee.CharType" typeId="tpee.1070534555686" id="1438009850184817023" />
                                                </node>
                                              </node>
                                            </node>
                                            <node role="componentType" roleId="tpee.1154542793668" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1438009850184817024">
                                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                                <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1438009850184817025">
                                  <property name="name" nameId="tpck.1169194664001" value="i" />
                                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1438009850184817026" />
                                  <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1438009850184817027">
                                    <property name="value" nameId="tpee.1068580320021" value="0" />
                                  </node>
                                </node>
                                <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="1438009850184817028">
                                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1438009850184817029">
                                    <property name="value" nameId="tpee.1068580320021" value="128" />
                                  </node>
                                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1438009850184817030">
                                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1438009850184817025" resolveInfo="i" />
                                  </node>
                                </node>
                                <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="1438009850184817031">
                                  <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1438009850184817032">
                                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1438009850184817025" resolveInfo="i" />
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="1438009850184816978">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.6424935405034832713" resolveInfo="name" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1438009850184816979">
                        <property name="value" nameId="tpee.1070475926801" value="Tree" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ForceLayoutStatement" typeId="fb0y.6653319296676631683" id="1438009850184816980" />
          </node>
          <node role="context" roleId="fb0y.8923564134257084384" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1438009850184816981">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1438009850184816939" resolveInfo="dc" />
          </node>
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1438009850184735649" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="1438009850184735650">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1438009850184735651" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1438009850184735652" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1438009850184735653">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1438009850184746908">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1438009850184746909">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1438009850184746910">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1438009850184746911" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1438009850184746912">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="1438009850184746905" resolveInfo="uidemo" />
              </node>
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1438009850184746913">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1438009850184746903" resolveInfo="uiDemo" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1438009850184746903">
        <property name="name" nameId="tpck.1169194664001" value="uiDemo" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1438009850184746904">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="7046856741208198715" resolveInfo="UIDemo" />
        </node>
      </node>
    </node>
    <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="1438009850184735670">
      <link role="annotation" roleId="tpee.1188208074048" targetNodeId="1taj.8590671622324268192" resolveInfo="GenerateVariants" />
      <node role="value" roleId="tpee.1188214630783" type="tpee.AnnotationInstanceValue" typeId="tpee.1188214545140" id="1438009850184735671">
        <link role="key" roleId="tpee.1188214555875" targetNodeId="1taj.8590671622324287920" resolveInfo="value" />
        <node role="value" roleId="tpee.1188214607812" type="tpee.ArrayLiteral" typeId="tpee.1188220165133" id="1438009850184735672">
          <node role="item" roleId="tpee.1188220173759" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1438009850184735673">
            <property name="value" nameId="tpee.1070475926801" value="GWT" />
          </node>
          <node role="item" roleId="tpee.1188220173759" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1438009850184735674">
            <property name="value" nameId="tpee.1070475926801" value="SWT" />
          </node>
          <node role="item" roleId="tpee.1188220173759" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1438009850184735675">
            <property name="value" nameId="tpee.1070475926801" value="Swing" />
          </node>
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="1438009850184746905">
      <property name="name" nameId="tpck.1169194664001" value="uidemo" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="1438009850184746906" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1438009850184746907">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="7046856741208198715" resolveInfo="UIDemo" />
      </node>
    </node>
  </root>
  <root id="3546006303814922744">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="3546006303814935655">
      <property name="name" nameId="tpck.1169194664001" value="buildUI" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3546006303814935656" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3546006303814935657" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3546006303814935658">
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="3546006303814935659">
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="3546006303814935660">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="3546006303814935661">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7001216437968619238" resolveInfo="Hyperlink" />
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="3546006303814935662">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.6196826443637184763" resolveInfo="href" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="3546006303814935663">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3546006303814935664">
                    <property name="value" nameId="tpee.1070475926801" value="Dialog" />
                  </node>
                </node>
              </node>
              <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="3546006303814935665">
                <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7001216437968645434" resolveInfo="historyToken" />
                <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="3546006303814935666">
                  <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3546006303814935667">
                    <property name="value" nameId="tpee.1070475926801" value="dialog" />
                  </node>
                </node>
              </node>
              <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="3546006303814935668">
                <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="3546006303814935669">
                  <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="3546006303814935670">
                    <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="3546006303814935671">
                      <property name="name" nameId="tpck.1169194664001" value="event" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754489621" />
                    </node>
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="3546006303814935673">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3546006303814935674">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3546006303814935675">
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3546006303814935676">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3546006303814935698" resolveInfo="dialog" />
                          </node>
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="3546006303814935677" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="context" roleId="fb0y.8923564134257084384" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="3546006303814935695">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3546006303814935696" resolveInfo="menu" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="3546006303814935696">
        <property name="name" nameId="tpck.1169194664001" value="menu" />
        <node role="type" roleId="tpee.5680397130376446158" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="3546006303814935697">
          <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.7421785601023770754" resolveInfo="Panel" />
          <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="3546006303814935698">
      <property name="name" nameId="tpck.1169194664001" value="dialog" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3546006303814935699" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3546006303814935700" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3546006303814935701">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="3546006303814935702">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3546006303814935703">
            <property name="name" nameId="tpck.1169194664001" value="dc" />
            <property name="isFinal" nameId="tpee.1176718929932" value="true" />
            <node role="type" roleId="tpee.5680397130376446158" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="3546006303814935704">
              <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
              <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="2yj1.380233880019413653" resolveInfo="center" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3546006303814935705">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3546006303814935706">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="3546006303814935707" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="3546006303814935708">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="3546006303814935638" resolveInfo="uidemo" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3546006303814935709">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4917245576577584056" resolveInfo="getDemoContainer" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="3546006303814935712">
          <node role="context" roleId="fb0y.8923564134257084384" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3546006303814935715">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3546006303814935703" resolveInfo="dc" />
          </node>
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="3546006303814935714">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ClearCompartmentStatement" typeId="fb0y.4981225789808986371" id="3546006303814935717" />
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="3546006303814935719">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.6424935405034500197" resolveInfo="TabbedPanel" />
              <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="3546006303814935721">
                <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.6424935405034500198" resolveInfo="tabs" />
                <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="3546006303814935722">
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="3546006303814962042">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.4917245576577583971" resolveInfo="FlowPanel" />
                    <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="3546006303814962045">
                      <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                      <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="3546006303814962046">
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="3546006303814962047">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                          <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="3546006303814962054">
                            <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                            <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="3546006303814962056">
                              <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3546006303814962058">
                                <property name="value" nameId="tpee.1070475926801" value="Dialog" />
                              </node>
                            </node>
                          </node>
                          <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="3546006303814974825">
                            <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                            <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="3546006303814974827">
                              <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="3546006303814974828">
                                <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="3546006303814974829">
                                  <property name="name" nameId="tpck.1169194664001" value="event" />
                                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754489636" />
                                </node>
                                <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="3546006303814974831">
                                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3351556818517845540">
                                    <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3351556818517845541">
                                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3351556818517845542">
                                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3546006303814974833" resolveInfo="showDialog" />
                                      </node>
                                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="3351556818517845543" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="3546006303814962048">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.6424935405034832713" resolveInfo="name" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3546006303814962051">
                        <property name="value" nameId="tpee.1070475926801" value="Dialog" />
                      </node>
                    </node>
                  </node>
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="5409370515560091746">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.4917245576577583971" resolveInfo="FlowPanel" />
                    <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="5409370515560091747">
                      <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
                      <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="5409370515560091748">
                        <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="5409370515560091749">
                          <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                          <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="5409370515560091750">
                            <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                            <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="5409370515560091751">
                              <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5409370515560091752">
                                <property name="value" nameId="tpee.1070475926801" value="Form" />
                              </node>
                            </node>
                          </node>
                          <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="5409370515560091753">
                            <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                            <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="5409370515560091754">
                              <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="5409370515560091755">
                                <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="5409370515560091756">
                                  <property name="name" nameId="tpck.1169194664001" value="event" />
                                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490085" />
                                </node>
                                <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="5409370515560091758">
                                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5409370515560091759">
                                    <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5409370515560091760">
                                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5409370515560091761">
                                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="5409370515560092352" resolveInfo="showForm" />
                                      </node>
                                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="5409370515560091762" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="5409370515560091763">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.6424935405034832713" resolveInfo="name" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5409370515560091764">
                        <property name="value" nameId="tpee.1070475926801" value="Form" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.ForceLayoutStatement" typeId="fb0y.6653319296676631683" id="3546006303814974832" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="3546006303814974833">
      <property name="name" nameId="tpck.1169194664001" value="showDialog" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3546006303814974834" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3546006303814974835" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3546006303814974836">
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.UIObjectProviderStatement" typeId="fb0y.3546006303814984631" id="3546006303815365737">
          <node role="context" roleId="fb0y.3546006303814984632" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3546006303815365855">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3546006303815365852">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="3546006303815365853">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="3546006303814935638" resolveInfo="uidemo" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="3546006303815365854" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3546006303815365859">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3546006303815365743" resolveInfo="getRootPanel" />
            </node>
          </node>
          <node role="body" roleId="fb0y.3546006303814984633" type="tpee.StatementList" typeId="tpee.1068580123136" id="3546006303815365739">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.CreateUIObjectStatement" typeId="fb0y.6261739386029037414" id="6261739386029413562">
              <property name="name" nameId="tpck.1169194664001" value="dialog" />
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.6261739386029717105" resolveInfo="Dialog" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="1870423755832753639">
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="1870423755832753641">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="1870423755832858698">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7617727720684691215" resolveInfo="FillPanel" />
              <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="1870423755832858699">
                <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.4850120319523368884" resolveInfo="child" />
                <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="1870423755832858700">
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="1870423755832858701">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                    <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="1870423755832858702">
                      <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                      <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="1870423755832858703">
                        <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1870423755832858704">
                          <property name="value" nameId="tpee.1070475926801" value="FOO" />
                        </node>
                      </node>
                    </node>
                    <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="1870423755832858705">
                      <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                      <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="1870423755832858706">
                        <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="1870423755832858707">
                          <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="1870423755832858708">
                            <property name="name" nameId="tpck.1169194664001" value="event" />
                            <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754489715" />
                          </node>
                          <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1870423755832858710">
                            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1870423755832858711">
                              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1870423755832858712">
                                <node role="operand" roleId="tpee.1197027771414" type="fb0y.UIObjectReference" typeId="fb0y.6410919744913609127" id="6410919744913667440">
                                  <link role="declaration" roleId="fb0y.6410919744913609580" targetNodeId="6261739386029413562" resolveInfo="dialog" />
                                </node>
                                <node role="operation" roleId="tpee.1197027833540" type="fb0y.CallUIActionOperation" typeId="fb0y.6261739386030553808" id="1870423755832858714">
                                  <link role="action" roleId="fb0y.6261739386030567641" targetNodeId="2yj1.6261739386029958929" resolveInfo="hide" />
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
          <node role="context" roleId="fb0y.8923564134257084384" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6410919744913667437">
            <node role="operand" roleId="tpee.1197027771414" type="fb0y.UIObjectReference" typeId="fb0y.6410919744913609127" id="6410919744913667438">
              <link role="declaration" roleId="fb0y.6410919744913609580" targetNodeId="6261739386029413562" resolveInfo="dialog" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="fb0y.AccessUIPropertyOperation" typeId="fb0y.1870423755832759837" id="6410919744913667439">
              <link role="property" roleId="fb0y.1870423755832759838" targetNodeId="2yj1.1870423755832688529" resolveInfo="contentPane" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6261739386030553798">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6261739386030799306">
            <node role="operand" roleId="tpee.1197027771414" type="fb0y.UIObjectReference" typeId="fb0y.6410919744913609127" id="6410919744913667441">
              <link role="declaration" roleId="fb0y.6410919744913609580" targetNodeId="6261739386029413562" resolveInfo="dialog" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="fb0y.CallUIActionOperation" typeId="fb0y.6261739386030553808" id="6261739386030799310">
              <link role="action" roleId="fb0y.6261739386030567641" targetNodeId="2yj1.6261739386029958928" resolveInfo="show" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="5409370515560092352">
      <property name="name" nameId="tpck.1169194664001" value="showForm" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5409370515560092353" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5409370515560092354" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5409370515560092355">
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.UIObjectProviderStatement" typeId="fb0y.3546006303814984631" id="5409370515560092356">
          <node role="context" roleId="fb0y.3546006303814984632" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5409370515560092357">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5409370515560092358">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="5409370515560092359">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="3546006303814935638" resolveInfo="uidemo" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="5409370515560092360" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5409370515560092361">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3546006303815365743" resolveInfo="getRootPanel" />
            </node>
          </node>
          <node role="body" roleId="fb0y.3546006303814984633" type="tpee.StatementList" typeId="tpee.1068580123136" id="5409370515560092362">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.CreateUIObjectStatement" typeId="fb0y.6261739386029037414" id="5409370515560092363">
              <property name="name" nameId="tpck.1169194664001" value="dialog" />
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.6261739386029717105" resolveInfo="Dialog" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="fb0y.CompartmentProviderStatement" typeId="fb0y.8923564134257084377" id="5409370515560092364">
          <node role="body" roleId="fb0y.8923564134257084414" type="tpee.StatementList" typeId="tpee.1068580123136" id="5409370515560092365">
            <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="6127893195683388746">
              <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.8508807536211634698" resolveInfo="GridPanel" />
              <node role="compartment" roleId="fb0y.4391079257750099456" type="fb0y.ContainerCompartment" typeId="fb0y.4391079257750083005" id="6127893195683388748">
                <link role="container" roleId="fb0y.4391079257750083006" targetNodeId="2yj1.8508807536211634699" resolveInfo="gridChildren" />
                <node role="body" roleId="fb0y.4391079257750099467" type="tpee.StatementList" typeId="tpee.1068580123136" id="6127893195683388749">
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="6127893195683388750">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.262873202871588254" resolveInfo="Label" />
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="6127893195683388751">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.8508807536211634700" resolveInfo="cell" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="6127893195683388753">
                        <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.CellLayoutConstraint" typeId="sqp9.8508807536211371475" id="6127893195683388754">
                          <node role="columnConstraint" roleId="sqp9.8508807536211444937" type="sqp9.ColumnLayoutConstraint" typeId="sqp9.8508807536211371477" id="6127893195683388755">
                            <node role="col" roleId="sqp9.8508807536211371478" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6127893195683388760">
                              <property name="value" nameId="tpee.1068580320021" value="0" />
                            </node>
                          </node>
                          <node role="rowConstraint" roleId="sqp9.8508807536211444938" type="sqp9.RowLayoutConstraint" typeId="sqp9.8508807536211371480" id="6127893195683388757">
                            <node role="row" roleId="sqp9.8508807536211371481" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6127893195683388761">
                              <property name="value" nameId="tpee.1068580320021" value="0" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="6127893195683388775">
                      <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.262873202871593902" resolveInfo="text" />
                      <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="6127893195683388777">
                        <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6127893195683388779">
                          <property name="value" nameId="tpee.1070475926801" value="Foo" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="6127893195683388763">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.2700392567716868344" resolveInfo="TextField" />
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="6127893195683388764">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.8508807536211634700" resolveInfo="cell" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="6127893195683388766">
                        <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.CellLayoutConstraint" typeId="sqp9.8508807536211371475" id="6127893195683388767">
                          <node role="columnConstraint" roleId="sqp9.8508807536211444937" type="sqp9.ColumnLayoutConstraint" typeId="sqp9.8508807536211371477" id="6127893195683388768">
                            <node role="col" roleId="sqp9.8508807536211371478" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6127893195683388772">
                              <property name="value" nameId="tpee.1068580320021" value="1" />
                            </node>
                            <node role="spanCols" roleId="sqp9.8508807536211371479" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6127893195683455568">
                              <property name="value" nameId="tpee.1068580320021" value="2" />
                            </node>
                          </node>
                          <node role="rowConstraint" roleId="sqp9.8508807536211444938" type="sqp9.RowLayoutConstraint" typeId="sqp9.8508807536211371480" id="6127893195683388770">
                            <node role="row" roleId="sqp9.8508807536211371481" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6127893195683388774">
                              <property name="value" nameId="tpee.1068580320021" value="0" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="1917449282171811249">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.7930737280446910201" resolveInfo="align" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="1917449282171815809">
                        <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.AlignmentLayoutConstraint" typeId="sqp9.3619322115897256358" id="1917449282171815810">
                          <node role="hAlignment" roleId="sqp9.1275214627099942054" type="sqp9.HorizontalAlignment" typeId="sqp9.3619322115897256360" id="1917449282171815811">
                            <property name="value" nameId="sqp9.1275214627099820844" value="FILL" />
                          </node>
                          <node role="vAlignment" roleId="sqp9.1275214627099942053" type="sqp9.VerticalAlignment" typeId="sqp9.3619322115897256359" id="1917449282171815812">
                            <property name="value" nameId="sqp9.1275214627099794756" value="MIDDLE" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="6127893195683388780">
                      <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.2700392567716868345" resolveInfo="text" />
                      <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.BeanPropertyView" typeId="fb0y.8381258131358737422" id="7006844861053475929">
                        <link role="getter" roleId="fb0y.8381258131358762488" targetNodeId="7006844861053446198" resolveInfo="getBar" />
                        <node role="bean" roleId="fb0y.8381258131358796371" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7006844861053475930">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="7006844861053475931">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3546006303814935638" resolveInfo="uidemo" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7006844861053475932">
                            <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7046856741208199000" resolveInfo="bo" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="6127893195683388787">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="6127893195683388788">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.8508807536211634700" resolveInfo="cell" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="6127893195683388790">
                        <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.CellLayoutConstraint" typeId="sqp9.8508807536211371475" id="6127893195683388791">
                          <node role="columnConstraint" roleId="sqp9.8508807536211444937" type="sqp9.ColumnLayoutConstraint" typeId="sqp9.8508807536211371477" id="6127893195683388792">
                            <node role="col" roleId="sqp9.8508807536211371478" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6127893195683388796">
                              <property name="value" nameId="tpee.1068580320021" value="2" />
                            </node>
                          </node>
                          <node role="rowConstraint" roleId="sqp9.8508807536211444938" type="sqp9.RowLayoutConstraint" typeId="sqp9.8508807536211371480" id="6127893195683388794">
                            <node role="row" roleId="sqp9.8508807536211371481" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6127893195683388797">
                              <property name="value" nameId="tpee.1068580320021" value="1" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="7930737280446910205">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.7930737280446910201" resolveInfo="align" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="7930737280446953279">
                        <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.AlignmentLayoutConstraint" typeId="sqp9.3619322115897256358" id="7930737280446953280">
                          <node role="hAlignment" roleId="sqp9.1275214627099942054" type="sqp9.HorizontalAlignment" typeId="sqp9.3619322115897256360" id="7930737280446953281">
                            <property name="value" nameId="sqp9.1275214627099820844" value="LEFT" />
                          </node>
                          <node role="vAlignment" roleId="sqp9.1275214627099942053" type="sqp9.VerticalAlignment" typeId="sqp9.3619322115897256359" id="7930737280446953282">
                            <property name="value" nameId="sqp9.1275214627099794756" value="FILL" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="6127893195683388801">
                      <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                      <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="6127893195683388803">
                        <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6127893195683388805">
                          <property name="value" nameId="tpee.1070475926801" value="&lt;-  / &lt;-&gt;" />
                        </node>
                      </node>
                    </node>
                    <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="6127893195683388806">
                      <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                      <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="6127893195683388808">
                        <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="6127893195683388809">
                          <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="6127893195683388810">
                            <property name="name" nameId="tpck.1169194664001" value="event" />
                            <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490057" />
                          </node>
                          <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="6127893195683388812">
                            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6127893195683388813">
                              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6127893195683388815">
                                <node role="operand" roleId="tpee.1197027771414" type="fb0y.UIObjectReference" typeId="fb0y.6410919744913609127" id="6127893195683388814">
                                  <link role="declaration" roleId="fb0y.6410919744913609580" targetNodeId="5409370515560092363" resolveInfo="dialog" />
                                </node>
                                <node role="operation" roleId="tpee.1197027833540" type="fb0y.CallUIActionOperation" typeId="fb0y.6261739386030553808" id="6127893195683388819">
                                  <link role="action" roleId="fb0y.6261739386030567641" targetNodeId="2yj1.6261739386029958929" resolveInfo="hide" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="6030013275786292571">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="6030013275786292572">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.8508807536211634700" resolveInfo="cell" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="6030013275786292573">
                        <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.CellLayoutConstraint" typeId="sqp9.8508807536211371475" id="6030013275786292574">
                          <node role="columnConstraint" roleId="sqp9.8508807536211444937" type="sqp9.ColumnLayoutConstraint" typeId="sqp9.8508807536211371477" id="6030013275786292575">
                            <node role="col" roleId="sqp9.8508807536211371478" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6030013275786292576">
                              <property name="value" nameId="tpee.1068580320021" value="2" />
                            </node>
                          </node>
                          <node role="rowConstraint" roleId="sqp9.8508807536211444938" type="sqp9.RowLayoutConstraint" typeId="sqp9.8508807536211371480" id="6030013275786292577">
                            <node role="row" roleId="sqp9.8508807536211371481" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6030013275786292578">
                              <property name="value" nameId="tpee.1068580320021" value="2" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="6030013275786292579">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.7930737280446910201" resolveInfo="align" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="6030013275786292580">
                        <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.AlignmentLayoutConstraint" typeId="sqp9.3619322115897256358" id="6030013275786292581">
                          <node role="hAlignment" roleId="sqp9.1275214627099942054" type="sqp9.HorizontalAlignment" typeId="sqp9.3619322115897256360" id="6030013275786292582">
                            <property name="value" nameId="sqp9.1275214627099820844" value="RIGHT" />
                          </node>
                          <node role="vAlignment" roleId="sqp9.1275214627099942053" type="sqp9.VerticalAlignment" typeId="sqp9.3619322115897256359" id="6030013275786292583">
                            <property name="value" nameId="sqp9.1275214627099794756" value="FILL" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="6030013275786292584">
                      <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                      <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="6030013275786292585">
                        <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6030013275786292586">
                          <property name="value" nameId="tpee.1070475926801" value=" -&gt; / &lt;-&gt;" />
                        </node>
                      </node>
                    </node>
                    <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="6030013275786292587">
                      <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                      <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="6030013275786292588">
                        <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="6030013275786292589">
                          <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="6030013275786292590">
                            <property name="name" nameId="tpck.1169194664001" value="event" />
                            <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490344" />
                          </node>
                          <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="6030013275786292592">
                            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6030013275786292593">
                              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6030013275786292594">
                                <node role="operand" roleId="tpee.1197027771414" type="fb0y.UIObjectReference" typeId="fb0y.6410919744913609127" id="6030013275786292595">
                                  <link role="declaration" roleId="fb0y.6410919744913609580" targetNodeId="5409370515560092363" resolveInfo="dialog" />
                                </node>
                                <node role="operation" roleId="tpee.1197027833540" type="fb0y.CallUIActionOperation" typeId="fb0y.6261739386030553808" id="6030013275786292596">
                                  <link role="action" roleId="fb0y.6261739386030567641" targetNodeId="2yj1.6261739386029958929" resolveInfo="hide" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="statement" roleId="tpee.1068581517665" type="fb0y.AppendUIObjectStatement" typeId="fb0y.4981225789809472779" id="6030013275786293198">
                    <link role="uiObject" roleId="fb0y.8381258131358446226" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="6030013275786293199">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.8508807536211634700" resolveInfo="cell" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="6030013275786293200">
                        <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.CellLayoutConstraint" typeId="sqp9.8508807536211371475" id="6030013275786293201">
                          <node role="columnConstraint" roleId="sqp9.8508807536211444937" type="sqp9.ColumnLayoutConstraint" typeId="sqp9.8508807536211371477" id="6030013275786293202">
                            <node role="col" roleId="sqp9.8508807536211371478" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6030013275786293203">
                              <property name="value" nameId="tpee.1068580320021" value="2" />
                            </node>
                          </node>
                          <node role="rowConstraint" roleId="sqp9.8508807536211444938" type="sqp9.RowLayoutConstraint" typeId="sqp9.8508807536211371480" id="6030013275786293204">
                            <node role="row" roleId="sqp9.8508807536211371481" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6030013275786293205">
                              <property name="value" nameId="tpee.1068580320021" value="3" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="aspect" roleId="fb0y.6424935405034832716" type="fb0y.ChildAspect" typeId="fb0y.6424935405034937364" id="6030013275786293206">
                      <link role="definition" roleId="fb0y.6424935405034937366" targetNodeId="2yj1.7930737280446910201" resolveInfo="align" />
                      <node role="value" roleId="fb0y.6424935405034937365" type="sqp9.LayoutConstraintExpression" typeId="sqp9.2663453265345757053" id="6030013275786293207">
                        <node role="constraint" roleId="sqp9.2663453265345757087" type="sqp9.AlignmentLayoutConstraint" typeId="sqp9.3619322115897256358" id="6030013275786293208">
                          <node role="vAlignment" roleId="sqp9.1275214627099942053" type="sqp9.VerticalAlignment" typeId="sqp9.3619322115897256359" id="6030013275786293210">
                            <property name="value" nameId="sqp9.1275214627099794756" value="FILL" />
                          </node>
                          <node role="hAlignment" roleId="sqp9.1275214627099942054" type="sqp9.HorizontalAlignment" typeId="sqp9.3619322115897256360" id="6030013275786293225">
                            <property name="value" nameId="sqp9.1275214627099820844" value="CENTER" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="viewBinding" roleId="fb0y.9014158157446579737" type="fb0y.ViewBinding" typeId="fb0y.9014158157446579719" id="6030013275786293211">
                      <link role="property" roleId="fb0y.9014158157446579720" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
                      <node role="view" roleId="fb0y.9014158157446579723" type="fb0y.ExpressionView" typeId="fb0y.9014158157446815224" id="6030013275786293212">
                        <node role="expression" roleId="fb0y.9014158157446815225" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6030013275786293213">
                          <property name="value" nameId="tpee.1070475926801" value=" -  / &lt;-&gt;" />
                        </node>
                      </node>
                    </node>
                    <node role="controllerBinding" roleId="fb0y.5224413709454102948" type="fb0y.ControllerBinding" typeId="fb0y.5224413709453581618" id="6030013275786293214">
                      <link role="event" roleId="fb0y.5224413709453581620" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
                      <node role="controller" roleId="fb0y.5224413709453581619" type="fb0y.InlineController" typeId="fb0y.5224413709453581638" id="6030013275786293215">
                        <node role="eventHandlingBlock" roleId="fb0y.5224413709454207588" type="fb0y.EventHandingBlock" typeId="fb0y.5224413709453581648" id="6030013275786293216">
                          <node role="parameter" roleId="tp2c.1199569906740" type="fb0y.FunctionParameterDeclaration" typeId="fb0y.5224413709453581668" id="6030013275786293217">
                            <property name="name" nameId="tpck.1169194664001" value="event" />
                            <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754489709" />
                          </node>
                          <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="6030013275786293219">
                            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6030013275786293220">
                              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6030013275786293221">
                                <node role="operand" roleId="tpee.1197027771414" type="fb0y.UIObjectReference" typeId="fb0y.6410919744913609127" id="6030013275786293222">
                                  <link role="declaration" roleId="fb0y.6410919744913609580" targetNodeId="5409370515560092363" resolveInfo="dialog" />
                                </node>
                                <node role="operation" roleId="tpee.1197027833540" type="fb0y.CallUIActionOperation" typeId="fb0y.6261739386030553808" id="6030013275786293223">
                                  <link role="action" roleId="fb0y.6261739386030567641" targetNodeId="2yj1.6261739386029958929" resolveInfo="hide" />
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
          <node role="context" roleId="fb0y.8923564134257084384" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5409370515560092383">
            <node role="operand" roleId="tpee.1197027771414" type="fb0y.UIObjectReference" typeId="fb0y.6410919744913609127" id="5409370515560092384">
              <link role="declaration" roleId="fb0y.6410919744913609580" targetNodeId="5409370515560092363" resolveInfo="dialog" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="fb0y.AccessUIPropertyOperation" typeId="fb0y.1870423755832759837" id="5409370515560092385">
              <link role="property" roleId="fb0y.1870423755832759838" targetNodeId="2yj1.1870423755832688529" resolveInfo="contentPane" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5409370515560092386">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5409370515560092387">
            <node role="operand" roleId="tpee.1197027771414" type="fb0y.UIObjectReference" typeId="fb0y.6410919744913609127" id="5409370515560092388">
              <link role="declaration" roleId="fb0y.6410919744913609580" targetNodeId="5409370515560092363" resolveInfo="dialog" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="fb0y.CallUIActionOperation" typeId="fb0y.6261739386030553808" id="5409370515560092389">
              <link role="action" roleId="fb0y.6261739386030567641" targetNodeId="2yj1.6261739386029958928" resolveInfo="show" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="3546006303814935638">
      <property name="name" nameId="tpck.1169194664001" value="uidemo" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="3546006303814935639" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3546006303814935640">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="7046856741208198715" resolveInfo="UIDemo" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3546006303814922745" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="3546006303814922746">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3546006303814922747" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3546006303814922748" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3546006303814922749">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3546006303814935643">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="3546006303814935650">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="3546006303814935653">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3546006303814935641" resolveInfo="uiDemo" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3546006303814935645">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="3546006303814935644" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="3546006303814935649">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="3546006303814935638" resolveInfo="uidemo" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="3546006303814935641">
        <property name="name" nameId="tpck.1169194664001" value="uiDemo" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3546006303814935642">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="7046856741208198715" resolveInfo="UIDemo" />
        </node>
      </node>
    </node>
    <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="3546006303814935566">
      <link role="annotation" roleId="tpee.1188208074048" targetNodeId="1taj.8590671622324268192" resolveInfo="GenerateVariants" />
      <node role="value" roleId="tpee.1188214630783" type="tpee.AnnotationInstanceValue" typeId="tpee.1188214545140" id="3546006303814935567">
        <link role="key" roleId="tpee.1188214555875" targetNodeId="1taj.8590671622324287920" resolveInfo="value" />
        <node role="value" roleId="tpee.1188214607812" type="tpee.ArrayLiteral" typeId="tpee.1188220165133" id="3546006303814935568">
          <node role="item" roleId="tpee.1188220173759" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3546006303814935569">
            <property name="value" nameId="tpee.1070475926801" value="GWT" />
          </node>
          <node role="item" roleId="tpee.1188220173759" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3546006303814935570">
            <property name="value" nameId="tpee.1070475926801" value="SWT" />
          </node>
          <node role="item" roleId="tpee.1188220173759" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3546006303814935571">
            <property name="value" nameId="tpee.1070475926801" value="Swing" />
          </node>
        </node>
      </node>
    </node>
  </root>
</model>

