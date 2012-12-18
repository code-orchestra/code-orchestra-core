<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:22d98723-5ac5-4775-a416-434d71d737ed(jetbrains.mps.ui.swing.widgets)" doNotGenerate="true">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="8a448bd0-1380-4c01-9820-0f051d33888c(jetbrains.mps.ui.modeling)" />
  <language namespace="fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="fb26dccf-fa54-4e9a-8ddb-b66311a34393(jetbrains.mps.ui)" />
  <import index="2yj1" modelUID="r:c1b84d62-80cc-499b-b655-943c00c7ba88(jetbrains.mps.ui.widgets)" version="1" />
  <import index="yv5b" modelUID="r:453b0397-d30d-4f36-9cf6-3903e9b6818d(jetbrains.mps.ui.swing.runtime)" version="-1" />
  <import index="dbrf" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#javax.swing(JDK/javax.swing@java_stub)" version="-1" />
  <import index="8q6x" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.awt.event(JDK/java.awt.event@java_stub)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="1t7x" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.awt(JDK/java.awt@java_stub)" version="-1" />
  <import index="k7g3" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.util(JDK/java.util@java_stub)" version="-1" />
  <import index="osf5" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#javax.swing.tree(JDK/javax.swing.tree@java_stub)" version="-1" />
  <import index="gsmj" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#javax.swing.table(JDK/javax.swing.table@java_stub)" version="-1" />
  <import index="juh8" modelUID="f:java_stub#acc947bf-6778-444a-9dc7-4cc72d4eb3d0#org.jdesktop.swingx(jetbrains.mps.ui.swing.runtime/org.jdesktop.swingx@java_stub)" version="-1" />
  <import index="oj8w" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#javax.swing.text(JDK/javax.swing.text@java_stub)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="sqp9" modelUID="r:ba1d89ed-800e-4d0a-ad09-221b1011fbd1(jetbrains.mps.ui.modeling.structure)" version="2" implicit="yes" />
  <import index="tp2c" modelUID="r:00000000-0000-4000-0000-011c89590338(jetbrains.mps.baseLanguage.closures.structure)" version="3" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <roots>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="5725024602606794293">
      <property name="name" nameId="tpck.1169194664001" value="JRadioButton" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.7421785601023770748" resolveInfo="RadioButton" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="8938819815716128384">
      <property name="name" nameId="tpck.1169194664001" value="JButton" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.7421785601023770752" resolveInfo="Button" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="4391079257750367148">
      <property name="name" nameId="tpck.1169194664001" value="JPanel" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.7421785601023770754" resolveInfo="Panel" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="1250358102410873407">
      <property name="name" nameId="tpck.1169194664001" value="JComponent" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.7421785601023770745" resolveInfo="Widget" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="9106854556041662273">
      <property name="name" nameId="tpck.1169194664001" value="AbstractButton" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.7421785601023770739" resolveInfo="ButtonBase" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="9106854556041665679">
      <property name="name" nameId="tpck.1169194664001" value="JCheckBox" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.7421785601023770742" resolveInfo="CheckBox" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="352695393470459306">
      <property name="name" nameId="tpck.1169194664001" value="JPanel_BoxLayout_Vertical" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.4007322171505962920" resolveInfo="VerticalPanel" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="352695393470538526">
      <property name="name" nameId="tpck.1169194664001" value="JPanel_BoxLayout_Horizontal" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.352695393470301153" resolveInfo="HorizontalPanel" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="262873202872765665">
      <property name="name" nameId="tpck.1169194664001" value="JLabel" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.262873202871588254" resolveInfo="Label" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="262873202872805696">
      <property name="name" nameId="tpck.1169194664001" value="JPanel_DockLayout" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.262873202871571543" resolveInfo="DockPanel" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="2482864227446593900">
      <property name="name" nameId="tpck.1169194664001" value="JTabbedPane" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.6424935405034500197" resolveInfo="TabbedPanel" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="6399754879758206694">
      <property name="name" nameId="tpck.1169194664001" value="JTree" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.6399754879758206688" resolveInfo="Tree" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="6399754879758253323">
      <property name="name" nameId="tpck.1169194664001" value="TreeNode" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.7936848552255359513" resolveInfo="AbstractTreeNode" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="7383889057843473725">
      <property name="name" nameId="tpck.1169194664001" value="JTable" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.3616339824038852574" resolveInfo="Table" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="7383889057843490669">
      <property name="name" nameId="tpck.1169194664001" value="Vector" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.3616339824038886165" resolveInfo="TableRow" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="7383889057843526540">
      <property name="name" nameId="tpck.1169194664001" value="TableColumn" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.3616339824038886161" resolveInfo="TableColumn" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="513490887686307657">
      <property name="name" nameId="tpck.1169194664001" value="JXSingleTaskPaneContainer" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.513490887686296700" resolveInfo="StackPanel" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="513490887686345260">
      <property name="name" nameId="tpck.1169194664001" value="JXSingleTaskPane" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.513490887686296702" resolveInfo="StackItem" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="7617727720684702922">
      <property name="name" nameId="tpck.1169194664001" value="JPanel_GridLayout" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.7617727720684691215" resolveInfo="FillPanel" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="7617727720684733812">
      <property name="name" nameId="tpck.1169194664001" value="JPanel_SpringLayout" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.2663453265346089636" resolveInfo="LayoutPanel" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="873604604378858590">
      <property name="name" nameId="tpck.1169194664001" value="JXHyperlink" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.7001216437968619238" resolveInfo="Hyperlink" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="2490518255521933821">
      <property name="name" nameId="tpck.1169194664001" value="Custom" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.2490518255521933820" resolveInfo="CustomComponent" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="2925275022462250780">
      <property name="name" nameId="tpck.1169194664001" value="JPanel_FlowLayout" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.4917245576577583971" resolveInfo="FlowPanel" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="6107522156819192478">
      <property name="name" nameId="tpck.1169194664001" value="JPanel_GridBagLayout" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.8508807536211634698" resolveInfo="GridPanel" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="6261739386029717107">
      <property name="name" nameId="tpck.1169194664001" value="JDialog" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.6261739386029717105" resolveInfo="Dialog" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="6261739386029732128">
      <property name="name" nameId="tpck.1169194664001" value="JFrame" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.3546006303814975218" resolveInfo="RootPanel" />
    </node>
    <node type="sqp9.UIObjectTemplate" typeId="sqp9.4643695836678898389" id="7006844861053363422">
      <property name="name" nameId="tpck.1169194664001" value="JTextField" />
      <link role="uiObject" roleId="sqp9.4643695836678898390" targetNodeId="2yj1.2700392567716868344" resolveInfo="TextField" />
    </node>
  </roots>
  <root id="5725024602606794293">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="1642651187739644486">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1642651187739644487">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1412244996131933122">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1412244996131933123">
            <property name="name" nameId="tpck.1169194664001" value="rb" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1412244996131933124">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JRadioButton" resolveInfo="JRadioButton" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1412244996131933125">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1412244996131933126">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JRadioButton%d&lt;init&gt;()" resolveInfo="JRadioButton" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1412244996131933109">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1412244996131933117">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1412244996131933111">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ContextUIObjectParam" typeId="sqp9.7655275107718250839" id="1412244996131933110" />
              <node role="operation" roleId="tpee.1197027833540" type="sqp9.AuxObjectAccessOp" typeId="sqp9.1412244996131807615" id="1412244996131933115">
                <link role="template" roleId="sqp9.1412244996131808157" targetNodeId="1412244996131806806" resolveInfo="buttonGroup" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1412244996131933121">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~ButtonGroup%dadd(javax%dswing%dAbstractButton)%cvoid" resolveInfo="add" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1412244996131933127">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1412244996131933123" resolveInfo="rb" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1412244996131933129">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1412244996131933130">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1412244996131933123" resolveInfo="rb" />
          </node>
        </node>
      </node>
      <node role="context" roleId="sqp9.1642651187739182158" type="sqp9.Context" typeId="sqp9.1642651187739181626" id="6754548266453565405">
        <link role="uiObject" roleId="sqp9.1642651187739181627" targetNodeId="2yj1.7421785601023770754" resolveInfo="Panel" />
      </node>
    </node>
    <node role="propertyAccessor" roleId="sqp9.4643695836678928899" type="sqp9.EditableUIPropertyAccessCode" typeId="sqp9.8938819815716373279" id="8938819815717051507">
      <link role="property" roleId="sqp9.8938819815716373280" targetNodeId="2yj1.7421785601023770750" resolveInfo="selected" />
      <node role="handlerSetup" roleId="sqp9.8938819815716373281" type="sqp9.PropertyChangeHandlerSetup" typeId="sqp9.8938819815716165293" id="8938819815717051508">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8938819815717051509">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8938819815717051510">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8938819815717051511">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="8938819815717051512" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8938819815717051513">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~AbstractButton%daddActionListener(java%dawt%devent%dActionListener)%cvoid" resolveInfo="addActionListener" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8938819815717051514">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="8938819815717051515">
                    <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="8938819815717051516">
                      <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
                      <link role="classifier" roleId="tpee.1170346070688" targetNodeId="8q6x.~ActionListener" resolveInfo="ActionListener" />
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Object%d&lt;init&gt;()" resolveInfo="Object" />
                      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8938819815717051517" />
                      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="8938819815717051518">
                        <property name="isAbstract" nameId="tpee.1178608670077" value="false" />
                        <property name="name" nameId="tpck.1169194664001" value="actionPerformed" />
                        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8938819815717051519" />
                        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8938819815717051520" />
                        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8938819815717051521">
                          <property name="name" nameId="tpck.1169194664001" value="ae" />
                          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8938819815717051522">
                            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8q6x.~ActionEvent" resolveInfo="ActionEvent" />
                          </node>
                        </node>
                        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8938819815717051523">
                          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8938819815717051524">
                            <node role="expression" roleId="tpee.1068580123156" type="tp2c.CompactInvokeFunctionExpression" typeId="tp2c.1235746970280" id="8938819815717051525">
                              <node role="parameter" roleId="tp2c.1235747002942" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8938819815717051526">
                                <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="8938819815717051527" />
                                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8938819815717051528">
                                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~AbstractButton%disSelected()%cboolean" resolveInfo="isSelected" />
                                </node>
                              </node>
                              <node role="function" roleId="tp2c.1235746996653" type="sqp9.PropertyChangeHandlerParam" typeId="sqp9.8938819815716721054" id="8938819815717051529" />
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
      <node role="getter" roleId="sqp9.4643695836679531005" type="sqp9.UIPropertyGetter" typeId="sqp9.4643695836679547748" id="8938819815717051530">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8938819815717051531">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8938819815717051532">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8938819815717051533">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="8938819815717051534" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8938819815717051535">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~AbstractButton%disSelected()%cboolean" resolveInfo="isSelected" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="setter" roleId="sqp9.4643695836679531004" type="sqp9.UIPropertySetter" typeId="sqp9.4643695836679547626" id="8938819815717051536">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8938819815717051537">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8938819815717051538">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8938819815717051539">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="8938819815717051540" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8938819815717051541">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~AbstractButton%dsetSelected(boolean)%cvoid" resolveInfo="setSelected" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.PropertyValueParam" typeId="sqp9.4643695836679547628" id="8938819815717051542" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5725024602606794301">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JRadioButton" resolveInfo="JRadioButton" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="1412244996131688182" />
  </root>
  <root id="8938819815716128384">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="1642651187739644469">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1642651187739644470">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1642651187739644471">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1642651187739644472">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1642651187739644473">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JButton%d&lt;init&gt;()" resolveInfo="JButton" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8938819815716128387">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JButton" resolveInfo="JButton" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="1412244996131658907" />
  </root>
  <root id="4391079257750367148">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="1642651187739644474">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1642651187739644475">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1642651187739644476">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1642651187739644477">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1642651187739644478">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JPanel%d&lt;init&gt;()" resolveInfo="JPanel" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="containerTemplate" roleId="sqp9.4391079257750389359" type="sqp9.ContainerTemplate" typeId="sqp9.4391079257750389358" id="4391079257750541325">
      <link role="container" roleId="sqp9.4391079257750389360" targetNodeId="2yj1.7421785601023770755" resolveInfo="children" />
      <node role="itemType" roleId="sqp9.4391079257750550448" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2459884175398146656">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
      </node>
      <node role="itemAdder" roleId="sqp9.4391079257750634351" type="sqp9.ContainerItemAdder" typeId="sqp9.4391079257750550393" id="4391079257750713372">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4391079257750713373">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4391079257750719787">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4391079257750841117">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="4391079257750719788" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4391079257750841958">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dadd(java%dawt%dComponent)%cjava%dawt%dComponent" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="4391079257750944188" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemIterator" roleId="sqp9.7798684637310724192" type="sqp9.ContainerItemIterator" typeId="sqp9.7798684637310718056" id="7798684637310945433">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7798684637310945434">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2459884175395078540">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2459884175395078541">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2459884175395254973">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.8717063129899353854" resolveInfo="JComponentIterator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="2459884175395254975" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemRemover" roleId="sqp9.2459884175398375626" type="sqp9.ContainerItemRemover" typeId="sqp9.2459884175398146657" id="2459884175398828350">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2459884175398828351">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2459884175398828352">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2459884175398828354">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="2459884175398828353" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2459884175398829236">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dremove(java%dawt%dComponent)%cvoid" resolveInfo="remove" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="2459884175398829237" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemInserter" roleId="sqp9.2459884175400018414" type="sqp9.ContainerItemInserter" typeId="sqp9.2459884175399840230" id="2459884175400417667">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2459884175400417668">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2459884175400420746">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2459884175400420748">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="2459884175400420747" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2459884175400424387">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dadd(java%dawt%dComponent,int)%cjava%dawt%dComponent" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="2459884175400424388" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2459884175400424425">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2459884175400424397">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Arrays%dasList(java%dlang%dObject%d%d%d)%cjava%dutil%dList" resolveInfo="asList" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="k7g3.~Arrays" resolveInfo="Arrays" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2459884175400424406">
                      <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="2459884175400424405" />
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2459884175400424411">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetComponents()%cjava%dawt%dComponent[]" resolveInfo="getComponents" />
                      </node>
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2459884175400424431">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dindexOf(java%dlang%dObject)%cint" resolveInfo="indexOf" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.BeforeUIObjectParam" typeId="sqp9.2459884175399838883" id="2459884175400424438" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemClearer" roleId="sqp9.413330188016988840" type="sqp9.ContainerItemClearer" typeId="sqp9.413330188016988766" id="413330188017220946">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="413330188017220947">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="413330188017220948">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="413330188017220950">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="413330188017220949" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="413330188017221832">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dremoveAll()%cvoid" resolveInfo="removeAll" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="873604604379680231">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="1412244996131688174">
      <node role="auxTemplate" roleId="sqp9.1412244996131394685" type="sqp9.AuxObjectTemplate" typeId="sqp9.1412244996130857074" id="1412244996131806806">
        <property name="name" nameId="tpck.1169194664001" value="buttonGroup" />
        <node role="runtimeType" roleId="sqp9.1412244996130857075" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1412244996131806807">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~ButtonGroup" resolveInfo="ButtonGroup" />
        </node>
        <node role="factory" roleId="sqp9.1412244996130860595" type="sqp9.AuxObjectFactory" typeId="sqp9.1412244996130857078" id="1412244996131806808">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1412244996131806809">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1412244996131806810">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1412244996131806811">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1412244996131806812">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~ButtonGroup%d&lt;init&gt;()" resolveInfo="ButtonGroup" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="geometry" roleId="sqp9.3329614760087020873" type="sqp9.Geometry" typeId="sqp9.4033850706585269114" id="3329614760087250745">
      <node role="layoutCode" roleId="sqp9.4033850706585269234" type="sqp9.ForceLayoutCode" typeId="sqp9.4033850706585269152" id="3329614760087253829">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3329614760087253830">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3329614760087253831">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3329614760087253833">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="3329614760087253832" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3329614760087253837">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%ddoLayout()%cvoid" resolveInfo="doLayout" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="1250358102410873407">
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1250358102410873410">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="2459884175397359353" />
  </root>
  <root id="9106854556041662273">
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9106854556041662277">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~AbstractButton" resolveInfo="AbstractButton" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="9106854556041662275" />
    <node role="propertyAccessor" roleId="sqp9.4643695836678928899" type="sqp9.UIPropertyAccessCode" typeId="sqp9.4643695836678934010" id="9106854556041662278">
      <link role="property" roleId="sqp9.4643695836678934012" targetNodeId="2yj1.7421785601023770740" resolveInfo="text" />
      <node role="getter" roleId="sqp9.4643695836679531005" type="sqp9.UIPropertyGetter" typeId="sqp9.4643695836679547748" id="9106854556041662279">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9106854556041662280">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9106854556041662281">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9106854556041662282">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9106854556041662283" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9106854556041662284">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~AbstractButton%dgetText()%cjava%dlang%dString" resolveInfo="getText" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="setter" roleId="sqp9.4643695836679531004" type="sqp9.UIPropertySetter" typeId="sqp9.4643695836679547626" id="9106854556041662285">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9106854556041662286">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9106854556041662287">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9106854556041662288">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9106854556041662289" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9106854556041662290">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~AbstractButton%dsetText(java%dlang%dString)%cvoid" resolveInfo="setText" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.PropertyValueParam" typeId="sqp9.4643695836679547628" id="9106854556041662291" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="9106854556041665679">
    <node role="propertyAccessor" roleId="sqp9.4643695836678928899" type="sqp9.EditableUIPropertyAccessCode" typeId="sqp9.8938819815716373279" id="9106854556041694625">
      <link role="property" roleId="sqp9.8938819815716373280" targetNodeId="2yj1.7421785601023770743" resolveInfo="checked" />
      <node role="handlerSetup" roleId="sqp9.8938819815716373281" type="sqp9.PropertyChangeHandlerSetup" typeId="sqp9.8938819815716165293" id="9106854556041694626">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9106854556041694627">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9106854556041697247">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9106854556041697248">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9106854556041697249" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9106854556041697250">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~AbstractButton%daddActionListener(java%dawt%devent%dActionListener)%cvoid" resolveInfo="addActionListener" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9106854556041697251">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="9106854556041697252">
                    <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="9106854556041697253">
                      <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
                      <link role="classifier" roleId="tpee.1170346070688" targetNodeId="8q6x.~ActionListener" resolveInfo="ActionListener" />
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Object%d&lt;init&gt;()" resolveInfo="Object" />
                      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9106854556041697254" />
                      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9106854556041697255">
                        <property name="isAbstract" nameId="tpee.1178608670077" value="false" />
                        <property name="name" nameId="tpck.1169194664001" value="actionPerformed" />
                        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9106854556041697256" />
                        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="9106854556041697257" />
                        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="9106854556041697258">
                          <property name="name" nameId="tpck.1169194664001" value="ae" />
                          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9106854556041697259">
                            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8q6x.~ActionEvent" resolveInfo="ActionEvent" />
                          </node>
                        </node>
                        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9106854556041697260">
                          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9106854556041697261">
                            <node role="expression" roleId="tpee.1068580123156" type="tp2c.CompactInvokeFunctionExpression" typeId="tp2c.1235746970280" id="9106854556041697262">
                              <node role="parameter" roleId="tp2c.1235747002942" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9106854556041697263">
                                <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9106854556041697264" />
                                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9106854556041697265">
                                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~AbstractButton%disSelected()%cboolean" resolveInfo="isSelected" />
                                </node>
                              </node>
                              <node role="function" roleId="tp2c.1235746996653" type="sqp9.PropertyChangeHandlerParam" typeId="sqp9.8938819815716721054" id="9106854556041697266" />
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
      <node role="getter" roleId="sqp9.4643695836679531005" type="sqp9.UIPropertyGetter" typeId="sqp9.4643695836679547748" id="9106854556041694628">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9106854556041694629">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9106854556041694632">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9106854556041694634">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9106854556041694633" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9106854556041697188">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~AbstractButton%disSelected()%cboolean" resolveInfo="isSelected" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="setter" roleId="sqp9.4643695836679531004" type="sqp9.UIPropertySetter" typeId="sqp9.4643695836679547626" id="9106854556041694630">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9106854556041694631">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9106854556041697189">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9106854556041697191">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9106854556041697190" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9106854556041697195">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~AbstractButton%dsetSelected(boolean)%cvoid" resolveInfo="setSelected" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.PropertyValueParam" typeId="sqp9.4643695836679547628" id="9106854556041697197" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="9106854556041665683">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9106854556041665684">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9106854556041665685">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9106854556041665686">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9106854556041694619">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JCheckBox%d&lt;init&gt;()" resolveInfo="JCheckBox" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9106854556041665682">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JCheckBox" resolveInfo="JCheckBox" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="9106854556041665681" />
  </root>
  <root id="352695393470459306">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="352695393470495866">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="352695393470495867">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="352695393470531338">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="352695393470531339">
            <property name="name" nameId="tpck.1169194664001" value="jp" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="352695393470531340">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JPanel" resolveInfo="JPanel" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="352695393470531341">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="352695393470531342">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JPanel%d&lt;init&gt;()" resolveInfo="JPanel" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="352695393470531344">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="352695393470531346">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="352695393470531345">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="352695393470531339" resolveInfo="jp" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="352695393470538516">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dsetLayout(java%dawt%dLayoutManager)%cvoid" resolveInfo="setLayout" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="352695393470538517">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="352695393470538519">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~BoxLayout%d&lt;init&gt;(java%dawt%dContainer,int)" resolveInfo="BoxLayout" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="352695393470538520">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="352695393470531339" resolveInfo="jp" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="352695393470538522">
                    <link role="classifier" roleId="tpee.1144433057691" targetNodeId="dbrf.~BoxLayout" resolveInfo="BoxLayout" />
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="dbrf.~BoxLayout%dY_AXIS" resolveInfo="Y_AXIS" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="352695393470538524">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="352695393470538525">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="352695393470531339" resolveInfo="jp" />
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="352695393470495865">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JPanel" resolveInfo="JPanel" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="352695393470459308" />
  </root>
  <root id="352695393470538526">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="352695393470538530">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="352695393470538531">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="352695393470538533">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="352695393470538534">
            <property name="name" nameId="tpck.1169194664001" value="jp" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="352695393470538535">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JPanel" resolveInfo="JPanel" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="352695393470538536">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="352695393470538537">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JPanel%d&lt;init&gt;()" resolveInfo="JPanel" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="352695393470538538">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="352695393470538539">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="352695393470538540">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="352695393470538534" resolveInfo="jp" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="352695393470538541">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dsetLayout(java%dawt%dLayoutManager)%cvoid" resolveInfo="setLayout" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="352695393470538542">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="352695393470538543">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~BoxLayout%d&lt;init&gt;(java%dawt%dContainer,int)" resolveInfo="BoxLayout" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="352695393470538544">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="352695393470538534" resolveInfo="jp" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="352695393470538545">
                    <link role="classifier" roleId="tpee.1144433057691" targetNodeId="dbrf.~BoxLayout" resolveInfo="BoxLayout" />
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="dbrf.~BoxLayout%dX_AXIS" resolveInfo="X_AXIS" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="352695393470538546">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="352695393470538547">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="352695393470538534" resolveInfo="jp" />
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="352695393470538529">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JPanel" resolveInfo="JPanel" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="352695393470538528" />
    <node role="containerTemplate" roleId="sqp9.4391079257750389359" type="sqp9.ContainerTemplate" typeId="sqp9.4391079257750389358" id="6196826443637827238">
      <link role="container" roleId="sqp9.4391079257750389360" targetNodeId="2yj1.6196826443637826585" resolveInfo="line" />
      <node role="itemAdder" roleId="sqp9.4391079257750634351" type="sqp9.ContainerItemAdder" typeId="sqp9.4391079257750550393" id="6196826443637827240">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6196826443637827241">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6196826443637846062">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6196826443637846064">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="6196826443637846063" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6196826443637846068">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dadd(java%dawt%dComponent)%cjava%dawt%dComponent" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="6196826443637846069" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6196826443637846071">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6196826443637846073">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="6196826443637846072" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6196826443637846077">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JComponent%dsetAlignmentY(float)%cvoid" resolveInfo="setAlignmentY" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="6196826443637846078">
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="1t7x.~Component" resolveInfo="Component" />
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1t7x.~Component%dTOP_ALIGNMENT" resolveInfo="TOP_ALIGNMENT" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemInserter" roleId="sqp9.2459884175400018414" type="sqp9.ContainerItemInserter" typeId="sqp9.2459884175399840230" id="6196826443637827242">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6196826443637827243" />
      </node>
      <node role="itemIterator" roleId="sqp9.7798684637310724192" type="sqp9.ContainerItemIterator" typeId="sqp9.7798684637310718056" id="6196826443637827244">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6196826443637827245" />
      </node>
      <node role="itemRemover" roleId="sqp9.2459884175398375626" type="sqp9.ContainerItemRemover" typeId="sqp9.2459884175398146657" id="6196826443637827246">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6196826443637827247" />
      </node>
      <node role="itemClearer" roleId="sqp9.413330188016988840" type="sqp9.ContainerItemClearer" typeId="sqp9.413330188016988766" id="6196826443637827248">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6196826443637827249" />
      </node>
      <node role="itemType" roleId="sqp9.4391079257750550448" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6196826443637846061">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
      </node>
    </node>
  </root>
  <root id="262873202872765665">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="262873202872767286">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="262873202872767287">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="262873202872773817">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="262873202872773818">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="262873202872798503">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JLabel%d&lt;init&gt;()" resolveInfo="JLabel" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="262873202872767285">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JLabel" resolveInfo="JLabel" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="262873202872765667" />
    <node role="propertyAccessor" roleId="sqp9.4643695836678928899" type="sqp9.UIPropertyAccessCode" typeId="sqp9.4643695836678934010" id="262873202872798504">
      <link role="property" roleId="sqp9.4643695836678934012" targetNodeId="2yj1.262873202871593902" resolveInfo="text" />
      <node role="getter" roleId="sqp9.4643695836679531005" type="sqp9.UIPropertyGetter" typeId="sqp9.4643695836679547748" id="262873202872798505">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="262873202872798506">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="262873202872798509">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="262873202872805682">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="262873202872798510" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="262873202872805686">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JLabel%dgetText()%cjava%dlang%dString" resolveInfo="getText" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="setter" roleId="sqp9.4643695836679531004" type="sqp9.UIPropertySetter" typeId="sqp9.4643695836679547626" id="262873202872798507">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="262873202872798508">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="262873202872805687">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="262873202872805689">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="262873202872805688" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="262873202872805693">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JLabel%dsetText(java%dlang%dString)%cvoid" resolveInfo="setText" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.PropertyValueParam" typeId="sqp9.4643695836679547628" id="262873202872805695" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="262873202872805696">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="262873202872805700">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="262873202872805701">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="262873202872805702">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="262873202872805703">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="262873202872805705">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JPanel%d&lt;init&gt;(java%dawt%dLayoutManager)" resolveInfo="JPanel" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="262873202872805706">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="262873202872805708">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.7948103825060305168" resolveInfo="DockLayout" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="262873202872805699">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JPanel" resolveInfo="JPanel" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="262873202872805698" />
    <node role="containerTemplate" roleId="sqp9.4391079257750389359" type="sqp9.ContainerTemplate" typeId="sqp9.4391079257750389358" id="262873202872805713">
      <link role="container" roleId="sqp9.4391079257750389360" targetNodeId="2yj1.262873202871571544" resolveInfo="north" />
      <node role="itemAdder" roleId="sqp9.4391079257750634351" type="sqp9.ContainerItemAdder" typeId="sqp9.4391079257750550393" id="262873202872805715">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="262873202872805716">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="262873202872805718">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="262873202872805720">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="262873202872805719" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="262873202872806602">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dadd(java%dawt%dComponent,java%dlang%dObject)%cvoid" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="262873202872806603" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="262873202872806605">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1t7x.~BorderLayout%dNORTH" resolveInfo="NORTH" />
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemType" roleId="sqp9.4391079257750550448" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928187250">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
      </node>
      <node role="itemInserter" roleId="sqp9.2459884175400018414" type="sqp9.ContainerItemInserter" typeId="sqp9.2459884175399840230" id="9003987136928163099">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928163100">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928163101">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928163103">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928163102" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928163985">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dadd(java%dawt%dComponent,java%dlang%dObject,int)%cvoid" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="9003987136928163986" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="9003987136928164058">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1t7x.~BorderLayout%dNORTH" resolveInfo="NORTH" />
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928164016">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="9003987136928163998">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Arrays%dasList(java%dlang%dObject%d%d%d)%cjava%dutil%dList" resolveInfo="asList" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="k7g3.~Arrays" resolveInfo="Arrays" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928164010">
                      <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928164011" />
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928164012">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetComponents()%cjava%dawt%dComponent[]" resolveInfo="getComponents" />
                      </node>
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928164022">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dindexOf(java%dlang%dObject)%cint" resolveInfo="indexOf" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.BeforeUIObjectParam" typeId="sqp9.2459884175399838883" id="9003987136928164029" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemIterator" roleId="sqp9.7798684637310724192" type="sqp9.ContainerItemIterator" typeId="sqp9.7798684637310718056" id="9003987136928164065">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928164066">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928164073">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9003987136928164074">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="9003987136928164078">
                <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="9003987136928164079">
                  <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
                  <link role="classifier" roleId="tpee.1170346070688" targetNodeId="yv5b.8717063129899353109" resolveInfo="JComponentIterator" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.8717063129899353854" resolveInfo="JComponentIterator" />
                  <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928164080" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928164077" />
                  <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9003987136928189957">
                    <property name="name" nameId="tpck.1169194664001" value="accept" />
                    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928189958" />
                    <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="9003987136928189959" />
                    <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="9003987136928189960">
                      <property name="name" nameId="tpck.1169194664001" value="item" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928189961">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
                      </node>
                    </node>
                    <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928189962">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7948103825060761156">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="7948103825060777883">
                          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="7948103825060777887">
                            <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="yv5b.7948103825060318838" resolveInfo="NORTH" />
                            <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                          </node>
                          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060761163">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7948103825060777754">
                              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7948103825060777758">
                                <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777759">
                                  <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7948103825060777760" />
                                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777761">
                                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetLayout()%cjava%dawt%dLayoutManager" resolveInfo="getLayout" />
                                  </node>
                                </node>
                                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7948103825060777762">
                                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="yv5b.7948103825060305166" resolveInfo="DockLayout" />
                                </node>
                              </node>
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777882">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.7948103825060777805" resolveInfo="getConstraints" />
                              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7948103825060777888">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928189960" resolveInfo="item" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="9003987136928189963">
                      <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" resolveInfo="Override" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemRemover" roleId="sqp9.2459884175398375626" type="sqp9.ContainerItemRemover" typeId="sqp9.2459884175398146657" id="9003987136928189980">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928189981">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928189983">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928189985">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928189984" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928189989">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dremove(java%dawt%dComponent)%cvoid" resolveInfo="remove" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="9003987136928189990" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemClearer" roleId="sqp9.413330188016988840" type="sqp9.ContainerItemClearer" typeId="sqp9.413330188016988766" id="9003987136928189991">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928189992">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="9003987136928190007">
            <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="9003987136928190008">
              <property name="name" nameId="tpck.1169194664001" value="it" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190011">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Iterator" resolveInfo="Iterator" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190013">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9003987136928190019">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="9003987136928190020">
                  <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="9003987136928190021">
                    <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
                    <link role="classifier" roleId="tpee.1170346070688" targetNodeId="yv5b.8717063129899353109" resolveInfo="JComponentIterator" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.8717063129899353854" resolveInfo="JComponentIterator" />
                    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190022" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190023" />
                    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9003987136928190024">
                      <property name="name" nameId="tpck.1169194664001" value="accept" />
                      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190025" />
                      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="9003987136928190026" />
                      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="9003987136928190027">
                        <property name="name" nameId="tpck.1169194664001" value="item" />
                        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190028">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
                        </node>
                      </node>
                      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190029">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7948103825060777889">
                          <node role="expression" roleId="tpee.1068580123156" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="7948103825060777890">
                            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="7948103825060777891">
                              <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                              <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="yv5b.7948103825060318838" resolveInfo="NORTH" />
                            </node>
                            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777892">
                              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7948103825060777893">
                                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7948103825060777894">
                                  <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777895">
                                    <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7948103825060777896" />
                                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777897">
                                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetLayout()%cjava%dawt%dLayoutManager" resolveInfo="getLayout" />
                                    </node>
                                  </node>
                                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="873604604378899129">
                                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="yv5b.7948103825060305166" resolveInfo="DockLayout" />
                                  </node>
                                </node>
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777899">
                                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.7948103825060777805" resolveInfo="getConstraints" />
                                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7948103825060777900">
                                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190027" resolveInfo="item" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="9003987136928190037">
                        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" resolveInfo="Override" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190010">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190044">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190046">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9003987136928190045">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190008" resolveInfo="it" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190050">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Iterator%dnext()%cjava%dlang%dObject" resolveInfo="next" />
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190053">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190055">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9003987136928190054">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190008" resolveInfo="it" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190059">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Iterator%dremove()%cvoid" resolveInfo="remove" />
                  </node>
                </node>
              </node>
            </node>
            <node role="condition" roleId="tpee.1144231399730" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190039">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9003987136928190038">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190008" resolveInfo="it" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190043">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Iterator%dhasNext()%cboolean" resolveInfo="hasNext" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="containerTemplate" roleId="sqp9.4391079257750389359" type="sqp9.ContainerTemplate" typeId="sqp9.4391079257750389358" id="262873202872806610">
      <link role="container" roleId="sqp9.4391079257750389360" targetNodeId="2yj1.262873202871571545" resolveInfo="south" />
      <node role="itemAdder" roleId="sqp9.4391079257750634351" type="sqp9.ContainerItemAdder" typeId="sqp9.4391079257750550393" id="262873202872806611">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="262873202872806612">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="262873202872806613">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="262873202872806614">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="262873202872806615" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="262873202872806616">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dadd(java%dawt%dComponent,java%dlang%dObject)%cvoid" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="262873202872806617" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="262873202872806618">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1t7x.~BorderLayout%dSOUTH" resolveInfo="SOUTH" />
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemType" roleId="sqp9.4391079257750550448" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190072">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
      </node>
      <node role="itemInserter" roleId="sqp9.2459884175400018414" type="sqp9.ContainerItemInserter" typeId="sqp9.2459884175399840230" id="9003987136928190073">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190074">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190081">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190082">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190083" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190084">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dadd(java%dawt%dComponent,java%dlang%dObject,int)%cvoid" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="9003987136928190085" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="9003987136928190086">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1t7x.~BorderLayout%dSOUTH" resolveInfo="SOUTH" />
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190087">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="9003987136928190088">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Arrays%dasList(java%dlang%dObject%d%d%d)%cjava%dutil%dList" resolveInfo="asList" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="k7g3.~Arrays" resolveInfo="Arrays" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190089">
                      <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190090" />
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190091">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetComponents()%cjava%dawt%dComponent[]" resolveInfo="getComponents" />
                      </node>
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190092">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dindexOf(java%dlang%dObject)%cint" resolveInfo="indexOf" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.BeforeUIObjectParam" typeId="sqp9.2459884175399838883" id="9003987136928190093" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemRemover" roleId="sqp9.2459884175398375626" type="sqp9.ContainerItemRemover" typeId="sqp9.2459884175398146657" id="9003987136928190095">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190096">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190097">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190098">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190099" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190100">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dremove(java%dawt%dComponent)%cvoid" resolveInfo="remove" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="9003987136928190101" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemIterator" roleId="sqp9.7798684637310724192" type="sqp9.ContainerItemIterator" typeId="sqp9.7798684637310718056" id="9003987136928190103">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190104">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190105">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9003987136928190106">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="9003987136928190107">
                <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="9003987136928190108">
                  <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
                  <link role="classifier" roleId="tpee.1170346070688" targetNodeId="yv5b.8717063129899353109" resolveInfo="JComponentIterator" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.8717063129899353854" resolveInfo="JComponentIterator" />
                  <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190109" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190110" />
                  <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9003987136928190111">
                    <property name="name" nameId="tpck.1169194664001" value="accept" />
                    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190112" />
                    <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="9003987136928190113" />
                    <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="9003987136928190114">
                      <property name="name" nameId="tpck.1169194664001" value="item" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190115">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
                      </node>
                    </node>
                    <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190116">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7948103825060777901">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="7948103825060777902">
                          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="7948103825060777913">
                            <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="yv5b.7948103825060318840" resolveInfo="SOUTH" />
                            <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                          </node>
                          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777904">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7948103825060777905">
                              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7948103825060777906">
                                <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777907">
                                  <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7948103825060777908" />
                                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777909">
                                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetLayout()%cjava%dawt%dLayoutManager" resolveInfo="getLayout" />
                                  </node>
                                </node>
                                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="873604604378899130">
                                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="yv5b.7948103825060305166" resolveInfo="DockLayout" />
                                </node>
                              </node>
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777911">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.7948103825060777805" resolveInfo="getConstraints" />
                              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7948103825060777912">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190114" resolveInfo="item" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="9003987136928190124">
                      <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" resolveInfo="Override" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemClearer" roleId="sqp9.413330188016988840" type="sqp9.ContainerItemClearer" typeId="sqp9.413330188016988766" id="9003987136928190127">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190128">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="9003987136928190129">
            <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="9003987136928190130">
              <property name="name" nameId="tpck.1169194664001" value="it" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190131">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Iterator" resolveInfo="Iterator" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190132">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9003987136928190133">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="9003987136928190134">
                  <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="9003987136928190135">
                    <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
                    <link role="classifier" roleId="tpee.1170346070688" targetNodeId="yv5b.8717063129899353109" resolveInfo="JComponentIterator" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.8717063129899353854" resolveInfo="JComponentIterator" />
                    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190136" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190137" />
                    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9003987136928190138">
                      <property name="name" nameId="tpck.1169194664001" value="accept" />
                      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190139" />
                      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="9003987136928190140" />
                      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="9003987136928190141">
                        <property name="name" nameId="tpck.1169194664001" value="item" />
                        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190142">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
                        </node>
                      </node>
                      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190143">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7948103825060777914">
                          <node role="expression" roleId="tpee.1068580123156" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="7948103825060777915">
                            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="7948103825060777926">
                              <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="yv5b.7948103825060318840" resolveInfo="SOUTH" />
                              <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                            </node>
                            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777917">
                              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7948103825060777918">
                                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7948103825060777919">
                                  <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777920">
                                    <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7948103825060777921" />
                                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777922">
                                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetLayout()%cjava%dawt%dLayoutManager" resolveInfo="getLayout" />
                                    </node>
                                  </node>
                                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7948103825060777923">
                                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1t7x.~BorderLayout" resolveInfo="BorderLayout" />
                                  </node>
                                </node>
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777924">
                                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~BorderLayout%dgetConstraints(java%dawt%dComponent)%cjava%dlang%dObject" resolveInfo="getConstraints" />
                                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7948103825060777925">
                                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190141" resolveInfo="item" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="9003987136928190151">
                        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" resolveInfo="Override" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190152">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190153">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190154">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9003987136928190155">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190130" resolveInfo="it" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190156">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Iterator%dnext()%cjava%dlang%dObject" resolveInfo="next" />
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190157">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190158">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9003987136928190159">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190130" resolveInfo="it" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190160">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Iterator%dremove()%cvoid" resolveInfo="remove" />
                  </node>
                </node>
              </node>
            </node>
            <node role="condition" roleId="tpee.1144231399730" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190161">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9003987136928190162">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190130" resolveInfo="it" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190163">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Iterator%dhasNext()%cboolean" resolveInfo="hasNext" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="containerTemplate" roleId="sqp9.4391079257750389359" type="sqp9.ContainerTemplate" typeId="sqp9.4391079257750389358" id="262873202872806620">
      <link role="container" roleId="sqp9.4391079257750389360" targetNodeId="2yj1.262873202871571546" resolveInfo="east" />
      <node role="itemAdder" roleId="sqp9.4391079257750634351" type="sqp9.ContainerItemAdder" typeId="sqp9.4391079257750550393" id="262873202872806621">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="262873202872806622">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="262873202872806623">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="262873202872806624">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="262873202872806625" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="262873202872806626">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dadd(java%dawt%dComponent,java%dlang%dObject)%cvoid" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="262873202872806627" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="262873202872806628">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1t7x.~BorderLayout%dEAST" resolveInfo="EAST" />
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemType" roleId="sqp9.4391079257750550448" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190165">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
      </node>
      <node role="itemInserter" roleId="sqp9.2459884175400018414" type="sqp9.ContainerItemInserter" typeId="sqp9.2459884175399840230" id="9003987136928190173">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190174">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190181">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190182">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190183" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190184">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dadd(java%dawt%dComponent,java%dlang%dObject,int)%cvoid" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="9003987136928190185" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="9003987136928190186">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1t7x.~BorderLayout%dEAST" resolveInfo="EAST" />
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190187">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="9003987136928190188">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="k7g3.~Arrays" resolveInfo="Arrays" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Arrays%dasList(java%dlang%dObject%d%d%d)%cjava%dutil%dList" resolveInfo="asList" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190189">
                      <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190190" />
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190191">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetComponents()%cjava%dawt%dComponent[]" resolveInfo="getComponents" />
                      </node>
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190192">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dindexOf(java%dlang%dObject)%cint" resolveInfo="indexOf" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.BeforeUIObjectParam" typeId="sqp9.2459884175399838883" id="9003987136928190193" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemIterator" roleId="sqp9.7798684637310724192" type="sqp9.ContainerItemIterator" typeId="sqp9.7798684637310718056" id="9003987136928190201">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190202">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190203">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9003987136928190204">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="9003987136928190205">
                <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="9003987136928190206">
                  <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.8717063129899353854" resolveInfo="JComponentIterator" />
                  <link role="classifier" roleId="tpee.1170346070688" targetNodeId="yv5b.8717063129899353109" resolveInfo="JComponentIterator" />
                  <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190207" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190208" />
                  <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9003987136928190209">
                    <property name="name" nameId="tpck.1169194664001" value="accept" />
                    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190210" />
                    <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="9003987136928190211" />
                    <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="9003987136928190212">
                      <property name="name" nameId="tpck.1169194664001" value="item" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190213">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
                      </node>
                    </node>
                    <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190214">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7948103825060777927">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="7948103825060777928">
                          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="7948103825060777939">
                            <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="yv5b.7948103825060318842" resolveInfo="EAST" />
                            <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                          </node>
                          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777930">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7948103825060777931">
                              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7948103825060777932">
                                <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777933">
                                  <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7948103825060777934" />
                                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777935">
                                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetLayout()%cjava%dawt%dLayoutManager" resolveInfo="getLayout" />
                                  </node>
                                </node>
                                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="873604604378899131">
                                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="yv5b.7948103825060305166" resolveInfo="DockLayout" />
                                </node>
                              </node>
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777937">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.7948103825060777805" resolveInfo="getConstraints" />
                              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7948103825060777938">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190212" resolveInfo="item" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="9003987136928190222">
                      <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" resolveInfo="Override" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemRemover" roleId="sqp9.2459884175398375626" type="sqp9.ContainerItemRemover" typeId="sqp9.2459884175398146657" id="9003987136928190223">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190224">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190225">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190226">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190227" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190228">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dremove(java%dawt%dComponent)%cvoid" resolveInfo="remove" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="9003987136928190229" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemClearer" roleId="sqp9.413330188016988840" type="sqp9.ContainerItemClearer" typeId="sqp9.413330188016988766" id="9003987136928190232">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190233">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="9003987136928190234">
            <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="9003987136928190235">
              <property name="name" nameId="tpck.1169194664001" value="it" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190236">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Iterator" resolveInfo="Iterator" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190237">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9003987136928190238">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="9003987136928190239">
                  <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="9003987136928190240">
                    <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.8717063129899353854" resolveInfo="JComponentIterator" />
                    <link role="classifier" roleId="tpee.1170346070688" targetNodeId="yv5b.8717063129899353109" resolveInfo="JComponentIterator" />
                    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190241" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190242" />
                    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9003987136928190243">
                      <property name="name" nameId="tpck.1169194664001" value="accept" />
                      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190244" />
                      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="9003987136928190245" />
                      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="9003987136928190246">
                        <property name="name" nameId="tpck.1169194664001" value="item" />
                        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190247">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
                        </node>
                      </node>
                      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190248">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7948103825060777940">
                          <node role="expression" roleId="tpee.1068580123156" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="7948103825060777941">
                            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="7948103825060777952">
                              <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="yv5b.7948103825060318842" resolveInfo="EAST" />
                              <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                            </node>
                            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777943">
                              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7948103825060777944">
                                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7948103825060777945">
                                  <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777946">
                                    <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7948103825060777947" />
                                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777948">
                                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetLayout()%cjava%dawt%dLayoutManager" resolveInfo="getLayout" />
                                    </node>
                                  </node>
                                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="873604604378899132">
                                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="yv5b.7948103825060305166" resolveInfo="DockLayout" />
                                  </node>
                                </node>
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777950">
                                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.7948103825060777805" resolveInfo="getConstraints" />
                                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7948103825060777951">
                                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190246" resolveInfo="item" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="9003987136928190256">
                        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" resolveInfo="Override" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190257">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190258">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190259">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9003987136928190260">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190235" resolveInfo="it" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190261">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Iterator%dnext()%cjava%dlang%dObject" resolveInfo="next" />
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190262">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190263">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9003987136928190264">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190235" resolveInfo="it" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190265">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Iterator%dremove()%cvoid" resolveInfo="remove" />
                  </node>
                </node>
              </node>
            </node>
            <node role="condition" roleId="tpee.1144231399730" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190266">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9003987136928190267">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190235" resolveInfo="it" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190268">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Iterator%dhasNext()%cboolean" resolveInfo="hasNext" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="containerTemplate" roleId="sqp9.4391079257750389359" type="sqp9.ContainerTemplate" typeId="sqp9.4391079257750389358" id="262873202872806630">
      <link role="container" roleId="sqp9.4391079257750389360" targetNodeId="2yj1.262873202871571548" resolveInfo="west" />
      <node role="itemAdder" roleId="sqp9.4391079257750634351" type="sqp9.ContainerItemAdder" typeId="sqp9.4391079257750550393" id="262873202872806631">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="262873202872806632">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="262873202872806633">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="262873202872806634">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="262873202872806635" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="262873202872806636">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dadd(java%dawt%dComponent,java%dlang%dObject)%cvoid" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="262873202872806637" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="262873202872806638">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1t7x.~BorderLayout%dWEST" resolveInfo="WEST" />
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemType" roleId="sqp9.4391079257750550448" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190270">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
      </node>
      <node role="itemInserter" roleId="sqp9.2459884175400018414" type="sqp9.ContainerItemInserter" typeId="sqp9.2459884175399840230" id="9003987136928190283">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190284">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190291">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190292">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190293" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190294">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dadd(java%dawt%dComponent,java%dlang%dObject,int)%cvoid" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="9003987136928190295" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="9003987136928190296">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1t7x.~BorderLayout%dWEST" resolveInfo="WEST" />
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190297">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="9003987136928190298">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Arrays%dasList(java%dlang%dObject%d%d%d)%cjava%dutil%dList" resolveInfo="asList" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="k7g3.~Arrays" resolveInfo="Arrays" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190299">
                      <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190300" />
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190301">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetComponents()%cjava%dawt%dComponent[]" resolveInfo="getComponents" />
                      </node>
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190302">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dindexOf(java%dlang%dObject)%cint" resolveInfo="indexOf" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.BeforeUIObjectParam" typeId="sqp9.2459884175399838883" id="9003987136928190303" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemIterator" roleId="sqp9.7798684637310724192" type="sqp9.ContainerItemIterator" typeId="sqp9.7798684637310718056" id="9003987136928190311">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190312">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190313">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9003987136928190314">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="9003987136928190315">
                <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="9003987136928190316">
                  <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
                  <link role="classifier" roleId="tpee.1170346070688" targetNodeId="yv5b.8717063129899353109" resolveInfo="JComponentIterator" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.8717063129899353854" resolveInfo="JComponentIterator" />
                  <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190317" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190318" />
                  <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9003987136928190319">
                    <property name="name" nameId="tpck.1169194664001" value="accept" />
                    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190320" />
                    <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="9003987136928190321" />
                    <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="9003987136928190322">
                      <property name="name" nameId="tpck.1169194664001" value="item" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190323">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
                      </node>
                    </node>
                    <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190324">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7948103825060777953">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="7948103825060777954">
                          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="7948103825060777965">
                            <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="yv5b.7948103825060318844" resolveInfo="WEST" />
                            <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                          </node>
                          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777956">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7948103825060777957">
                              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7948103825060777958">
                                <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777959">
                                  <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7948103825060777960" />
                                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777961">
                                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetLayout()%cjava%dawt%dLayoutManager" resolveInfo="getLayout" />
                                  </node>
                                </node>
                                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="873604604378899133">
                                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="yv5b.7948103825060305166" resolveInfo="DockLayout" />
                                </node>
                              </node>
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777963">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.7948103825060777805" resolveInfo="getConstraints" />
                              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7948103825060777964">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190322" resolveInfo="item" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="9003987136928190332">
                      <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" resolveInfo="Override" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemRemover" roleId="sqp9.2459884175398375626" type="sqp9.ContainerItemRemover" typeId="sqp9.2459884175398146657" id="9003987136928190333">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190334">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190335">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190336">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190337" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190338">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dremove(java%dawt%dComponent)%cvoid" resolveInfo="remove" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="9003987136928190339" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemClearer" roleId="sqp9.413330188016988840" type="sqp9.ContainerItemClearer" typeId="sqp9.413330188016988766" id="9003987136928190342">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190343">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="9003987136928190344">
            <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="9003987136928190345">
              <property name="name" nameId="tpck.1169194664001" value="it" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190346">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Iterator" resolveInfo="Iterator" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190347">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9003987136928190348">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="9003987136928190349">
                  <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="9003987136928190350">
                    <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
                    <link role="classifier" roleId="tpee.1170346070688" targetNodeId="yv5b.8717063129899353109" resolveInfo="JComponentIterator" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.8717063129899353854" resolveInfo="JComponentIterator" />
                    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190351" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190352" />
                    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9003987136928190353">
                      <property name="name" nameId="tpck.1169194664001" value="accept" />
                      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190354" />
                      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="9003987136928190355" />
                      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="9003987136928190356">
                        <property name="name" nameId="tpck.1169194664001" value="item" />
                        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190357">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
                        </node>
                      </node>
                      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190358">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7948103825060777966">
                          <node role="expression" roleId="tpee.1068580123156" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="7948103825060777967">
                            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="7948103825060777978">
                              <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="yv5b.7948103825060318844" resolveInfo="WEST" />
                              <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                            </node>
                            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777969">
                              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7948103825060777970">
                                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7948103825060777971">
                                  <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777972">
                                    <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7948103825060777973" />
                                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777974">
                                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetLayout()%cjava%dawt%dLayoutManager" resolveInfo="getLayout" />
                                    </node>
                                  </node>
                                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="873604604378899134">
                                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="yv5b.7948103825060305166" resolveInfo="DockLayout" />
                                  </node>
                                </node>
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777976">
                                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.7948103825060777805" resolveInfo="getConstraints" />
                                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7948103825060777977">
                                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190356" resolveInfo="item" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="9003987136928190366">
                        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" resolveInfo="Override" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190367">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190368">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190369">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9003987136928190370">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190345" resolveInfo="it" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190371">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Iterator%dnext()%cjava%dlang%dObject" resolveInfo="next" />
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190372">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190373">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9003987136928190374">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190345" resolveInfo="it" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190375">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Iterator%dremove()%cvoid" resolveInfo="remove" />
                  </node>
                </node>
              </node>
            </node>
            <node role="condition" roleId="tpee.1144231399730" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190376">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9003987136928190377">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190345" resolveInfo="it" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190378">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Iterator%dhasNext()%cboolean" resolveInfo="hasNext" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="containerTemplate" roleId="sqp9.4391079257750389359" type="sqp9.ContainerTemplate" typeId="sqp9.4391079257750389358" id="380233880019445730">
      <link role="container" roleId="sqp9.4391079257750389360" targetNodeId="2yj1.380233880019413653" resolveInfo="center" />
      <node role="itemType" roleId="sqp9.4391079257750550448" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190380">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
      </node>
      <node role="itemAdder" roleId="sqp9.4391079257750634351" type="sqp9.ContainerItemAdder" typeId="sqp9.4391079257750550393" id="380233880019445732">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="380233880019445733">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="380233880019445736">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="380233880019445737">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="380233880019445738" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="380233880019445739">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dadd(java%dawt%dComponent,java%dlang%dObject)%cvoid" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="380233880019445740" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="380233880019445741">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1t7x.~BorderLayout%dCENTER" resolveInfo="CENTER" />
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemInserter" roleId="sqp9.2459884175400018414" type="sqp9.ContainerItemInserter" typeId="sqp9.2459884175399840230" id="9003987136928190388">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190389">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190396">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190397">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190398" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190399">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dadd(java%dawt%dComponent,java%dlang%dObject,int)%cvoid" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="9003987136928190400" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="9003987136928190401">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1t7x.~BorderLayout%dCENTER" resolveInfo="CENTER" />
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190402">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="9003987136928190403">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Arrays%dasList(java%dlang%dObject%d%d%d)%cjava%dutil%dList" resolveInfo="asList" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="k7g3.~Arrays" resolveInfo="Arrays" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190404">
                      <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190405" />
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190406">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetComponents()%cjava%dawt%dComponent[]" resolveInfo="getComponents" />
                      </node>
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190407">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dindexOf(java%dlang%dObject)%cint" resolveInfo="indexOf" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.BeforeUIObjectParam" typeId="sqp9.2459884175399838883" id="9003987136928190408" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemIterator" roleId="sqp9.7798684637310724192" type="sqp9.ContainerItemIterator" typeId="sqp9.7798684637310718056" id="9003987136928190416">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190417">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190418">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9003987136928190419">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="9003987136928190420">
                <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="9003987136928190421">
                  <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.8717063129899353854" resolveInfo="JComponentIterator" />
                  <link role="classifier" roleId="tpee.1170346070688" targetNodeId="yv5b.8717063129899353109" resolveInfo="JComponentIterator" />
                  <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190422" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190423" />
                  <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9003987136928190424">
                    <property name="name" nameId="tpck.1169194664001" value="accept" />
                    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190425" />
                    <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="9003987136928190426" />
                    <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="9003987136928190427">
                      <property name="name" nameId="tpck.1169194664001" value="item" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190428">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
                      </node>
                    </node>
                    <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190429">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7948103825060777979">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="7948103825060777980">
                          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="7948103825060777991">
                            <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="yv5b.7948103825060318846" resolveInfo="CENTER" />
                            <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                          </node>
                          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777982">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7948103825060777983">
                              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7948103825060777984">
                                <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777985">
                                  <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7948103825060777986" />
                                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777987">
                                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetLayout()%cjava%dawt%dLayoutManager" resolveInfo="getLayout" />
                                  </node>
                                </node>
                                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="873604604378899135">
                                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="yv5b.7948103825060305166" resolveInfo="DockLayout" />
                                </node>
                              </node>
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060777989">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.7948103825060777805" resolveInfo="getConstraints" />
                              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7948103825060777990">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190427" resolveInfo="item" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="9003987136928190437">
                      <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" resolveInfo="Override" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemRemover" roleId="sqp9.2459884175398375626" type="sqp9.ContainerItemRemover" typeId="sqp9.2459884175398146657" id="9003987136928190438">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190439">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190440">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190441">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190442" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190443">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dremove(java%dawt%dComponent)%cvoid" resolveInfo="remove" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="9003987136928190444" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemClearer" roleId="sqp9.413330188016988840" type="sqp9.ContainerItemClearer" typeId="sqp9.413330188016988766" id="9003987136928190447">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190448">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="9003987136928190449">
            <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="9003987136928190450">
              <property name="name" nameId="tpck.1169194664001" value="it" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190451">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Iterator" resolveInfo="Iterator" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190452">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9003987136928190453">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="9003987136928190454">
                  <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="9003987136928190455">
                    <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.8717063129899353854" resolveInfo="JComponentIterator" />
                    <link role="classifier" roleId="tpee.1170346070688" targetNodeId="yv5b.8717063129899353109" resolveInfo="JComponentIterator" />
                    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190456" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="9003987136928190457" />
                    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9003987136928190458">
                      <property name="name" nameId="tpck.1169194664001" value="accept" />
                      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9003987136928190459" />
                      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="9003987136928190460" />
                      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="9003987136928190461">
                        <property name="name" nameId="tpck.1169194664001" value="item" />
                        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9003987136928190462">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
                        </node>
                      </node>
                      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190463">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7948103825060777992">
                          <node role="expression" roleId="tpee.1068580123156" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="7948103825060777993">
                            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="7948103825060778004">
                              <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="yv5b.7948103825060318846" resolveInfo="CENTER" />
                              <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="yv5b.7948103825060318837" resolveInfo="DockLayoutData" />
                            </node>
                            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777995">
                              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7948103825060777996">
                                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7948103825060777997">
                                  <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7948103825060777998">
                                    <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7948103825060777999" />
                                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060778000">
                                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetLayout()%cjava%dawt%dLayoutManager" resolveInfo="getLayout" />
                                    </node>
                                  </node>
                                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="873604604378899136">
                                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="yv5b.7948103825060305166" resolveInfo="DockLayout" />
                                  </node>
                                </node>
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7948103825060778002">
                                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.7948103825060777805" resolveInfo="getConstraints" />
                                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7948103825060778003">
                                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190461" resolveInfo="item" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="9003987136928190471">
                        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" resolveInfo="Override" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="9003987136928190472">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190473">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190474">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9003987136928190475">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190450" resolveInfo="it" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190476">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Iterator%dnext()%cjava%dlang%dObject" resolveInfo="next" />
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9003987136928190477">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190478">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9003987136928190479">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190450" resolveInfo="it" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190480">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Iterator%dremove()%cvoid" resolveInfo="remove" />
                  </node>
                </node>
              </node>
            </node>
            <node role="condition" roleId="tpee.1144231399730" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9003987136928190481">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9003987136928190482">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9003987136928190450" resolveInfo="it" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9003987136928190483">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Iterator%dhasNext()%cboolean" resolveInfo="hasNext" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="2482864227446593900">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="2482864227446630461">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2482864227446630462">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2482864227446636993">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2482864227446636994">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2482864227446666028">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JTabbedPane%d&lt;init&gt;()" resolveInfo="JTabbedPane" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2482864227446630460">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JTabbedPane" resolveInfo="JTabbedPane" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="2482864227446593902" />
    <node role="containerTemplate" roleId="sqp9.4391079257750389359" type="sqp9.ContainerTemplate" typeId="sqp9.4391079257750389358" id="8398594558944390647">
      <link role="container" roleId="sqp9.4391079257750389360" targetNodeId="2yj1.6424935405034500198" resolveInfo="tabs" />
      <node role="itemType" roleId="sqp9.4391079257750550448" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8398594558944629577">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1t7x.~Component" resolveInfo="Component" />
      </node>
      <node role="itemAdder" roleId="sqp9.4391079257750634351" type="sqp9.ContainerItemAdder" typeId="sqp9.4391079257750550393" id="8398594558944390649">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8398594558944390650">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8398594558944727399">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8398594558944727401">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="8398594558944727400" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8398594558944734981">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JTabbedPane%daddTab(java%dlang%dString,java%dawt%dComponent)%cvoid" resolveInfo="addTab" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.AspectParameterRef" typeId="sqp9.5572604531249464315" id="7930737280445896936">
                  <link role="parameterDecl" roleId="sqp9.5572604531249464316" targetNodeId="7930737280445896935" resolveInfo="name" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="8398594558944734985" />
              </node>
            </node>
          </node>
        </node>
        <node role="aspectParameter" roleId="sqp9.5572604531249464318" type="sqp9.AspectParameterDecl" typeId="sqp9.5572604531249464313" id="7930737280445896935">
          <link role="aspectDef" roleId="sqp9.5572604531249464314" targetNodeId="2yj1.6424935405034832713" resolveInfo="name" />
        </node>
      </node>
    </node>
  </root>
  <root id="6399754879758206694">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="6399754879758257552">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6399754879758257553">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6399754879758257554">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6399754879758257555">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6399754879758257557">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JTree%d&lt;init&gt;()" resolveInfo="JTree" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6399754879758208314">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JTree" resolveInfo="JTree" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="6399754879758206696" />
    <node role="containerTemplate" roleId="sqp9.4391079257750389359" type="sqp9.ContainerTemplate" typeId="sqp9.4391079257750389358" id="6399754879758208315">
      <link role="container" roleId="sqp9.4391079257750389360" targetNodeId="2yj1.6399754879758206689" resolveInfo="root" />
      <node role="itemAdder" roleId="sqp9.4391079257750634351" type="sqp9.ContainerItemAdder" typeId="sqp9.4391079257750550393" id="6399754879758208317">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6399754879758208318">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6399754879758224636">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6399754879758224638">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="6399754879758224637" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6399754879758224642">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JTree%dsetModel(javax%dswing%dtree%dTreeModel)%cvoid" resolveInfo="setModel" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6399754879758224643">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6399754879758253320">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="osf5.~DefaultTreeModel%d&lt;init&gt;(javax%dswing%dtree%dTreeNode)" resolveInfo="DefaultTreeModel" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="6399754879758253322" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemType" roleId="sqp9.4391079257750550448" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6399754879758224635">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="osf5.~TreeNode" resolveInfo="TreeNode" />
      </node>
    </node>
  </root>
  <root id="6399754879758253323">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="6399754879758253327">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6399754879758253328">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6399754879758253395">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6399754879758253396">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6399754879758253397">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="osf5.~DefaultMutableTreeNode%d&lt;init&gt;()" resolveInfo="DefaultMutableTreeNode" />
            </node>
          </node>
        </node>
      </node>
      <node role="context" roleId="sqp9.1642651187739182158" type="sqp9.Context" typeId="sqp9.1642651187739181626" id="6399754879758253337">
        <link role="uiObject" roleId="sqp9.1642651187739181627" targetNodeId="2yj1.6399754879758206671" resolveInfo="TreeNode" />
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6399754879758253326">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="osf5.~TreeNode" resolveInfo="TreeNode" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="6399754879758253325" />
    <node role="containerTemplate" roleId="sqp9.4391079257750389359" type="sqp9.ContainerTemplate" typeId="sqp9.4391079257750389358" id="6399754879758253389">
      <link role="container" roleId="sqp9.4391079257750389360" targetNodeId="2yj1.7936848552255362159" resolveInfo="children" />
      <node role="itemType" roleId="sqp9.4391079257750550448" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6399754879758253393">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="osf5.~TreeNode" resolveInfo="TreeNode" />
      </node>
      <node role="itemAdder" roleId="sqp9.4391079257750634351" type="sqp9.ContainerItemAdder" typeId="sqp9.4391079257750550393" id="6399754879758253391">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6399754879758253392">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6399754879758253398">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6399754879758253399">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6399754879758253400">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6399754879758253401">
                  <node role="expression" roleId="tpee.1070534934092" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="6399754879758263979" />
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6399754879758253403">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="osf5.~DefaultMutableTreeNode" resolveInfo="DefaultMutableTreeNode" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6399754879758253404">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="osf5.~DefaultMutableTreeNode%dadd(javax%dswing%dtree%dMutableTreeNode)%cvoid" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6399754879758253406">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6399754879758253409">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="osf5.~MutableTreeNode" resolveInfo="MutableTreeNode" />
                  </node>
                  <node role="expression" roleId="tpee.1070534934092" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="6399754879758253405" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="propertyAccessor" roleId="sqp9.4643695836678928899" type="sqp9.UIPropertyAccessCode" typeId="sqp9.4643695836678934010" id="6399754879758260168">
      <link role="property" roleId="sqp9.4643695836678934012" targetNodeId="2yj1.7936848552255362160" resolveInfo="userObject" />
      <node role="getter" roleId="sqp9.4643695836679531005" type="sqp9.UIPropertyGetter" typeId="sqp9.4643695836679547748" id="6399754879758260169">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6399754879758260170">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6399754879758260179">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6399754879758260186">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6399754879758260180">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6399754879758260182">
                  <node role="expression" roleId="tpee.1070534934092" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="6399754879758260185" />
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6399754879758260184">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="osf5.~DefaultMutableTreeNode" resolveInfo="DefaultMutableTreeNode" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6399754879758260190">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="osf5.~DefaultMutableTreeNode%dgetUserObject()%cjava%dlang%dObject" resolveInfo="getUserObject" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="setter" roleId="sqp9.4643695836679531004" type="sqp9.UIPropertySetter" typeId="sqp9.4643695836679547626" id="6399754879758260171">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6399754879758260172">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6399754879758260191">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6399754879758260192">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6399754879758260193">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6399754879758260194">
                  <node role="expression" roleId="tpee.1070534934092" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="6399754879758260195" />
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6399754879758260196">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="osf5.~DefaultMutableTreeNode" resolveInfo="DefaultMutableTreeNode" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6399754879758260198">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="osf5.~DefaultMutableTreeNode%dsetUserObject(java%dlang%dObject)%cvoid" resolveInfo="setUserObject" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.PropertyValueParam" typeId="sqp9.4643695836679547628" id="6399754879758260200" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="7383889057843473725">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="7383889057843475346">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7383889057843475347">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8915860021643493768">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8915860021643493769">
            <property name="name" nameId="tpck.1169194664001" value="jt" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8915860021643493770">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JTable" resolveInfo="JTable" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8915860021643493771">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="8915860021643493772">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JTable%d&lt;init&gt;()" resolveInfo="JTable" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8915860021643493780">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8915860021643493781">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="8915860021643521137">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JScrollPane%d&lt;init&gt;(java%dawt%dComponent)" resolveInfo="JScrollPane" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8915860021643521138">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8915860021643493769" resolveInfo="jt" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8915860021643493778">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JScrollPane" resolveInfo="JScrollPane" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="7383889057843473727">
      <node role="auxTemplate" roleId="sqp9.1412244996131394685" type="sqp9.AuxObjectTemplate" typeId="sqp9.1412244996130857074" id="8915860021643493763">
        <property name="name" nameId="tpck.1169194664001" value="theTable" />
        <node role="runtimeType" roleId="sqp9.1412244996130857075" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8915860021643493767">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JTable" resolveInfo="JTable" />
        </node>
        <node role="factory" roleId="sqp9.1412244996130860595" type="sqp9.AuxObjectFactory" typeId="sqp9.1412244996130857078" id="8915860021643493765">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8915860021643493766">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8915860021643521139">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8915860021643521155">
                <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8915860021643521156">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8915860021643521157">
                    <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="8915860021643521158" />
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8915860021643521159">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JScrollPane%dgetViewport()%cjavax%dswing%dJViewport" resolveInfo="getViewport" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8915860021643521160">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JViewport%dgetView()%cjava%dawt%dComponent" resolveInfo="getView" />
                  </node>
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8915860021643521161">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JTable" resolveInfo="JTable" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="containerTemplate" roleId="sqp9.4391079257750389359" type="sqp9.ContainerTemplate" typeId="sqp9.4391079257750389358" id="7383889057843483878">
      <link role="container" roleId="sqp9.4391079257750389360" targetNodeId="2yj1.3616339824038886159" resolveInfo="columns" />
      <node role="itemType" roleId="sqp9.4391079257750550448" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7383889057843483886">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gsmj.~TableColumn" resolveInfo="TableColumn" />
      </node>
      <node role="itemAdder" roleId="sqp9.4391079257750634351" type="sqp9.ContainerItemAdder" typeId="sqp9.4391079257750550393" id="7383889057843483880">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7383889057843483881">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7383889057843483888">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7383889057843483890">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7383889057843490592">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JTable%daddColumn(javax%dswing%dtable%dTableColumn)%cvoid" resolveInfo="addColumn" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="7383889057843490593" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="8915860021643534791">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8915860021643534800">
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8915860021643534801">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8915860021643534802">
                      <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="8915860021643534803" />
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8915860021643534804">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JScrollPane%dgetViewport()%cjavax%dswing%dJViewport" resolveInfo="getViewport" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8915860021643534805">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JViewport%dgetView()%cjava%dawt%dComponent" resolveInfo="getView" />
                    </node>
                  </node>
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8915860021643534806">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JTable" resolveInfo="JTable" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8915860021643471679">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8915860021643471680">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="8915860021643471681">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8915860021643471682">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8915860021643471683">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gsmj.~DefaultTableModel" resolveInfo="DefaultTableModel" />
                  </node>
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8915860021643471684">
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8915860021643471686">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JTable%dgetModel()%cjavax%dswing%dtable%dTableModel" resolveInfo="getModel" />
                    </node>
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="8915860021643534782">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8915860021643534784">
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8915860021643534785">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8915860021643534786">
                            <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="8915860021643534787" />
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8915860021643534788">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JScrollPane%dgetViewport()%cjavax%dswing%dJViewport" resolveInfo="getViewport" />
                            </node>
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8915860021643534789">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JViewport%dgetView()%cjava%dawt%dComponent" resolveInfo="getView" />
                          </node>
                        </node>
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8915860021643534790">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JTable" resolveInfo="JTable" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8915860021643471687">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gsmj.~DefaultTableModel%daddColumn(java%dlang%dObject)%cvoid" resolveInfo="addColumn" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8915860021643471689">
                  <node role="operand" roleId="tpee.1197027771414" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="8915860021643471688" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8915860021643471693">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gsmj.~TableColumn%dgetHeaderValue()%cjava%dlang%dObject" resolveInfo="getHeaderValue" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="containerTemplate" roleId="sqp9.4391079257750389359" type="sqp9.ContainerTemplate" typeId="sqp9.4391079257750389358" id="7383889057843483882">
      <link role="container" roleId="sqp9.4391079257750389360" targetNodeId="2yj1.3616339824038886160" resolveInfo="rows" />
      <node role="itemType" roleId="sqp9.4391079257750550448" type="tpee.ArrayType" typeId="tpee.1070534760951" id="7383889057843490594">
        <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7383889057843483887">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
        </node>
      </node>
      <node role="itemAdder" roleId="sqp9.4391079257750634351" type="sqp9.ContainerItemAdder" typeId="sqp9.4391079257750550393" id="7383889057843483884">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7383889057843483885">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7383889057843490596">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7383889057843490615">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7383889057843490609">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7383889057843490610">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7383889057843490611">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gsmj.~DefaultTableModel" resolveInfo="DefaultTableModel" />
                  </node>
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7383889057843490612">
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7383889057843490614">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JTable%dgetModel()%cjavax%dswing%dtable%dTableModel" resolveInfo="getModel" />
                    </node>
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="8915860021643534807">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8915860021643534809">
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8915860021643534810">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8915860021643534811">
                            <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="8915860021643534812" />
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8915860021643534813">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JScrollPane%dgetViewport()%cjavax%dswing%dJViewport" resolveInfo="getViewport" />
                            </node>
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8915860021643534814">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JViewport%dgetView()%cjava%dawt%dComponent" resolveInfo="getView" />
                          </node>
                        </node>
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8915860021643534815">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JTable" resolveInfo="JTable" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7383889057843490619">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gsmj.~DefaultTableModel%daddRow(java%dlang%dObject[])%cvoid" resolveInfo="addRow" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="7383889057843490620" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="7383889057843490669">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="7383889057843490673">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7383889057843490674">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7383889057843490675">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7383889057843490676">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7383889057843513683">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Vector%d&lt;init&gt;()" resolveInfo="Vector" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7383889057843490672">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Vector" resolveInfo="Vector" />
      <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7383889057843513728">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
      </node>
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="7383889057843490671" />
    <node role="propertyAccessor" roleId="sqp9.4643695836678928899" type="sqp9.UIPropertyAccessCode" typeId="sqp9.4643695836678934010" id="7383889057843513684">
      <link role="property" roleId="sqp9.4643695836678934012" targetNodeId="2yj1.3616339824038886166" resolveInfo="data" />
      <node role="getter" roleId="sqp9.4643695836679531005" type="sqp9.UIPropertyGetter" typeId="sqp9.4643695836679547748" id="7383889057843513685">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7383889057843513686">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7383889057843513689">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7383889057843513691">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7383889057843513690" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7383889057843513695">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Vector%dtoArray()%cjava%dlang%dObject[]" resolveInfo="toArray" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="setter" roleId="sqp9.4643695836679531004" type="sqp9.UIPropertySetter" typeId="sqp9.4643695836679547626" id="7383889057843513687">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7383889057843513688">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7383889057843513696">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7383889057843513698">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7383889057843513697" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7383889057843513702">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Vector%dclear()%cvoid" resolveInfo="clear" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7383889057843513704">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7383889057843513706">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7383889057843513705" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7383889057843513710">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Vector%daddAll(java%dutil%dCollection)%cboolean" resolveInfo="addAll" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7383889057843513714">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Arrays%dasList(java%dlang%dObject%d%d%d)%cjava%dutil%dList" resolveInfo="asList" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="k7g3.~Arrays" resolveInfo="Arrays" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.PropertyValueParam" typeId="sqp9.4643695836679547628" id="7383889057843513718" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="7383889057843526540">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="7383889057843526730">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7383889057843526731">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7383889057843526732">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7383889057843526733">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7383889057843526735">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gsmj.~TableColumn%d&lt;init&gt;(int)" resolveInfo="TableColumn" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7383889057843526738">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8915860021643545756">
                  <node role="operand" roleId="tpee.1197027771414" type="sqp9.ContextUIObjectParam" typeId="sqp9.7655275107718250839" id="7383889057843526737" />
                  <node role="operation" roleId="tpee.1197027833540" type="sqp9.AuxObjectAccessOp" typeId="sqp9.1412244996131807615" id="8915860021643545760">
                    <link role="template" roleId="sqp9.1412244996131808157" targetNodeId="8915860021643493763" resolveInfo="theTable" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7383889057843526742">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JTable%dgetColumnCount()%cint" resolveInfo="getColumnCount" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="context" roleId="sqp9.1642651187739182158" type="sqp9.Context" typeId="sqp9.1642651187739181626" id="7383889057843526736">
        <link role="uiObject" roleId="sqp9.1642651187739181627" targetNodeId="2yj1.3616339824038852574" resolveInfo="Table" />
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7383889057843526729">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gsmj.~TableColumn" resolveInfo="TableColumn" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="7383889057843526542" />
    <node role="propertyAccessor" roleId="sqp9.4643695836678928899" type="sqp9.UIPropertyAccessCode" typeId="sqp9.4643695836678934010" id="7383889057843526743">
      <link role="property" roleId="sqp9.4643695836678934012" targetNodeId="2yj1.3616339824038886162" resolveInfo="name" />
      <node role="getter" roleId="sqp9.4643695836679531005" type="sqp9.UIPropertyGetter" typeId="sqp9.4643695836679547748" id="7383889057843526744">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7383889057843526745">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7383889057843526748">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7383889057843526756">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dvalueOf(java%dlang%dObject)%cjava%dlang%dString" resolveInfo="valueOf" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~String" resolveInfo="String" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7383889057843526757">
                <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7383889057843526758" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7383889057843526759">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gsmj.~TableColumn%dgetHeaderValue()%cjava%dlang%dObject" resolveInfo="getHeaderValue" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="setter" roleId="sqp9.4643695836679531004" type="sqp9.UIPropertySetter" typeId="sqp9.4643695836679547626" id="7383889057843526746">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7383889057843526747">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7383889057843526760">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7383889057843526762">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7383889057843526761" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7383889057843526766">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gsmj.~TableColumn%dsetHeaderValue(java%dlang%dObject)%cvoid" resolveInfo="setHeaderValue" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.PropertyValueParam" typeId="sqp9.4643695836679547628" id="7383889057843526767" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="513490887686307657">
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5220699420101859969">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="yv5b.2204726755035753584" resolveInfo="JXSingleTaskPaneContainer" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="513490887686307659" />
    <node role="geometry" roleId="sqp9.3329614760087020873" type="sqp9.Geometry" typeId="sqp9.4033850706585269114" id="513490887686307660" />
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="5220699420101859970">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="5220699420101859971">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5220699420101859972">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="5220699420101859973">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="5220699420101859975">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.2204726755035753586" resolveInfo="JXSingleTaskPaneContainer" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="513490887686345260">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="513490887686346109">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="513490887686346110">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="513490887686346111">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="513490887686346112">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="513490887686346114">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv5b.5220699420101883039" resolveInfo="JXSingleTaskPane" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5220699420101883204">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="yv5b.5220699420101883037" resolveInfo="JXSingleTaskPane" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="513490887686345262" />
    <node role="geometry" roleId="sqp9.3329614760087020873" type="sqp9.Geometry" typeId="sqp9.4033850706585269114" id="513490887686345263" />
    <node role="propertyAccessor" roleId="sqp9.4643695836678928899" type="sqp9.UIPropertyAccessCode" typeId="sqp9.4643695836678934010" id="513490887686346115">
      <link role="property" roleId="sqp9.4643695836678934012" targetNodeId="2yj1.513490887686296703" resolveInfo="title" />
      <node role="getter" roleId="sqp9.4643695836679531005" type="sqp9.UIPropertyGetter" typeId="sqp9.4643695836679547748" id="513490887686346116">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="513490887686346117">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="513490887686346120">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="513490887686353694">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="513490887686346121" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="513490887686353698">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="juh8.~JXTaskPane%dgetTitle()%cjava%dlang%dString" resolveInfo="getTitle" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="setter" roleId="sqp9.4643695836679531004" type="sqp9.UIPropertySetter" typeId="sqp9.4643695836679547626" id="513490887686346118">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="513490887686346119">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="513490887686353699">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="513490887686353701">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="513490887686353700" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="513490887686353705">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="juh8.~JXTaskPane%dsetTitle(java%dlang%dString)%cvoid" resolveInfo="setTitle" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.PropertyValueParam" typeId="sqp9.4643695836679547628" id="513490887686353706" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="7617727720684702922">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="7617727720684716645">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7617727720684716646">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7617727720684722180">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7617727720684722181">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7617727720684722183">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JPanel%d&lt;init&gt;(java%dawt%dLayoutManager)" resolveInfo="JPanel" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7617727720684722184">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7617727720684722910">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~GridLayout%d&lt;init&gt;(int,int)" resolveInfo="GridLayout" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2925275022462384259">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2925275022462384261">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7617727720684716644">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JPanel" resolveInfo="JPanel" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="7617727720684702924" />
    <node role="geometry" roleId="sqp9.3329614760087020873" type="sqp9.Geometry" typeId="sqp9.4033850706585269114" id="7617727720684702925" />
    <node role="containerTemplate" roleId="sqp9.4391079257750389359" type="sqp9.ContainerTemplate" typeId="sqp9.4391079257750389358" id="4850120319523368897">
      <link role="container" roleId="sqp9.4391079257750389360" targetNodeId="2yj1.4850120319523368884" resolveInfo="child" />
      <node role="itemAdder" roleId="sqp9.4391079257750634351" type="sqp9.ContainerItemAdder" typeId="sqp9.4391079257750550393" id="4850120319523368899">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4850120319523368900">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4850120319523368910">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4850120319523368912">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="4850120319523368911" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4850120319523375624">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dadd(java%dawt%dComponent)%cjava%dawt%dComponent" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="4850120319523375625" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="itemInserter" roleId="sqp9.2459884175400018414" type="sqp9.ContainerItemInserter" typeId="sqp9.2459884175399840230" id="4850120319523368901">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4850120319523368902" />
      </node>
      <node role="itemIterator" roleId="sqp9.7798684637310724192" type="sqp9.ContainerItemIterator" typeId="sqp9.7798684637310718056" id="4850120319523368903">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4850120319523368904" />
      </node>
      <node role="itemRemover" roleId="sqp9.2459884175398375626" type="sqp9.ContainerItemRemover" typeId="sqp9.2459884175398146657" id="4850120319523368905">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4850120319523368906" />
      </node>
      <node role="itemClearer" roleId="sqp9.413330188016988840" type="sqp9.ContainerItemClearer" typeId="sqp9.413330188016988766" id="4850120319523368907">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4850120319523368908" />
      </node>
      <node role="itemType" roleId="sqp9.4391079257750550448" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4850120319523368909">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
      </node>
    </node>
  </root>
  <root id="7617727720684733812">
    <node role="containerTemplate" roleId="sqp9.4391079257750389359" type="sqp9.ContainerTemplate" typeId="sqp9.4391079257750389358" id="7617727720685138806">
      <link role="container" roleId="sqp9.4391079257750389360" targetNodeId="2yj1.2663453265346089637" resolveInfo="layoutChildren" />
      <node role="itemAdder" roleId="sqp9.4391079257750634351" type="sqp9.ContainerItemAdder" typeId="sqp9.4391079257750550393" id="7617727720685138808">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7617727720685138809">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7617727720685157667">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7617727720685157669">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7617727720685157668" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7617727720685157673">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dadd(java%dawt%dComponent)%cjava%dawt%dComponent" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="7617727720685157674" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="sqp9.ApplyConstraintStatement" typeId="sqp9.7617727720684733989" id="7617727720685138818">
            <node role="constraint" roleId="sqp9.7617727720684733991" type="sqp9.AspectParameterRef" typeId="sqp9.5572604531249464315" id="7930737280445896934">
              <link role="parameterDecl" roleId="sqp9.5572604531249464316" targetNodeId="7930737280445896933" resolveInfo="cons" />
            </node>
            <node role="widget" roleId="sqp9.7617727720684733992" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="7617727720685138837" />
            <node role="container" roleId="sqp9.7617727720684733993" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7617727720685138838" />
          </node>
        </node>
        <node role="aspectParameter" roleId="sqp9.5572604531249464318" type="sqp9.AspectParameterDecl" typeId="sqp9.5572604531249464313" id="7930737280445896933">
          <link role="aspectDef" roleId="sqp9.5572604531249464314" targetNodeId="2yj1.2663453265346089638" resolveInfo="cons" />
        </node>
      </node>
      <node role="itemInserter" roleId="sqp9.2459884175400018414" type="sqp9.ContainerItemInserter" typeId="sqp9.2459884175399840230" id="7617727720685138810">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7617727720685138811" />
      </node>
      <node role="itemIterator" roleId="sqp9.7798684637310724192" type="sqp9.ContainerItemIterator" typeId="sqp9.7798684637310718056" id="7617727720685138812">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7617727720685138813" />
      </node>
      <node role="itemRemover" roleId="sqp9.2459884175398375626" type="sqp9.ContainerItemRemover" typeId="sqp9.2459884175398146657" id="7617727720685138814">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7617727720685138815" />
      </node>
      <node role="itemClearer" roleId="sqp9.413330188016988840" type="sqp9.ContainerItemClearer" typeId="sqp9.413330188016988766" id="7617727720685138816">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7617727720685138817" />
      </node>
      <node role="itemType" roleId="sqp9.4391079257750550448" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7617727720685157665">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1t7x.~Component" resolveInfo="Component" />
      </node>
    </node>
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="7617727720684733817">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7617727720684733818">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9082907552716450565">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9082907552716450566">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="9082907552716450567">
              <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="9082907552716450568">
                <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JPanel%d&lt;init&gt;(java%dawt%dLayoutManager)" resolveInfo="JPanel" />
                <link role="classifier" roleId="tpee.1170346070688" targetNodeId="dbrf.~JPanel" resolveInfo="JPanel" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9082907552716450569">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9082907552716450570">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~SpringLayout%d&lt;init&gt;()" resolveInfo="SpringLayout" />
                  </node>
                </node>
                <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9082907552716450571" />
                <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9082907552716450572">
                  <property name="name" nameId="tpck.1169194664001" value="addNotify" />
                  <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9082907552716450573" />
                  <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="9082907552716450574" />
                  <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9082907552716450575">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9082907552716450576">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.SuperMethodCall" typeId="tpee.1073063089578" id="9082907552716450577">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JComponent%daddNotify()%cvoid" resolveInfo="addNotify" />
                      </node>
                    </node>
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="9082907552716450578">
                      <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="9082907552716450579">
                        <property name="isFinal" nameId="tpee.1176718929932" value="true" />
                        <property name="name" nameId="tpck.1169194664001" value="jp" />
                        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9082907552716450580">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JPanel" resolveInfo="JPanel" />
                        </node>
                        <node role="initializer" roleId="tpee.1068431790190" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="9082907552716450581" />
                      </node>
                    </node>
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9082907552716450582">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9082907552716450583">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9082907552716450584">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="9082907552716450585" />
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9082907552716450586">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Component%dgetParent()%cjava%dawt%dContainer" resolveInfo="getParent" />
                          </node>
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9082907552716450587">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Component%daddComponentListener(java%dawt%devent%dComponentListener)%cvoid" resolveInfo="addComponentListener" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9082907552716450588">
                            <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="9082907552716450589">
                              <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="9082907552716450590">
                                <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
                                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8q6x.~ComponentAdapter%d&lt;init&gt;()" resolveInfo="ComponentAdapter" />
                                <link role="classifier" roleId="tpee.1170346070688" targetNodeId="8q6x.~ComponentAdapter" resolveInfo="ComponentAdapter" />
                                <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9082907552716450591" />
                                <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9082907552716450592">
                                  <property name="name" nameId="tpck.1169194664001" value="componentResized" />
                                  <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9082907552716450593" />
                                  <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="9082907552716450594" />
                                  <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="9082907552716450595">
                                    <property name="name" nameId="tpck.1169194664001" value="ce" />
                                    <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9082907552716450596">
                                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8q6x.~ComponentEvent" resolveInfo="ComponentEvent" />
                                    </node>
                                  </node>
                                  <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9082907552716450597">
                                    <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="9082907552716450598">
                                      <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="9082907552716450599">
                                        <property name="name" nameId="tpck.1169194664001" value="dim" />
                                        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9082907552716450600">
                                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1t7x.~Dimension" resolveInfo="Dimension" />
                                        </node>
                                        <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9082907552716450601">
                                          <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9082907552716450602">
                                            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="9082907552716450603">
                                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9082907552716450595" resolveInfo="ce" />
                                            </node>
                                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9082907552716450604">
                                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8q6x.~ComponentEvent%dgetComponent()%cjava%dawt%dComponent" resolveInfo="getComponent" />
                                            </node>
                                          </node>
                                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9082907552716450605">
                                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Component%dgetSize()%cjava%dawt%dDimension" resolveInfo="getSize" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9082907552716450606">
                                      <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9082907552716450607">
                                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9082907552716450608">
                                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~SpringLayout%dputConstraint(java%dlang%dString,java%dawt%dComponent,javax%dswing%dSpring,java%dlang%dString,java%dawt%dComponent)%cvoid" resolveInfo="putConstraint" />
                                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="9082907552716450609">
                                            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="dbrf.~SpringLayout" resolveInfo="SpringLayout" />
                                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="dbrf.~SpringLayout%dSOUTH" resolveInfo="SOUTH" />
                                          </node>
                                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9082907552716450610">
                                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9082907552716450579" resolveInfo="jp" />
                                          </node>
                                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="9082907552716450611">
                                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~Spring%dconstant(int)%cjavax%dswing%dSpring" resolveInfo="constant" />
                                            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="dbrf.~Spring" resolveInfo="Spring" />
                                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9082907552716450612">
                                              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9082907552716450613">
                                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9082907552716450599" resolveInfo="dim" />
                                              </node>
                                              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="9082907552716450614">
                                                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="1t7x.~Dimension%dheight" resolveInfo="height" />
                                              </node>
                                            </node>
                                          </node>
                                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="9082907552716450615">
                                            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="dbrf.~SpringLayout" resolveInfo="SpringLayout" />
                                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="dbrf.~SpringLayout%dNORTH" resolveInfo="NORTH" />
                                          </node>
                                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9082907552716450616">
                                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9082907552716450579" resolveInfo="jp" />
                                          </node>
                                        </node>
                                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="9082907552716450617">
                                          <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="9082907552716450618">
                                            <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9082907552716450619">
                                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~SpringLayout" resolveInfo="SpringLayout" />
                                            </node>
                                            <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9082907552716450620">
                                              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9082907552716450621">
                                                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetLayout()%cjava%dawt%dLayoutManager" resolveInfo="getLayout" />
                                              </node>
                                              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9082907552716450622">
                                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9082907552716450579" resolveInfo="jp" />
                                              </node>
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9082907552716450623">
                                      <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9082907552716450624">
                                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9082907552716450625">
                                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~SpringLayout%dputConstraint(java%dlang%dString,java%dawt%dComponent,javax%dswing%dSpring,java%dlang%dString,java%dawt%dComponent)%cvoid" resolveInfo="putConstraint" />
                                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="9082907552716450626">
                                            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="dbrf.~SpringLayout" resolveInfo="SpringLayout" />
                                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="dbrf.~SpringLayout%dEAST" resolveInfo="EAST" />
                                          </node>
                                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9082907552716450627">
                                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9082907552716450579" resolveInfo="jp" />
                                          </node>
                                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="9082907552716450628">
                                            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="dbrf.~Spring" resolveInfo="Spring" />
                                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~Spring%dconstant(int)%cjavax%dswing%dSpring" resolveInfo="constant" />
                                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9082907552716450629">
                                              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9082907552716450630">
                                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9082907552716450599" resolveInfo="dim" />
                                              </node>
                                              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="9082907552716450631">
                                                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="1t7x.~Dimension%dwidth" resolveInfo="width" />
                                              </node>
                                            </node>
                                          </node>
                                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="9082907552716450632">
                                            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="dbrf.~SpringLayout" resolveInfo="SpringLayout" />
                                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="dbrf.~SpringLayout%dWEST" resolveInfo="WEST" />
                                          </node>
                                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9082907552716450633">
                                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9082907552716450579" resolveInfo="jp" />
                                          </node>
                                        </node>
                                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="9082907552716450634">
                                          <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="9082907552716450635">
                                            <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9082907552716450636">
                                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~SpringLayout" resolveInfo="SpringLayout" />
                                            </node>
                                            <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9082907552716450637">
                                              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9082907552716450638">
                                                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dgetLayout()%cjava%dawt%dLayoutManager" resolveInfo="getLayout" />
                                              </node>
                                              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9082907552716450639">
                                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9082907552716450579" resolveInfo="jp" />
                                              </node>
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9082907552716450640">
                                      <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9082907552716450641">
                                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9082907552716450642">
                                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9082907552716450579" resolveInfo="jp" />
                                        </node>
                                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9082907552716450643">
                                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dinvalidate()%cvoid" resolveInfo="invalidate" />
                                        </node>
                                      </node>
                                    </node>
                                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9082907552716450644">
                                      <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9082907552716450645">
                                        <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9082907552716450646">
                                          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9082907552716450647">
                                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9082907552716450579" resolveInfo="jp" />
                                          </node>
                                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9082907552716450648">
                                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Component%dgetParent()%cjava%dawt%dContainer" resolveInfo="getParent" />
                                          </node>
                                        </node>
                                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9082907552716450649">
                                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dvalidate()%cvoid" resolveInfo="validate" />
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                  <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="9082907552716450650">
                                    <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" resolveInfo="Override" />
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="9082907552716450651">
                    <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" resolveInfo="Override" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="context" roleId="sqp9.1642651187739182158" type="sqp9.Context" typeId="sqp9.1642651187739181626" id="873604604379639133">
        <link role="uiObject" roleId="sqp9.1642651187739181627" targetNodeId="2yj1.7421785601023770754" resolveInfo="Panel" />
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7617727720684733816">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JPanel" resolveInfo="JPanel" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="7617727720684733814" />
    <node role="geometry" roleId="sqp9.3329614760087020873" type="sqp9.Geometry" typeId="sqp9.4033850706585269114" id="7617727720684733815" />
  </root>
  <root id="873604604378858590">
    <node role="propertyAccessor" roleId="sqp9.4643695836678928899" type="sqp9.UIPropertyAccessCode" typeId="sqp9.4643695836678934010" id="873604604378858601">
      <link role="property" roleId="sqp9.4643695836678934012" targetNodeId="2yj1.6196826443637184763" resolveInfo="href" />
      <node role="getter" roleId="sqp9.4643695836679531005" type="sqp9.UIPropertyGetter" typeId="sqp9.4643695836679547748" id="873604604378858602">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="873604604378858603">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="873604604378858606">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="873604604378858608">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="873604604378858607" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="873604604378863842">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~AbstractButton%dgetText()%cjava%dlang%dString" resolveInfo="getText" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="setter" roleId="sqp9.4643695836679531004" type="sqp9.UIPropertySetter" typeId="sqp9.4643695836679547626" id="873604604378858604">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="873604604378858605">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="873604604378863843">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="873604604378863845">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="873604604378863844" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="873604604378863849">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~AbstractButton%dsetText(java%dlang%dString)%cvoid" resolveInfo="setText" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.PropertyValueParam" typeId="sqp9.4643695836679547628" id="873604604378863850" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="propertyAccessor" roleId="sqp9.4643695836678928899" type="sqp9.UIPropertyAccessCode" typeId="sqp9.4643695836678934010" id="873604604378863851">
      <link role="property" roleId="sqp9.4643695836678934012" targetNodeId="2yj1.7001216437968645434" resolveInfo="historyToken" />
      <node role="getter" roleId="sqp9.4643695836679531005" type="sqp9.UIPropertyGetter" typeId="sqp9.4643695836679547748" id="873604604378863852">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="873604604378863853">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="873604604378863856">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="873604604378863858">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="873604604378863857" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="873604604378868616">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~AbstractButton%dgetActionCommand()%cjava%dlang%dString" resolveInfo="getActionCommand" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="setter" roleId="sqp9.4643695836679531004" type="sqp9.UIPropertySetter" typeId="sqp9.4643695836679547626" id="873604604378863854">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="873604604378863855">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="873604604378868617">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="873604604378868619">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="873604604378868618" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="873604604378868623">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~AbstractButton%dsetActionCommand(java%dlang%dString)%cvoid" resolveInfo="setActionCommand" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.PropertyValueParam" typeId="sqp9.4643695836679547628" id="873604604378868624" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="873604604378858595">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="873604604378858596">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="873604604378858597">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="873604604378858598">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="873604604378858600">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="juh8.~JXHyperlink%d&lt;init&gt;()" resolveInfo="JXHyperlink" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="873604604378858594">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="juh8.~JXHyperlink" resolveInfo="JXHyperlink" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="873604604378858592" />
    <node role="geometry" roleId="sqp9.3329614760087020873" type="sqp9.Geometry" typeId="sqp9.4033850706585269114" id="873604604378858593" />
  </root>
  <root id="2490518255521933821">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="2490518255521955069">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2490518255521955070" />
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2490518255521955068">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="2490518255521933823" />
    <node role="geometry" roleId="sqp9.3329614760087020873" type="sqp9.Geometry" typeId="sqp9.4033850706585269114" id="2490518255521933824" />
  </root>
  <root id="2925275022462250780">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="2925275022462275419">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2925275022462275420">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2925275022462280954">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2925275022462280955">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2925275022462280957">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JPanel%d&lt;init&gt;(java%dawt%dLayoutManager)" resolveInfo="JPanel" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2925275022462280958">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2925275022462280960">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~FlowLayout%d&lt;init&gt;(int)" resolveInfo="FlowLayout" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="2925275022462280961">
                    <link role="classifier" roleId="tpee.1144433057691" targetNodeId="1t7x.~FlowLayout" resolveInfo="FlowLayout" />
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1t7x.~FlowLayout%dLEFT" resolveInfo="LEFT" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2925275022462275418">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JPanel" resolveInfo="JPanel" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="2925275022462250782" />
    <node role="geometry" roleId="sqp9.3329614760087020873" type="sqp9.Geometry" typeId="sqp9.4033850706585269114" id="2925275022462250783" />
  </root>
  <root id="6107522156819192478">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="6107522156819200523">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6107522156819200524">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6107522156819200525">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6107522156819200526">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6107522156819200528">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JPanel%d&lt;init&gt;(java%dawt%dLayoutManager)" resolveInfo="JPanel" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6107522156819200529">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6107522156819200531">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~GridBagLayout%d&lt;init&gt;()" resolveInfo="GridBagLayout" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6107522156819200522">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JPanel" resolveInfo="JPanel" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="6107522156819192480" />
    <node role="geometry" roleId="sqp9.3329614760087020873" type="sqp9.Geometry" typeId="sqp9.4033850706585269114" id="6107522156819192481" />
    <node role="containerTemplate" roleId="sqp9.4391079257750389359" type="sqp9.ContainerTemplate" typeId="sqp9.4391079257750389358" id="6107522156819200532">
      <link role="container" roleId="sqp9.4391079257750389360" targetNodeId="2yj1.8508807536211634699" resolveInfo="gridChildren" />
      <node role="itemType" roleId="sqp9.4391079257750550448" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6107522156819202852">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
      </node>
      <node role="itemAdder" roleId="sqp9.4391079257750634351" type="sqp9.ContainerItemAdder" typeId="sqp9.4391079257750550393" id="6107522156819200534">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6107522156819200535">
          <node role="statement" roleId="tpee.1068581517665" type="sqp9.ApplyConstraintStatement" typeId="sqp9.7617727720684733989" id="6107522156819210452">
            <node role="constraint" roleId="sqp9.7617727720684733991" type="sqp9.AspectParameterRef" typeId="sqp9.5572604531249464315" id="7930737280445893127">
              <link role="parameterDecl" roleId="sqp9.5572604531249464316" targetNodeId="7930737280445873552" resolveInfo="cell" />
            </node>
            <node role="constraint" roleId="sqp9.7617727720684733991" type="sqp9.AspectParameterRef" typeId="sqp9.5572604531249464315" id="6030013275786767238">
              <link role="parameterDecl" roleId="sqp9.5572604531249464316" targetNodeId="6030013275786725400" resolveInfo="align" />
            </node>
            <node role="widget" roleId="sqp9.7617727720684733992" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="6107522156819210457" />
            <node role="container" roleId="sqp9.7617727720684733993" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="6107522156819210458" />
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6107522156819202853">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6107522156819202855">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="6107522156819202854" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6107522156819210445">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dadd(java%dawt%dComponent)%cjava%dawt%dComponent" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ItemUIObjectParam" typeId="sqp9.4391079257750550368" id="6107522156819210446" />
              </node>
            </node>
          </node>
        </node>
        <node role="aspectParameter" roleId="sqp9.5572604531249464318" type="sqp9.AspectParameterDecl" typeId="sqp9.5572604531249464313" id="7930737280445873552">
          <link role="aspectDef" roleId="sqp9.5572604531249464314" targetNodeId="2yj1.8508807536211634700" resolveInfo="cell" />
        </node>
        <node role="aspectParameter" roleId="sqp9.5572604531249464318" type="sqp9.AspectParameterDecl" typeId="sqp9.5572604531249464313" id="6030013275786725400">
          <link role="aspectDef" roleId="sqp9.5572604531249464314" targetNodeId="2yj1.7930737280446910201" resolveInfo="align" />
        </node>
      </node>
      <node role="itemInserter" roleId="sqp9.2459884175400018414" type="sqp9.ContainerItemInserter" typeId="sqp9.2459884175399840230" id="6107522156819200536">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6107522156819200537" />
      </node>
      <node role="itemIterator" roleId="sqp9.7798684637310724192" type="sqp9.ContainerItemIterator" typeId="sqp9.7798684637310718056" id="6107522156819200538">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6107522156819200539" />
      </node>
      <node role="itemRemover" roleId="sqp9.2459884175398375626" type="sqp9.ContainerItemRemover" typeId="sqp9.2459884175398146657" id="6107522156819200540">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6107522156819200541" />
      </node>
      <node role="itemClearer" roleId="sqp9.413330188016988840" type="sqp9.ContainerItemClearer" typeId="sqp9.413330188016988766" id="6107522156819200542">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6107522156819200543" />
      </node>
    </node>
  </root>
  <root id="6261739386029717107">
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="6261739386029717112">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6261739386029717113">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="3351556818518202679">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3351556818518202680">
            <property name="name" nameId="tpck.1169194664001" value="dlg" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3351556818518202681">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JDialog" resolveInfo="JDialog" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3351556818518202682">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="3351556818518202683">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JDialog%d&lt;init&gt;(java%dawt%dFrame,boolean)" resolveInfo="JDialog" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.ContextUIObjectParam" typeId="sqp9.7655275107718250839" id="3351556818518202684" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="5589466753147168456">
                  <property name="value" nameId="tpee.1068580123138" value="true" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3351556818518202686">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3351556818518204726">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3351556818518202688">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3351556818518202687">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3351556818518202680" resolveInfo="dlg" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3351556818518204725">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JDialog%dgetContentPane()%cjava%dawt%dContainer" resolveInfo="getContentPane" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3351556818518204730">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Container%dsetLayout(java%dawt%dLayoutManager)%cvoid" resolveInfo="setLayout" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3351556818518204731">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="3351556818518256573">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~GridLayout%d&lt;init&gt;(int,int)" resolveInfo="GridLayout" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3351556818518256574">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3351556818518256576">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3351556818518256578">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3351556818518256579">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3351556818518202680" resolveInfo="dlg" />
          </node>
        </node>
      </node>
      <node role="context" roleId="sqp9.1642651187739182158" type="sqp9.Context" typeId="sqp9.1642651187739181626" id="6261739386029732126">
        <link role="uiObject" roleId="sqp9.1642651187739181627" targetNodeId="2yj1.3546006303814975218" resolveInfo="RootPanel" />
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6261739386029717111">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JDialog" resolveInfo="JDialog" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="6261739386029717109" />
    <node role="geometry" roleId="sqp9.3329614760087020873" type="sqp9.Geometry" typeId="sqp9.4033850706585269114" id="6261739386029717110" />
    <node role="actionHandler" roleId="sqp9.6261739386029733441" type="sqp9.UIActionCode" typeId="sqp9.6261739386029733370" id="6261739386029958930">
      <link role="action" roleId="sqp9.6261739386029733408" targetNodeId="2yj1.6261739386029958928" resolveInfo="show" />
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6261739386029958931">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3351556818518256581">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3351556818518256583">
            <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="3351556818518256582" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3351556818518256587">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Window%dpack()%cvoid" resolveInfo="pack" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6261739386029958932">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6261739386029958934">
            <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="6261739386029958933" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6261739386029967706">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Dialog%dsetVisible(boolean)%cvoid" resolveInfo="setVisible" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="6261739386029967707">
                <property name="value" nameId="tpee.1068580123138" value="true" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="actionHandler" roleId="sqp9.6261739386029733441" type="sqp9.UIActionCode" typeId="sqp9.6261739386029733370" id="6261739386030341080">
      <link role="action" roleId="sqp9.6261739386029733408" targetNodeId="2yj1.6261739386029958929" resolveInfo="hide" />
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6261739386030341081">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6261739386030341082">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6261739386030341084">
            <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="6261739386030341083" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6261739386030342173">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Dialog%dsetVisible(boolean)%cvoid" resolveInfo="setVisible" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="6261739386030342174">
                <property name="value" nameId="tpee.1068580123138" value="false" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="propertyAccessor" roleId="sqp9.4643695836678928899" type="sqp9.UIPropertyAccessCode" typeId="sqp9.4643695836678934010" id="1870423755832737537">
      <link role="property" roleId="sqp9.4643695836678934012" targetNodeId="2yj1.1870423755832688529" resolveInfo="contentPane" />
      <node role="getter" roleId="sqp9.4643695836679531005" type="sqp9.UIPropertyGetter" typeId="sqp9.4643695836679547748" id="1870423755832737538">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1870423755832737539">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1870423755832737542">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1870423755832753408">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="1870423755832753409" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1870423755832753410">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JDialog%dgetContentPane()%cjava%dawt%dContainer" resolveInfo="getContentPane" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="setter" roleId="sqp9.4643695836679531004" type="sqp9.UIPropertySetter" typeId="sqp9.4643695836679547626" id="1870423755832737540">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1870423755832737541" />
      </node>
    </node>
  </root>
  <root id="6261739386029732128">
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6261739386029732132">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JFrame" resolveInfo="JFrame" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="6261739386029732130" />
    <node role="geometry" roleId="sqp9.3329614760087020873" type="sqp9.Geometry" typeId="sqp9.4033850706585269114" id="6261739386029732131" />
  </root>
  <root id="7006844861053363422">
    <node role="propertyAccessor" roleId="sqp9.4643695836678928899" type="sqp9.UIPropertyAccessCode" typeId="sqp9.4643695836678934010" id="7006844861053400929">
      <link role="property" roleId="sqp9.4643695836678934012" targetNodeId="2yj1.2700392567716868345" resolveInfo="text" />
      <node role="getter" roleId="sqp9.4643695836679531005" type="sqp9.UIPropertyGetter" typeId="sqp9.4643695836679547748" id="7006844861053400930">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7006844861053400931">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7006844861053400934">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7006844861053400936">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7006844861053400935" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7006844861053407648">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="oj8w.~JTextComponent%dgetText()%cjava%dlang%dString" resolveInfo="getText" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="setter" roleId="sqp9.4643695836679531004" type="sqp9.UIPropertySetter" typeId="sqp9.4643695836679547626" id="7006844861053400932">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7006844861053400933">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7006844861053407649">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7006844861053407651">
              <node role="operand" roleId="tpee.1197027771414" type="sqp9.ThisUIObjectParam" typeId="sqp9.4643695836679547627" id="7006844861053407650" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7006844861053407655">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="oj8w.~JTextComponent%dsetText(java%dlang%dString)%cvoid" resolveInfo="setText" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="sqp9.PropertyValueParam" typeId="sqp9.4643695836679547628" id="7006844861053407656" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="factory" roleId="sqp9.1642651187739181597" type="sqp9.UIObjectFactory" typeId="sqp9.7655275107718250838" id="7006844861053400923">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7006844861053400924">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7006844861053400925">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7006844861053400926">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7006844861053400928">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="dbrf.~JTextField%d&lt;init&gt;()" resolveInfo="JTextField" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="runtimeType" roleId="sqp9.4643695836678898436" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7006844861053400922">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JTextField" resolveInfo="JTextField" />
    </node>
    <node role="auxillary" roleId="sqp9.1412244996131408396" type="sqp9.Auxillary" typeId="sqp9.1412244996131394684" id="7006844861053363424" />
    <node role="geometry" roleId="sqp9.3329614760087020873" type="sqp9.Geometry" typeId="sqp9.4033850706585269114" id="7006844861053363425" />
  </root>
</model>

