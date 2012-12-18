<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c895905f1(test.structure)">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1169126353597">
      <property name="name" nameId="tpck.1169194664001" value="ABC" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1171045444576">
      <property name="name" nameId="tpck.1169194664001" value="A" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1215626917979">
      <property name="name" nameId="tpck.1169194664001" value="AA" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1215628673339">
      <property name="name" nameId="tpck.1169194664001" value="IAaa" />
    </node>
  </roots>
  <root id="1169126353597">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1171093460374">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" />
    </node>
  </root>
  <root id="1171045444576">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1171045452046">
      <property name="name" nameId="tpck.1169194664001" value="cx" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
  </root>
  <root id="1215626917979">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1215627520431">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
  </root>
  <root id="1215628673339">
    <node role="extends" roleId="tpce.1169127546356" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1215628680512">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="extends" roleId="tpce.1169127546356" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1215628682983">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1196978630214" resolveInfo="IResolveInfo" />
    </node>
  </root>
</model>

