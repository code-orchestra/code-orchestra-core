<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:c1b84d62-80cc-499b-b655-943c00c7ba88(jetbrains.mps.ui.widgets)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="8a448bd0-1380-4c01-9820-0f051d33888c(jetbrains.mps.ui.modeling)" />
  <language namespace="a247e09e-2435-45ba-b8d2-07e93feba96a(jetbrains.mps.baseLanguage.tuples)" />
  <language namespace="fb26dccf-fa54-4e9a-8ddb-b66311a34393(jetbrains.mps.ui)" />
  <import index="3ly5" modelUID="r:840b989b-d75d-4268-abaa-4676d1720c58(jetbrains.mps.ui.events)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="sqp9" modelUID="r:ba1d89ed-800e-4d0a-ad09-221b1011fbd1(jetbrains.mps.ui.modeling.structure)" version="2" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="fb0y" modelUID="r:4bcef4e7-5bde-4076-8e02-73a0681ac6a3(jetbrains.mps.ui.structure)" version="0" implicit="yes" />
  <roots>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="7421785601023770739">
      <property name="name" nameId="tpck.1169194664001" value="ButtonBase" />
      <property name="abstract" nameId="sqp9.9106854556041516986" value="true" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770745" resolveInfo="Widget" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="7421785601023770742">
      <property name="name" nameId="tpck.1169194664001" value="CheckBox" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770739" resolveInfo="ButtonBase" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="7421785601023770745">
      <property name="name" nameId="tpck.1169194664001" value="Widget" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="belongsTo" roleId="sqp9.1719339442170193729" targetNodeId="7421785601023770754" resolveInfo="Panel" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="7421785601023770748">
      <property name="name" nameId="tpck.1169194664001" value="RadioButton" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770739" resolveInfo="ButtonBase" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="7421785601023770752">
      <property name="name" nameId="tpck.1169194664001" value="Button" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770739" resolveInfo="ButtonBase" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="7421785601023770754">
      <property name="name" nameId="tpck.1169194664001" value="Panel" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770745" resolveInfo="Widget" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="4007322171505962920">
      <property name="name" nameId="tpck.1169194664001" value="VerticalPanel" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770754" resolveInfo="Panel" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="352695393470301153">
      <property name="name" nameId="tpck.1169194664001" value="HorizontalPanel" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770754" resolveInfo="Panel" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="262873202871571543">
      <property name="name" nameId="tpck.1169194664001" value="DockPanel" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770754" resolveInfo="Panel" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="262873202871588254">
      <property name="name" nameId="tpck.1169194664001" value="Label" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770745" resolveInfo="Widget" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="6424935405034500197">
      <property name="name" nameId="tpck.1169194664001" value="TabbedPanel" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770754" resolveInfo="Panel" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="6399754879758206671">
      <property name="name" nameId="tpck.1169194664001" value="TreeNode" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7936848552255359513" resolveInfo="AbstractTreeNode" />
      <link role="belongsTo" roleId="sqp9.1719339442170193729" targetNodeId="7936848552255359513" resolveInfo="AbstractTreeNode" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="6399754879758206688">
      <property name="name" nameId="tpck.1169194664001" value="Tree" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770745" resolveInfo="Widget" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="3616339824038852574">
      <property name="name" nameId="tpck.1169194664001" value="Table" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770745" resolveInfo="Widget" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="3616339824038886161">
      <property name="name" nameId="tpck.1169194664001" value="TableColumn" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="belongsTo" roleId="sqp9.1719339442170193729" targetNodeId="3616339824038852574" resolveInfo="Table" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="3616339824038886165">
      <property name="name" nameId="tpck.1169194664001" value="TableRow" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="belongsTo" roleId="sqp9.1719339442170193729" targetNodeId="3616339824038852574" resolveInfo="Table" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="7936848552255359513">
      <property name="name" nameId="tpck.1169194664001" value="AbstractTreeNode" />
      <property name="abstract" nameId="sqp9.9106854556041516986" value="true" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="7936848552255362162">
      <property name="name" nameId="tpck.1169194664001" value="RootTreeNode" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7936848552255359513" resolveInfo="AbstractTreeNode" />
      <link role="belongsTo" roleId="sqp9.1719339442170193729" targetNodeId="6399754879758206688" resolveInfo="Tree" />
    </node>
    <node type="tpee.EnumClass" typeId="tpee.1083245097125" id="513490887686270244">
      <property name="name" nameId="tpck.1169194664001" value="VerticalAlignment" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
    </node>
    <node type="tpee.EnumClass" typeId="tpee.1083245097125" id="513490887686270269">
      <property name="name" nameId="tpck.1169194664001" value="HorizontalAlignment" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="513490887686296700">
      <property name="name" nameId="tpck.1169194664001" value="StackPanel" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770754" resolveInfo="Panel" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="513490887686296702">
      <property name="name" nameId="tpck.1169194664001" value="StackItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="belongsTo" roleId="sqp9.1719339442170193729" targetNodeId="513490887686296700" resolveInfo="StackPanel" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770754" resolveInfo="Panel" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="7001216437968619238">
      <property name="name" nameId="tpck.1169194664001" value="Hyperlink" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770739" resolveInfo="ButtonBase" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="4917245576577583971">
      <property name="name" nameId="tpck.1169194664001" value="FlowPanel" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770754" resolveInfo="Panel" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="2663453265346089636">
      <property name="name" nameId="tpck.1169194664001" value="LayoutPanel" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770754" resolveInfo="Panel" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="7617727720684691215">
      <property name="name" nameId="tpck.1169194664001" value="FillPanel" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770754" resolveInfo="Panel" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="2490518255521933820">
      <property name="name" nameId="tpck.1169194664001" value="CustomComponent" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="8508807536211634698">
      <property name="name" nameId="tpck.1169194664001" value="GridPanel" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770754" resolveInfo="Panel" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="3546006303814975218">
      <property name="name" nameId="tpck.1169194664001" value="RootPanel" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770754" resolveInfo="Panel" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="6261739386029717105">
      <property name="name" nameId="tpck.1169194664001" value="Dialog" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="2700392567716868344">
      <property name="name" nameId="tpck.1169194664001" value="TextField" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="widgets" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="7421785601023770745" resolveInfo="Widget" />
    </node>
  </roots>
  <root id="7421785601023770739">
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.UIProperty" typeId="sqp9.8381258131358158045" id="7421785601023770740">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.StringType" typeId="tpee.1225271177708" id="7421785601023770741" />
    </node>
  </root>
  <root id="7421785601023770742">
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.EditableUIProperty" typeId="sqp9.9014158157447011054" id="7421785601023770743">
      <property name="name" nameId="tpck.1169194664001" value="checked" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.BooleanType" typeId="tpee.1070534644030" id="7421785601023770744" />
    </node>
  </root>
  <root id="7421785601023770745" />
  <root id="7421785601023770748">
    <node role="produceEvent" roleId="sqp9.8381258131358709485" type="sqp9.EventProducer" typeId="sqp9.8381258131358709474" id="7421785601023770749">
      <link role="event" roleId="sqp9.8381258131358709475" targetNodeId="3ly5.7421785601023888124" resolveInfo="SelectEvent" />
    </node>
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.EditableUIProperty" typeId="sqp9.9014158157447011054" id="7421785601023770750">
      <property name="name" nameId="tpck.1169194664001" value="selected" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.BooleanType" typeId="tpee.1070534644030" id="7421785601023770751" />
    </node>
  </root>
  <root id="7421785601023770752">
    <node role="produceEvent" roleId="sqp9.8381258131358709485" type="sqp9.EventProducer" typeId="sqp9.8381258131358709474" id="7001216437968644953">
      <link role="event" roleId="sqp9.8381258131358709475" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
    </node>
  </root>
  <root id="7421785601023770754">
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="7421785601023770755">
      <property name="name" nameId="tpck.1169194664001" value="children" />
      <link role="allows" roleId="sqp9.2459884175395462415" targetNodeId="7421785601023770745" resolveInfo="Widget" />
    </node>
  </root>
  <root id="4007322171505962920">
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.UIProperty" typeId="sqp9.8381258131358158045" id="513490887686267285">
      <property name="name" nameId="tpck.1169194664001" value="verticalAlignment" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="513490887686270292">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="513490887686270244" resolveInfo="VerticalAlignment" />
      </node>
    </node>
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.UIProperty" typeId="sqp9.8381258131358158045" id="513490887686270293">
      <property name="name" nameId="tpck.1169194664001" value="horizontalAlignment" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="513490887686270296">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="513490887686270269" resolveInfo="HorizontalAlignment" />
      </node>
    </node>
  </root>
  <root id="352695393470301153">
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.UIProperty" typeId="sqp9.8381258131358158045" id="513490887686270297">
      <property name="name" nameId="tpck.1169194664001" value="verticalAlignment" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="513490887686270298">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="513490887686270244" resolveInfo="VerticalAlignment" />
      </node>
    </node>
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.UIProperty" typeId="sqp9.8381258131358158045" id="513490887686270299">
      <property name="name" nameId="tpck.1169194664001" value="horizontalAlignment" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="513490887686270300">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="513490887686270269" resolveInfo="HorizontalAlignment" />
      </node>
    </node>
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="6196826443637826585">
      <property name="name" nameId="tpck.1169194664001" value="line" />
      <link role="specializes" roleId="sqp9.6424935405035112768" targetNodeId="7421785601023770755" resolveInfo="children" />
    </node>
  </root>
  <root id="262873202871571543">
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="262873202871571544">
      <property name="name" nameId="tpck.1169194664001" value="north" />
      <node role="requiredAspect" roleId="sqp9.6424935405034408112" type="sqp9.ChildAspectDefinition" typeId="sqp9.6424935405034408143" id="2204726755035669284">
        <property name="name" nameId="tpck.1169194664001" value="size" />
        <property name="optional" nameId="sqp9.6030013275786405028" value="false" />
        <node role="aspectType" roleId="sqp9.6424935405034408144" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2204726755035669287" />
      </node>
    </node>
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="262873202871571545">
      <property name="name" nameId="tpck.1169194664001" value="south" />
      <node role="requiredAspect" roleId="sqp9.6424935405034408112" type="sqp9.ChildAspectDefinition" typeId="sqp9.6424935405034408143" id="2204726755035669288">
        <property name="name" nameId="tpck.1169194664001" value="size" />
        <node role="aspectType" roleId="sqp9.6424935405034408144" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2204726755035669289" />
      </node>
    </node>
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="262873202871571546">
      <property name="name" nameId="tpck.1169194664001" value="east" />
      <node role="requiredAspect" roleId="sqp9.6424935405034408112" type="sqp9.ChildAspectDefinition" typeId="sqp9.6424935405034408143" id="2204726755035669291">
        <property name="name" nameId="tpck.1169194664001" value="size" />
        <node role="aspectType" roleId="sqp9.6424935405034408144" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2204726755035669292" />
      </node>
    </node>
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="262873202871571548">
      <property name="name" nameId="tpck.1169194664001" value="west" />
      <node role="requiredAspect" roleId="sqp9.6424935405034408112" type="sqp9.ChildAspectDefinition" typeId="sqp9.6424935405034408143" id="2204726755035669294">
        <property name="name" nameId="tpck.1169194664001" value="size" />
        <node role="aspectType" roleId="sqp9.6424935405034408144" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2204726755035669295" />
      </node>
    </node>
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="380233880019413653">
      <property name="name" nameId="tpck.1169194664001" value="center" />
      <link role="specializes" roleId="sqp9.6424935405035112768" targetNodeId="7421785601023770755" resolveInfo="children" />
    </node>
  </root>
  <root id="262873202871588254">
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.UIProperty" typeId="sqp9.8381258131358158045" id="262873202871593902">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.StringType" typeId="tpee.1225271177708" id="262873202871593904" />
    </node>
  </root>
  <root id="6424935405034500197">
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="6424935405034500198">
      <property name="name" nameId="tpck.1169194664001" value="tabs" />
      <link role="specializes" roleId="sqp9.6424935405035112768" targetNodeId="7421785601023770755" resolveInfo="children" />
      <node role="requiredAspect" roleId="sqp9.6424935405034408112" type="sqp9.ChildAspectDefinition" typeId="sqp9.6424935405034408143" id="6424935405034832713">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <node role="aspectType" roleId="sqp9.6424935405034408144" type="tpee.StringType" typeId="tpee.1225271177708" id="6424935405034832715" />
      </node>
    </node>
  </root>
  <root id="6399754879758206671" />
  <root id="6399754879758206688">
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="6399754879758206689">
      <property name="name" nameId="tpck.1169194664001" value="root" />
    </node>
  </root>
  <root id="3616339824038852574">
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="3616339824038886159">
      <property name="name" nameId="tpck.1169194664001" value="columns" />
    </node>
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="3616339824038886160">
      <property name="name" nameId="tpck.1169194664001" value="rows" />
    </node>
  </root>
  <root id="3616339824038886161">
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.UIProperty" typeId="sqp9.8381258131358158045" id="3616339824038886162">
      <property name="name" nameId="tpck.1169194664001" value="name" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.StringType" typeId="tpee.1225271177708" id="3616339824038886164" />
    </node>
  </root>
  <root id="3616339824038886165">
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.UIProperty" typeId="sqp9.8381258131358158045" id="3616339824038886166">
      <property name="name" nameId="tpck.1169194664001" value="data" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.ArrayType" typeId="tpee.1070534760951" id="7383889057843490641">
        <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7383889057843490640">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
        </node>
      </node>
    </node>
  </root>
  <root id="7936848552255359513">
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="7936848552255362159">
      <property name="name" nameId="tpck.1169194664001" value="children" />
    </node>
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.UIProperty" typeId="sqp9.8381258131358158045" id="7936848552255362160">
      <property name="name" nameId="tpck.1169194664001" value="userObject" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7936848552255362161">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
      </node>
    </node>
  </root>
  <root id="7936848552255362162" />
  <root id="513490887686270244">
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="513490887686270250">
      <property name="name" nameId="tpck.1169194664001" value="TOP" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="513490887686270246" resolveInfo="VerticalAlignment" />
      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="513490887686270251">
        <property name="value" nameId="tpee.1070475926801" value="top" />
      </node>
    </node>
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="513490887686270264">
      <property name="name" nameId="tpck.1169194664001" value="MIDDLE" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="513490887686270246" resolveInfo="VerticalAlignment" />
      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="513490887686270265">
        <property name="value" nameId="tpee.1070475926801" value="middle" />
      </node>
    </node>
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="513490887686270267">
      <property name="name" nameId="tpck.1169194664001" value="BOTTOM" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="513490887686270246" resolveInfo="VerticalAlignment" />
      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="513490887686270268">
        <property name="value" nameId="tpee.1070475926801" value="bottom" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="513490887686270245" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="513490887686270246">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="513490887686270247" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="513490887686270248" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="513490887686270249">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="513490887686270257">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="513490887686270258">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="513490887686270259">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="513490887686270260" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="513490887686270261">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="513490887686270254" resolveInfo="name" />
              </node>
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="513490887686270262">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="513490887686270252" resolveInfo="name" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="513490887686270252">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="513490887686270253" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="513490887686270254">
      <property name="name" nameId="tpck.1169194664001" value="name" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="513490887686270255" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="513490887686270256" />
    </node>
  </root>
  <root id="513490887686270269">
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="513490887686270286">
      <property name="name" nameId="tpck.1169194664001" value="LEFT" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="513490887686270271" resolveInfo="HorizontalAlignment" />
      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="513490887686270287">
        <property name="value" nameId="tpee.1070475926801" value="left" />
      </node>
    </node>
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="513490887686270288">
      <property name="name" nameId="tpck.1169194664001" value="CENTER" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="513490887686270271" resolveInfo="HorizontalAlignment" />
      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="513490887686270289">
        <property name="value" nameId="tpee.1070475926801" value="center" />
      </node>
    </node>
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="513490887686270290">
      <property name="name" nameId="tpck.1169194664001" value="RIGHT" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="513490887686270271" resolveInfo="HorizontalAlignment" />
      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="513490887686270291">
        <property name="value" nameId="tpee.1070475926801" value="right" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="513490887686270270" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="513490887686270271">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="513490887686270272" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="513490887686270273" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="513490887686270274">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="513490887686270280">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="513490887686270281">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="513490887686270282">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="513490887686270283" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="513490887686270284">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="513490887686270277" resolveInfo="name" />
              </node>
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="513490887686270285">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="513490887686270275" resolveInfo="name" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="513490887686270275">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="513490887686270276" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="513490887686270277">
      <property name="name" nameId="tpck.1169194664001" value="name" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="513490887686270278" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="513490887686270279" />
    </node>
  </root>
  <root id="513490887686296700">
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="513490887686296701">
      <property name="name" nameId="tpck.1169194664001" value="stack" />
      <link role="allows" roleId="sqp9.2459884175395462415" targetNodeId="513490887686296702" resolveInfo="StackItem" />
      <link role="specializes" roleId="sqp9.6424935405035112768" targetNodeId="7421785601023770755" resolveInfo="children" />
    </node>
  </root>
  <root id="513490887686296702">
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.UIProperty" typeId="sqp9.8381258131358158045" id="513490887686296703">
      <property name="name" nameId="tpck.1169194664001" value="title" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.StringType" typeId="tpee.1225271177708" id="513490887686296705" />
    </node>
  </root>
  <root id="7001216437968619238">
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.UIProperty" typeId="sqp9.8381258131358158045" id="6196826443637184763">
      <property name="name" nameId="tpck.1169194664001" value="href" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.StringType" typeId="tpee.1225271177708" id="6196826443637184765" />
    </node>
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.UIProperty" typeId="sqp9.8381258131358158045" id="7001216437968645434">
      <property name="name" nameId="tpck.1169194664001" value="historyToken" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.StringType" typeId="tpee.1225271177708" id="7001216437968645436" />
    </node>
    <node role="produceEvent" roleId="sqp9.8381258131358709485" type="sqp9.EventProducer" typeId="sqp9.8381258131358709474" id="7001216437968619241">
      <link role="event" roleId="sqp9.8381258131358709475" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
    </node>
  </root>
  <root id="4917245576577583971" />
  <root id="2663453265346089636">
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="2663453265346089637">
      <property name="name" nameId="tpck.1169194664001" value="layoutChildren" />
      <link role="specializes" roleId="sqp9.6424935405035112768" targetNodeId="7421785601023770755" resolveInfo="children" />
      <node role="requiredAspect" roleId="sqp9.6424935405034408112" type="sqp9.ChildAspectDefinition" typeId="sqp9.6424935405034408143" id="2663453265346089638">
        <property name="name" nameId="tpck.1169194664001" value="cons" />
        <node role="aspectType" roleId="sqp9.6424935405034408144" type="sqp9.LayoutConstraintType" typeId="sqp9.2663453265345756661" id="2663453265346256984">
          <link role="constraintConcept" roleId="sqp9.2663453265345756703" targetNodeId="sqp9.2663453265346256985" resolveInfo="BoxLayoutConstraint" />
        </node>
      </node>
    </node>
  </root>
  <root id="7617727720684691215">
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="4850120319523368884">
      <property name="name" nameId="tpck.1169194664001" value="child" />
      <link role="specializes" roleId="sqp9.6424935405035112768" targetNodeId="7421785601023770755" resolveInfo="children" />
    </node>
  </root>
  <root id="2490518255521933820" />
  <root id="8508807536211634698">
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="8508807536211634699">
      <property name="name" nameId="tpck.1169194664001" value="gridChildren" />
      <link role="specializes" roleId="sqp9.6424935405035112768" targetNodeId="7421785601023770755" resolveInfo="children" />
      <node role="requiredAspect" roleId="sqp9.6424935405034408112" type="sqp9.ChildAspectDefinition" typeId="sqp9.6424935405034408143" id="8508807536211634700">
        <property name="name" nameId="tpck.1169194664001" value="cell" />
        <node role="aspectType" roleId="sqp9.6424935405034408144" type="sqp9.LayoutConstraintType" typeId="sqp9.2663453265345756661" id="8508807536211637658">
          <link role="constraintConcept" roleId="sqp9.2663453265345756703" targetNodeId="sqp9.8508807536211371475" resolveInfo="CellLayoutConstraint" />
        </node>
      </node>
      <node role="requiredAspect" roleId="sqp9.6424935405034408112" type="sqp9.ChildAspectDefinition" typeId="sqp9.6424935405034408143" id="7930737280446910201">
        <property name="name" nameId="tpck.1169194664001" value="align" />
        <property name="optional" nameId="sqp9.6030013275786405028" value="true" />
        <node role="aspectType" roleId="sqp9.6424935405034408144" type="sqp9.LayoutConstraintType" typeId="sqp9.2663453265345756661" id="7930737280446910204">
          <link role="constraintConcept" roleId="sqp9.2663453265345756703" targetNodeId="sqp9.3619322115897256358" resolveInfo="AlignmentLayoutConstraint" />
        </node>
      </node>
    </node>
  </root>
  <root id="3546006303814975218">
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="3546006303814975219">
      <property name="name" nameId="tpck.1169194664001" value="content" />
      <link role="specializes" roleId="sqp9.6424935405035112768" targetNodeId="7421785601023770755" resolveInfo="children" />
    </node>
  </root>
  <root id="6261739386029717105">
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.UIProperty" typeId="sqp9.8381258131358158045" id="1870423755832688529">
      <property name="name" nameId="tpck.1169194664001" value="contentPane" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="5409370515560040349">
        <link role="container" roleId="fb0y.5776545240963923439" targetNodeId="7421785601023770755" resolveInfo="children" />
        <link role="uiObject" roleId="fb0y.5776545240964961906" targetNodeId="7421785601023770754" resolveInfo="Panel" />
      </node>
    </node>
    <node role="action" roleId="sqp9.6261739386029733428" type="sqp9.UIAction" typeId="sqp9.6261739386029732715" id="6261739386029958928">
      <property name="name" nameId="tpck.1169194664001" value="show" />
    </node>
    <node role="action" roleId="sqp9.6261739386029733428" type="sqp9.UIAction" typeId="sqp9.6261739386029732715" id="6261739386029958929">
      <property name="name" nameId="tpck.1169194664001" value="hide" />
    </node>
  </root>
  <root id="2700392567716868344">
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.UIProperty" typeId="sqp9.8381258131358158045" id="2700392567716868345">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.StringType" typeId="tpee.1225271177708" id="2700392567716868347" />
    </node>
  </root>
</model>

