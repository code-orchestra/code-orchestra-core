<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:44c1e24e-ae03-4621-8280-952d17b58d73(jetbrains.jetpad.builders.sandbox2)">
  <persistence version="7" />
  <language namespace="132aa4d8-a3f7-441c-a7eb-3fce23492c6a(jetbrains.mps.baseLanguage.builders)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <import index="78ys" modelUID="r:49eba21e-740e-4a19-9958-32f14a0e86d2(jetbrains.jetpad.builders.sandbox)" version="-1" />
  <import index="pmg0" modelUID="r:77052501-5144-48a7-be50-7535fc6d1073(jetbrains.mps.baseLanguage.builders.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="4737519895010426712">
      <property name="name" nameId="tpck.1169194664001" value="ABC" />
    </node>
  </roots>
  <root id="4737519895010426712">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4737519895010426713" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="4737519895010426714">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4737519895010426715" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4737519895010426716" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4737519895010426717">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4737519895010426718">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4737519895010426719">
            <node role="creator" roleId="tpee.1145553007750" type="pmg0.BuilderCreator" typeId="pmg0.7057666463730155278" id="4737519895010426721">
              <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="4737519895010426722">
                <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="4737519895010426724">
                  <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="4737519895010426725" />
                  <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.BeanPropertyBuilder" typeId="pmg0.2679357232283750087" id="4737519895010426726">
                    <link role="setter" roleId="pmg0.2679357232283750088" targetNodeId="78ys.2679357232283934851" resolveInfo="setXYZ" />
                    <node role="value" roleId="pmg0.2679357232283750106" type="pmg0.ResultExpression" typeId="pmg0.7288041816792292064" id="4737519895010426728" />
                  </node>
                </node>
              </node>
              <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilder" typeId="pmg0.7288041816793071802" id="4737519895010426723">
                <link role="declaration" roleId="pmg0.7288041816793071803" targetNodeId="78ys.3816167865390945389" resolveInfo="root" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
</model>

