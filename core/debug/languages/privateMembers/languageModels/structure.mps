<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:886e64b3-d82c-4444-8cd9-9ede48ec4a0f(jetbrains.mps.debug.privateMembers.structure)">
  <persistence version="7" />
  <language namespace="80208897-4572-437d-b50e-8f050cba9566(jetbrains.mps.debug.privateMembers)" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6825241477451043705">
      <property name="name" nameId="tpck.1169194664001" value="PrivateFieldReferenceOperation" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1197029447546" resolveInfo="FieldReferenceOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6825241477451051014">
      <property name="name" nameId="tpck.1169194664001" value="PrivateInstanceMethodCallOperation" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1202948039474" resolveInfo="InstanceMethodCallOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4107550939057698505">
      <property name="name" nameId="tpck.1169194664001" value="PrivateStaticFieldReference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1070533707846" resolveInfo="StaticFieldReference" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3374946611454212811">
      <property name="name" nameId="tpck.1169194664001" value="PrivateStaticMethodCall" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1081236700937" resolveInfo="StaticMethodCall" />
    </node>
  </roots>
  <root id="6825241477451043705" />
  <root id="6825241477451051014" />
  <root id="4107550939057698505" />
  <root id="3374946611454212811" />
</model>

