<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c8959054d(jetbrains.mps.uiLanguage.components)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="5d6bee4c-f891-4a93-a0c9-e2268726ae47(jetbrains.mps.uiLanguage)" />
  <import index="dbrf" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#javax.swing(JDK/javax.swing@java_stub)" version="-1" />
  <import index="1t7x" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.awt(JDK/java.awt@java_stub)" version="-1" />
  <import index="f0dr" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#javax.swing.border(JDK/javax.swing.border@java_stub)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="vpl2" modelUID="r:00067a2f-ff21-4151-9184-3308b3d1f130(jetbrains.mps.uiLanguage.runtime)" version="-1" />
  <import index="tphr" modelUID="r:00000000-0000-4000-0000-011c89590553(jetbrains.mps.uiLanguage.structure)" version="1" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tphr.ComponentDeclaration" typeId="tphr.1202387718766" id="1202393472906">
      <property name="name" nameId="tpck.1169194664001" value="BaseComponent" />
      <property name="stub" nameId="tphr.1202393242164" value="true" />
      <property name="abstract" nameId="tphr.1202393422919" value="true" />
    </node>
    <node type="tphr.ComponentDeclaration" typeId="tphr.1202387718766" id="1202393511419">
      <property name="name" nameId="tpck.1169194664001" value="Frame" />
      <property name="stub" nameId="tphr.1202393242164" value="true" />
      <link role="extendedComponent" roleId="tphr.1202393246965" targetNodeId="1202393472906" resolveInfo="BaseComponent" />
      <link role="mapTo" roleId="tphr.1202393168541" targetNodeId="dbrf.~JFrame" resolveInfo="JFrame" />
    </node>
    <node type="tphr.ComponentController" typeId="tphr.1202388384249" id="1202393521454">
      <link role="component" roleId="tphr.1202388401455" targetNodeId="1202393511419" resolveInfo="Frame" />
    </node>
    <node type="tphr.ComponentDeclaration" typeId="tphr.1202387718766" id="1202393560969">
      <property name="name" nameId="tpck.1169194664001" value="Button" />
      <property name="stub" nameId="tphr.1202393242164" value="true" />
      <property name="actionComponent" nameId="tphr.1202744343014" value="true" />
      <link role="extendedComponent" roleId="tphr.1202393246965" targetNodeId="1202393472906" resolveInfo="BaseComponent" />
      <link role="mapTo" roleId="tphr.1202393168541" targetNodeId="dbrf.~JButton" resolveInfo="JButton" />
    </node>
    <node type="tphr.ComponentController" typeId="tphr.1202388384249" id="1202393573380">
      <link role="component" roleId="tphr.1202388401455" targetNodeId="1202393560969" resolveInfo="Button" />
    </node>
    <node type="tphr.ComponentController" typeId="tphr.1202388384249" id="1202393598579">
      <link role="component" roleId="tphr.1202388401455" targetNodeId="1202393472906" resolveInfo="BaseComponent" />
    </node>
    <node type="tphr.ComponentDeclaration" typeId="tphr.1202387718766" id="1202464198724">
      <property name="name" nameId="tpck.1169194664001" value="TextField" />
      <property name="stub" nameId="tphr.1202393242164" value="true" />
      <link role="mapTo" roleId="tphr.1202393168541" targetNodeId="dbrf.~JTextField" resolveInfo="JTextField" />
    </node>
    <node type="tphr.ComponentController" typeId="tphr.1202388384249" id="1202464205555">
      <link role="component" roleId="tphr.1202388401455" targetNodeId="1202464198724" resolveInfo="TextField" />
    </node>
    <node type="tphr.ComponentDeclaration" typeId="tphr.1202387718766" id="1202465811094">
      <property name="name" nameId="tpck.1169194664001" value="Label" />
      <property name="stub" nameId="tphr.1202393242164" value="true" />
      <link role="mapTo" roleId="tphr.1202393168541" targetNodeId="dbrf.~JLabel" resolveInfo="JLabel" />
    </node>
    <node type="tphr.ComponentController" typeId="tphr.1202388384249" id="1202465821678">
      <link role="component" roleId="tphr.1202388401455" targetNodeId="1202465811094" resolveInfo="Label" />
    </node>
    <node type="tphr.ComponentDeclaration" typeId="tphr.1202387718766" id="1202738287160">
      <property name="name" nameId="tpck.1169194664001" value="VBox" />
      <property name="stub" nameId="tphr.1202393242164" value="true" />
      <link role="extendedComponent" roleId="tphr.1202393246965" targetNodeId="1202816402995" resolveInfo="Panel" />
      <link role="mapTo" roleId="tphr.1202393168541" targetNodeId="vpl2.5606982432899038977" resolveInfo="VBoxPanel" />
    </node>
    <node type="tphr.ComponentDeclaration" typeId="tphr.1202387718766" id="1202738350852">
      <property name="name" nameId="tpck.1169194664001" value="HBox" />
      <property name="stub" nameId="tphr.1202393242164" value="true" />
      <link role="extendedComponent" roleId="tphr.1202393246965" targetNodeId="1202816402995" resolveInfo="Panel" />
      <link role="mapTo" roleId="tphr.1202393168541" targetNodeId="vpl2.5606982432899038941" resolveInfo="HBoxPanel" />
    </node>
    <node type="tphr.ComponentDeclaration" typeId="tphr.1202387718766" id="1202815836444">
      <property name="name" nameId="tpck.1169194664001" value="CheckBox" />
      <property name="stub" nameId="tphr.1202393242164" value="true" />
      <property name="actionComponent" nameId="tphr.1202744343014" value="true" />
      <link role="mapTo" roleId="tphr.1202393168541" targetNodeId="dbrf.~JCheckBox" resolveInfo="JCheckBox" />
      <link role="extendedComponent" roleId="tphr.1202393246965" targetNodeId="1202393560969" resolveInfo="Button" />
    </node>
    <node type="tphr.ComponentController" typeId="tphr.1202388384249" id="1202815871669">
      <link role="component" roleId="tphr.1202388401455" targetNodeId="1202815836444" resolveInfo="CheckBox" />
    </node>
    <node type="tphr.ComponentDeclaration" typeId="tphr.1202387718766" id="1202816402995">
      <property name="name" nameId="tpck.1169194664001" value="Panel" />
      <property name="stub" nameId="tphr.1202393242164" value="true" />
      <link role="extendedComponent" roleId="tphr.1202393246965" targetNodeId="1202393472906" resolveInfo="BaseComponent" />
      <link role="mapTo" roleId="tphr.1202393168541" targetNodeId="dbrf.~JPanel" resolveInfo="JPanel" />
    </node>
    <node type="tphr.ComponentDeclaration" typeId="tphr.1202387718766" id="1202816455619">
      <property name="name" nameId="tpck.1169194664001" value="FlowPanel" />
      <property name="stub" nameId="tphr.1202393242164" value="true" />
      <link role="extendedComponent" roleId="tphr.1202393246965" targetNodeId="1202816402995" resolveInfo="Panel" />
      <link role="mapTo" roleId="tphr.1202393168541" targetNodeId="vpl2.5606982432899038963" resolveInfo="FlowPanel" />
    </node>
    <node type="tphr.ComponentDeclaration" typeId="tphr.1202387718766" id="1202828480666">
      <property name="name" nameId="tpck.1169194664001" value="Dialog" />
      <property name="stub" nameId="tphr.1202393242164" value="true" />
      <link role="extendedComponent" roleId="tphr.1202393246965" targetNodeId="1202393472906" resolveInfo="BaseComponent" />
      <link role="mapTo" roleId="tphr.1202393168541" targetNodeId="dbrf.~JDialog" resolveInfo="JDialog" />
    </node>
    <node type="tphr.ComponentController" typeId="tphr.1202388384249" id="1202828573950">
      <link role="component" roleId="tphr.1202388401455" targetNodeId="1202828480666" resolveInfo="_Dialog" />
    </node>
    <node type="tphr.ComponentDeclaration" typeId="tphr.1202387718766" id="1203082515478">
      <property name="name" nameId="tpck.1169194664001" value="List" />
      <property name="stub" nameId="tphr.1202393242164" value="true" />
      <link role="mapTo" roleId="tphr.1202393168541" targetNodeId="dbrf.~JList" resolveInfo="JList" />
      <link role="extendedComponent" roleId="tphr.1202393246965" targetNodeId="1202393472906" resolveInfo="BaseComponent" />
    </node>
    <node type="tphr.ComponentController" typeId="tphr.1202388384249" id="1203082521713">
      <link role="component" roleId="tphr.1202388401455" targetNodeId="1203082515478" resolveInfo="List" />
    </node>
    <node type="tphr.ComponentDeclaration" typeId="tphr.1202387718766" id="1204287075288">
      <property name="name" nameId="tpck.1169194664001" value="RadioButton" />
      <property name="stub" nameId="tphr.1202393242164" value="true" />
      <property name="actionComponent" nameId="tphr.1202744343014" value="true" />
      <link role="extendedComponent" roleId="tphr.1202393246965" targetNodeId="1202393560969" resolveInfo="Button" />
      <link role="mapTo" roleId="tphr.1202393168541" targetNodeId="vpl2.3987693689859617965" resolveInfo="JbRadioButton" />
    </node>
    <node type="tphr.ComponentController" typeId="tphr.1202388384249" id="1204287125444">
      <link role="component" roleId="tphr.1202388401455" targetNodeId="1204287075288" resolveInfo="RadioButton" />
    </node>
    <node type="tphr.ComponentController" typeId="tphr.1202388384249" id="2081431238554771058">
      <link role="component" roleId="tphr.1202388401455" targetNodeId="1202816402995" resolveInfo="Panel" />
    </node>
    <node type="tphr.ComponentDeclaration" typeId="tphr.1202387718766" id="8606751926055253470">
      <property name="name" nameId="tpck.1169194664001" value="Separator" />
      <property name="stub" nameId="tphr.1202393242164" value="true" />
      <link role="extendedComponent" roleId="tphr.1202393246965" targetNodeId="1202393472906" resolveInfo="BaseComponent" />
      <link role="mapTo" roleId="tphr.1202393168541" targetNodeId="dbrf.~JSeparator" resolveInfo="JSeparator" />
    </node>
    <node type="tphr.ComponentController" typeId="tphr.1202388384249" id="8606751926055253530">
      <link role="component" roleId="tphr.1202388401455" targetNodeId="8606751926055253470" resolveInfo="Separator" />
    </node>
  </roots>
  <root id="1202393472906" />
  <root id="1202393511419" />
  <root id="1202393521454">
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1202393523190">
      <property name="name" nameId="tpck.1169194664001" value="title" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.StringType" typeId="tpee.1225271177708" id="1225193084847" />
    </node>
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1202396132470">
      <property name="name" nameId="tpck.1169194664001" value="visible" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1202396133066" />
    </node>
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1202396307047">
      <property name="name" nameId="tpck.1169194664001" value="size" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1202396308237">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1t7x.~Dimension" resolveInfo="Dimension" />
      </node>
    </node>
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1202746217446">
      <property name="name" nameId="tpck.1169194664001" value="defaultCloseOperation" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1202746219048" />
    </node>
  </root>
  <root id="1202393560969" />
  <root id="1202393573380">
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1202393575288">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.StringType" typeId="tpee.1225271177708" id="1225193084263" />
    </node>
  </root>
  <root id="1202393598579">
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1202393600503">
      <property name="name" nameId="tpck.1169194664001" value="layout" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1202393611649">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1t7x.~LayoutManager" resolveInfo="LayoutManager" />
      </node>
    </node>
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1204902000237">
      <property name="name" nameId="tpck.1169194664001" value="border" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1204902015019">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="f0dr.~Border" resolveInfo="Border" />
      </node>
    </node>
  </root>
  <root id="1202464198724" />
  <root id="1202464205555">
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1202464208353">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.StringType" typeId="tpee.1225271177708" id="1225193084452" />
    </node>
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1202818338918">
      <property name="name" nameId="tpck.1169194664001" value="columns" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1202818339909" />
    </node>
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1210763024114">
      <property name="name" nameId="tpck.1169194664001" value="foreground" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210763026378">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1t7x.~Color" resolveInfo="Color" />
      </node>
    </node>
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1969840607716864734">
      <property name="name" nameId="tpck.1169194664001" value="editable" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1969840607716864736" />
    </node>
  </root>
  <root id="1202465811094" />
  <root id="1202465821678">
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1202465836231">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.StringType" typeId="tpee.1225271177708" id="1225193084168" />
    </node>
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1210763059950">
      <property name="name" nameId="tpck.1169194664001" value="foreground" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210763066573">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1t7x.~Color" resolveInfo="Color" />
      </node>
    </node>
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1210763073323">
      <property name="name" nameId="tpck.1169194664001" value="background" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210763074853">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1t7x.~Color" resolveInfo="Color" />
      </node>
    </node>
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="8226459646154029727">
      <property name="name" nameId="tpck.1169194664001" value="icon" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8226459646154029788">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~Icon" resolveInfo="Icon" />
      </node>
    </node>
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="8226459646154220786">
      <property name="name" nameId="tpck.1169194664001" value="font" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8226459646154220847">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1t7x.~Font" resolveInfo="Font" />
      </node>
    </node>
  </root>
  <root id="1202738287160" />
  <root id="1202738350852" />
  <root id="1202815836444" />
  <root id="1202815871669">
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1202815889044">
      <property name="name" nameId="tpck.1169194664001" value="selected" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1202815890015" />
    </node>
  </root>
  <root id="1202816402995" />
  <root id="1202816455619" />
  <root id="1202828480666" />
  <root id="1202828573950">
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1202828575561">
      <property name="name" nameId="tpck.1169194664001" value="title" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.StringType" typeId="tpee.1225271177708" id="1225193084942" />
    </node>
  </root>
  <root id="1203082515478">
    <node role="rendererInfo" roleId="tphr.1210174600177" type="tphr.StubCellRendererInfo" typeId="tphr.1210173918195" id="1210175735011">
      <link role="cellRendererSetter" roleId="tphr.1210173949336" targetNodeId="dbrf.~JList%dsetCellRenderer(javax%dswing%dListCellRenderer)%cvoid" resolveInfo="setCellRenderer" />
    </node>
  </root>
  <root id="1203082521713">
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1204900502868">
      <property name="name" nameId="tpck.1169194664001" value="selectedElement" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1204900504271">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
      </node>
    </node>
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1204901817349">
      <property name="name" nameId="tpck.1169194664001" value="selectedElements" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1204901818800">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1t7x.~List" resolveInfo="List" />
      </node>
    </node>
  </root>
  <root id="1204287075288" />
  <root id="1204287125444">
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1204287204803">
      <property name="name" nameId="tpck.1169194664001" value="selected" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1204287205852" />
    </node>
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="1204287669159">
      <property name="name" nameId="tpck.1169194664001" value="group" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1204287681555">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~ButtonGroup" resolveInfo="ButtonGroup" />
      </node>
    </node>
  </root>
  <root id="2081431238554771058">
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="2081431238554771059">
      <property name="name" nameId="tpck.1169194664001" value="visible" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.BooleanType" typeId="tpee.1070534644030" id="2081431238554771061" />
    </node>
  </root>
  <root id="8606751926055253470" />
  <root id="8606751926055253530">
    <node role="attribute" roleId="tphr.1202389186753" type="tphr.AttributeDeclaration" typeId="tphr.1202388805843" id="8606751926055253531">
      <property name="name" nameId="tpck.1169194664001" value="orientation" />
      <node role="type" roleId="tphr.1202389048182" type="tpee.IntegerType" typeId="tpee.1070534370425" id="8606751926055253533" />
    </node>
  </root>
</model>

