<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:972ae1d5-2beb-44b3-a739-a548d8eb423d(jetbrains.mps.build.mpsautobuild)">
  <persistence version="7" />
  <language namespace="4e6c5313-7662-4c44-9bc7-b488cec17508(jetbrains.mps.build.packaging)" />
  <language namespace="a79f53b6-9aaa-48eb-9fbb-aaec80a6da9a(jetbrains.mps.build.custommps)" />
  <language namespace="0b608d44-1308-418d-8715-22d040c3b3cc(jetbrains.mps.buildlanguage)" />
  <language namespace="fba399db-f591-45dc-a279-e2a2a986e262(jetbrains.mps.build.generictasks)" />
  <language-engaged-on-generation namespace="3c6d6f72-fc0d-4d9d-8c5d-cb82e96c422b(jetbrains.mps.build.packaging.mps)" />
  <import index="tps4" modelUID="r:00000000-0000-4000-0000-011c895904d8(jetbrains.mps.build.packaging.structure)" version="8" implicit="yes" />
  <import index="tpsk" modelUID="r:00000000-0000-4000-0000-011c895904c8(jetbrains.mps.buildlanguage.structure)" version="21" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="ddum" modelUID="r:1e7ada09-c25e-41ea-a9b5-398e142ef533(jetbrains.mps.build.generictasks.structure)" version="22" implicit="yes" />
  <import index="nqc9" modelUID="r:19a13561-830e-4400-a084-e2990744f9e1(jetbrains.mps.build.packaging.defaultVariables)" version="-1" implicit="yes" />
  <import index="j1at" modelUID="r:896f64dd-7cfe-4bc4-b401-38e2a027e9ae(jetbrains.mps.build.custommps.structure)" version="-1" implicit="yes" />
  <import index="adh8" modelUID="r:7a6a35c6-e369-4565-b91b-c7c8dfa2c8d7(jetbrains.mps.build.generictasks.generated)" version="-1" implicit="yes" />
  <roots>
    <node type="tps4.Layout" typeId="tps4.1202916958754" id="2235195415637073459">
      <property name="name" nameId="tpck.1169194664001" value="MPS" />
      <property name="compile" nameId="tps4.1216901049448" value="true" />
    </node>
    <node type="tpsk.Project" typeId="tpsk.1196851066733" id="2235195415637076848">
      <property name="name" nameId="tpck.1169194664001" value="help-build" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="8431776905956472400">
      <property name="name" nameId="tpck.1169194664001" value="MPS-src.zip" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="components" />
      <link role="layout" roleId="tps4.7323449223785753314" targetNodeId="2235195415637073459" resolveInfo="MPS" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="8431776905956472682">
      <property name="name" nameId="tpck.1169194664001" value="generate.ant.task.jar" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="components" />
      <link role="layout" roleId="tps4.7323449223785753314" targetNodeId="2235195415637073459" resolveInfo="MPS" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="8431776905956472694">
      <property name="name" nameId="tpck.1169194664001" value="idea-patch.jar" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="components" />
      <link role="layout" roleId="tps4.7323449223785753314" targetNodeId="2235195415637073459" resolveInfo="MPS" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="8431776905956472723">
      <property name="name" nameId="tpck.1169194664001" value="mps.jar" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="components" />
      <link role="layout" roleId="tps4.7323449223785753314" targetNodeId="2235195415637073459" resolveInfo="MPS" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="8431776905956472858">
      <property name="name" nameId="tpck.1169194664001" value="core" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="modules.core" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="8431776905956472865">
      <property name="name" nameId="tpck.1169194664001" value="core.baseLanguage" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="modules.core" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="8431776905956472896">
      <property name="name" nameId="tpck.1169194664001" value="core.debug" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="modules.core" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="8431776905956472902">
      <property name="name" nameId="tpck.1169194664001" value="core.devkits" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="modules.core" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="8431776905956472907">
      <property name="name" nameId="tpck.1169194664001" value="core.languageDesign" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="modules.core" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="8431776905956472940">
      <property name="name" nameId="tpck.1169194664001" value="core.usages" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="modules.core" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="8431776905956472948">
      <property name="name" nameId="tpck.1169194664001" value="util" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="modules.platform" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="8431776905956472964">
      <property name="name" nameId="tpck.1169194664001" value="platform.baseLanguage" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="modules.platform" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="8431776905956472972">
      <property name="name" nameId="tpck.1169194664001" value="platform.build" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="modules.platform" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="8431776905956472981">
      <property name="name" nameId="tpck.1169194664001" value="platform.deprecated" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="modules.platform" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="8431776905956472985">
      <property name="name" nameId="tpck.1169194664001" value="platform.ui" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="modules.platform" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="8431776905956472996">
      <property name="name" nameId="tpck.1169194664001" value="platform.xml" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="modules.platform" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="7715871110555971738">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="components" />
      <property name="name" nameId="tpck.1169194664001" value="mpsboot.jar" />
      <link role="layout" roleId="tps4.7323449223785753314" targetNodeId="2235195415637073459" resolveInfo="MPS" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="1479728067424032862">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="modules.platform" />
      <property name="name" nameId="tpck.1169194664001" value="platform.editor" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="5297918386943402887">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="modules" />
      <property name="name" nameId="tpck.1169194664001" value="mps.solutions" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="2738111162319948310">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="modules.core" />
      <property name="name" nameId="tpck.1169194664001" value="core.execution" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="5358686142361317193">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="components" />
      <property name="name" nameId="tpck.1169194664001" value="mpstest.jar" />
    </node>
    <node type="tps4.Block" typeId="tps4.701559220729212645" id="6108265972537541352">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="components" />
      <property name="name" nameId="tpck.1169194664001" value="branding" />
      <link role="layout" roleId="tps4.7323449223785753314" targetNodeId="2235195415637073459" resolveInfo="MPS" />
    </node>
  </roots>
  <root id="2235195415637073459">
    <node role="variable" roleId="tps4.1205335538326" type="tps4.Variable" typeId="tps4.1205335290326" id="2235195415637077105">
      <property name="antName" nameId="tps4.1205335307578" value="build.number" />
      <property name="name" nameId="tpck.1169194664001" value="build" />
    </node>
    <node role="variable" roleId="tps4.1205335538326" type="tps4.Variable" typeId="tps4.1205335290326" id="2235195415637077106">
      <property name="name" nameId="tpck.1169194664001" value="revision" />
      <property name="antName" nameId="tps4.1205335307578" value="build.vcs.number" />
    </node>
    <node role="variable" roleId="tps4.1205335538326" type="tps4.Variable" typeId="tps4.1205335290326" id="2235195415637077107">
      <property name="antName" nameId="tps4.1205335307578" value="teamcity.buildConfName" />
      <property name="name" nameId="tpck.1169194664001" value="configuration" />
    </node>
    <node role="variable" roleId="tps4.1205335538326" type="tps4.Variable" typeId="tps4.1205335290326" id="2235195415637077108">
      <property name="antName" nameId="tps4.1205335307578" value="version" />
      <property name="name" nameId="tpck.1169194664001" value="version" />
    </node>
    <node role="component" roleId="tps4.1203599325709" type="j1at.MPSDistribution" typeId="j1at.2235195415637073414" id="2235195415637073471">
      <property name="excludes" nameId="tps4.1204107522064" value="" />
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="2235195415637076979">
        <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="2235195415637076980">
          <property name="excludes" nameId="tps4.1204107522064" value="**/*.hprof" />
          <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637076981">
            <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637076982">
              <property name="name" nameId="tps4.1220976068141" value="mps_home" />
            </node>
            <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637076983">
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="2235195415637076984">
                <property name="path" nameId="tps4.1220974398640" value="bin" />
              </node>
            </node>
          </node>
        </node>
        <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="2235195415637076985">
          <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637076986">
            <property name="name" nameId="tps4.1223641503366" value="lib" />
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="4789416207834122801">
            <property name="name" nameId="tpck.1169194664001" value="" />
            <property name="excludes" nameId="tps4.1204107538752" value="src/, **/*.zip" />
            <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="4789416207834122802">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="4789416207834122803">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="4789416207834122804">
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4789416207834122805">
                  <property name="path" nameId="tps4.1220974398640" value="lib" />
                </node>
              </node>
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="2235195415637076988">
            <link role="block" roleId="tps4.701559220729212648" targetNodeId="8431776905956472400" resolveInfo="MPS-src.zip" />
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="2235195415637076990">
            <link role="block" roleId="tps4.701559220729212648" targetNodeId="8431776905956472694" resolveInfo="idea-patch.jar" />
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="2235195415637076991">
            <link role="block" roleId="tps4.701559220729212648" targetNodeId="8431776905956472723" resolveInfo="mps.jar" />
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="7715871110555971755">
            <link role="block" roleId="tps4.701559220729212648" targetNodeId="7715871110555971738" resolveInfo="mpsboot.jar" />
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="5358686142361317204">
            <link role="block" roleId="tps4.701559220729212648" targetNodeId="5358686142361317193" resolveInfo="mpstest.jar" />
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="6108265972537541354">
            <link role="block" roleId="tps4.701559220729212648" targetNodeId="6108265972537541352" resolveInfo="branding" />
          </node>
        </node>
        <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="2235195415637076992">
          <property name="excludes" nameId="tps4.1204107522064" value="" />
          <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637076993">
            <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637076994">
              <property name="name" nameId="tps4.1220976068141" value="mps_home" />
            </node>
            <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637076995">
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="2235195415637076996">
                <property name="path" nameId="tps4.1220974398640" value="license" />
              </node>
            </node>
          </node>
        </node>
        <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="2235195415637076997">
          <property name="excludes" nameId="tps4.1204107522064" value="**/*.zip" />
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Plugin" typeId="tps4.4159241239519649208" id="4169262926912883426">
            <node role="sourcePath" roleId="tps4.4159241239519649209" type="tps4.Path" typeId="tps4.1220973916698" id="4169262926912883427">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="4169262926912883430">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="4169262926912883429">
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4169262926912883431">
                  <property name="path" nameId="tps4.1220974398640" value="plugins" />
                </node>
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4169262926912883433">
                  <property name="path" nameId="tps4.1220974398640" value="ideaIntegration" />
                </node>
              </node>
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Plugin" typeId="tps4.4159241239519649208" id="888657369809591775">
            <node role="sourcePath" roleId="tps4.4159241239519649209" type="tps4.Path" typeId="tps4.1220973916698" id="888657369809591776">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="888657369809591779">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="888657369809591778">
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="888657369809591780">
                  <property name="path" nameId="tps4.1220974398640" value="plugins" />
                </node>
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="888657369809591782">
                  <property name="path" nameId="tps4.1220974398640" value="vcs" />
                </node>
              </node>
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Plugin" typeId="tps4.4159241239519649208" id="6294484613093498665">
            <node role="sourcePath" roleId="tps4.4159241239519649209" type="tps4.Path" typeId="tps4.1220973916698" id="6294484613093498666">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="6294484613093498667">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="6294484613093498668">
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="6294484613093498669">
                  <property name="path" nameId="tps4.1220974398640" value="plugins" />
                </node>
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="6294484613093498671">
                  <property name="path" nameId="tps4.1220974398640" value="mpsdevkit" />
                </node>
              </node>
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Plugin" typeId="tps4.4159241239519649208" id="5140833141761699107">
            <node role="sourcePath" roleId="tps4.4159241239519649209" type="tps4.Path" typeId="tps4.1220973916698" id="5140833141761699108">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="5140833141761699111">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="5140833141761699110">
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="5140833141761699112">
                  <property name="path" nameId="tps4.1220974398640" value="plugins" />
                </node>
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="5140833141761699114">
                  <property name="path" nameId="tps4.1220974398640" value="mpsmake" />
                </node>
              </node>
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Plugin" typeId="tps4.4159241239519649208" id="3232404296906910599">
            <node role="sourcePath" roleId="tps4.4159241239519649209" type="tps4.Path" typeId="tps4.1220973916698" id="3232404296906910600">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="3232404296906910601">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="3232404296906910602">
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3232404296906910603">
                  <property name="path" nameId="tps4.1220974398640" value="plugins" />
                </node>
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3232404296906910605">
                  <property name="path" nameId="tps4.1220974398640" value="migration" />
                </node>
              </node>
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Plugin" typeId="tps4.4159241239519649208" id="1637215966142774366">
            <node role="sourcePath" roleId="tps4.4159241239519649209" type="tps4.Path" typeId="tps4.1220973916698" id="1637215966142774367">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1637215966142774370">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1637215966142774369">
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1637215966142774371">
                  <property name="path" nameId="tps4.1220974398640" value="plugins" />
                </node>
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1637215966142774373">
                  <property name="path" nameId="tps4.1220974398640" value="mpsjava" />
                </node>
              </node>
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Plugin" typeId="tps4.4159241239519649208" id="7585993236912488389">
            <node role="sourcePath" roleId="tps4.4159241239519649209" type="tps4.Path" typeId="tps4.1220973916698" id="7585993236912488390">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="7585993236912488391">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="7585993236912488392">
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="7585993236912488393">
                  <property name="path" nameId="tps4.1220974398640" value="plugins" />
                </node>
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="7585993236912488395">
                  <property name="path" nameId="tps4.1220974398640" value="modelchecker" />
                </node>
              </node>
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Plugin" typeId="tps4.4159241239519649208" id="4169262926912883434">
            <node role="sourcePath" roleId="tps4.4159241239519649209" type="tps4.Path" typeId="tps4.1220973916698" id="4169262926912883435">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="4169262926912883436">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="4169262926912883437">
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4169262926912883438">
                  <property name="path" nameId="tps4.1220974398640" value="plugins" />
                </node>
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4169262926912883440">
                  <property name="path" nameId="tps4.1220974398640" value="samples" />
                </node>
              </node>
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Plugin" typeId="tps4.4159241239519649208" id="3698330505678787832">
            <node role="sourcePath" roleId="tps4.4159241239519649209" type="tps4.Path" typeId="tps4.1220973916698" id="3698330505678787833">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="3698330505678787836">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="3698330505678787835">
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3698330505678787837">
                  <property name="path" nameId="tps4.1220974398640" value="plugins" />
                </node>
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3698330505678787839">
                  <property name="path" nameId="tps4.1220974398640" value="debugger-api" />
                </node>
              </node>
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Plugin" typeId="tps4.4159241239519649208" id="3143674608461055660">
            <node role="sourcePath" roleId="tps4.4159241239519649209" type="tps4.Path" typeId="tps4.1220973916698" id="3143674608461055661">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="3143674608461055664">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="3143674608461055663">
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3143674608461055665">
                  <property name="path" nameId="tps4.1220974398640" value="plugins" />
                </node>
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3143674608461055667">
                  <property name="path" nameId="tps4.1220974398640" value="debugger-java" />
                </node>
              </node>
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Jar" typeId="tps4.1203598417283" id="5863766511025183787">
            <node role="delete" roleId="tps4.1239622410040" type="tps4.Delete" typeId="tps4.1204122781510" id="5863766511025183788" />
            <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="5863766511025300738">
              <property name="name" nameId="tps4.1223641503366" value="mpseditor.jar" />
            </node>
            <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="5863766511025300755">
              <property name="includes" nameId="tps4.1206439615350" value="**/plugin.xml" />
              <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="5863766511025300756">
                <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="5863766511025300757">
                  <property name="name" nameId="tps4.1220976068141" value="mps_home" />
                </node>
                <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="5863766511025300759">
                  <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="5863766511025300760">
                    <property name="path" nameId="tps4.1220974398640" value="plugins" />
                  </node>
                  <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="5863766511025300763">
                    <property name="path" nameId="tps4.1220974398640" value="mpseditor" />
                  </node>
                  <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="5863766511025300765">
                    <property name="path" nameId="tps4.1220974398640" value="META-INF" />
                  </node>
                </node>
              </node>
            </node>
            <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="5863766511025300769">
              <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="5863766511025300772">
                <property name="name" nameId="tps4.1223641503366" value="modules" />
              </node>
              <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="5863766511025300773">
                <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="5863766511025300774">
                  <property name="name" nameId="tps4.1220976068141" value="mps_home" />
                </node>
                <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="5863766511025300775">
                  <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="5863766511025300776">
                    <property name="path" nameId="tps4.1220974398640" value="plugins" />
                  </node>
                  <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="5863766511025300777">
                    <property name="path" nameId="tps4.1220974398640" value="mpseditor" />
                  </node>
                  <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="5863766511025300779">
                    <property name="path" nameId="tps4.1220974398640" value="solution" />
                  </node>
                </node>
              </node>
            </node>
            <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="5863766511025394031">
              <property name="name" nameId="tpck.1169194664001" value="" />
              <property name="excludes" nameId="tps4.1204107538752" value="" />
              <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="5863766511025394032">
                <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="5863766511025394033">
                  <property name="name" nameId="tps4.1220976068141" value="mps_home" />
                </node>
                <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="5863766511025394034">
                  <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="5863766511025394036">
                    <property name="path" nameId="tps4.1220974398640" value="plugins" />
                  </node>
                  <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="5863766511025394038">
                    <property name="path" nameId="tps4.1220974398640" value="mpseditor" />
                  </node>
                  <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="5863766511025394040">
                    <property name="path" nameId="tps4.1220974398640" value="classes" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="3698330505678787842">
            <property name="excludes" nameId="tps4.1204107522064" value="" />
            <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="3698330505678787843">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="3698330505678787845">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="3698330505678787846">
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3698330505678787847">
                  <property name="path" nameId="tps4.1220974398640" value="plugins" />
                </node>
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3698330505678787849">
                  <property name="path" nameId="tps4.1220974398640" value="cvsIntegration" />
                </node>
              </node>
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="3698330505678787850">
            <property name="excludes" nameId="tps4.1204107522064" value="" />
            <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="3698330505678787851">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="3698330505678787852">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="3698330505678787853">
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3698330505678787874">
                  <property name="path" nameId="tps4.1220974398640" value="plugins" />
                </node>
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3698330505678787876">
                  <property name="path" nameId="tps4.1220974398640" value="git4idea" />
                </node>
              </node>
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="3698330505678787856">
            <property name="excludes" nameId="tps4.1204107522064" value="" />
            <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="3698330505678787857">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="3698330505678787858">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="3698330505678787859">
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3698330505678787860">
                  <property name="path" nameId="tps4.1220974398640" value="plugins" />
                </node>
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3698330505678787878">
                  <property name="path" nameId="tps4.1220974398640" value="svn4idea" />
                </node>
              </node>
            </node>
          </node>
          <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="3698330505678787840">
            <property name="name" nameId="tps4.1223641503366" value="plugins" />
          </node>
        </node>
        <node role="entry" roleId="tps4.1203617897549" type="tps4.Zip" typeId="tps4.1204018553150" id="2235195415637077005">
          <property name="excludes" nameId="tps4.1204107522064" value="" />
          <node role="delete" roleId="tps4.1239622410040" type="tps4.Delete" typeId="tps4.1204122781510" id="2235195415637077006" />
          <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077007">
            <property name="name" nameId="tps4.1223641503366" value="samples.zip" />
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="2235195415637077013">
            <property name="excludes" nameId="tps4.1204107522064" value="" />
            <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077014">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077015">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077016">
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="2235195415637077017">
                  <property name="path" nameId="tps4.1220974398640" value="samples" />
                </node>
              </node>
            </node>
            <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077018">
              <property name="name" nameId="tps4.1223641503366" value="MPSSamples" />
            </node>
          </node>
        </node>
        <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="2235195415637077024">
          <property name="name" nameId="tpck.1169194664001" value="core" />
          <node role="entry" roleId="tps4.1203617897549" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="2235195415637077025">
            <link role="block" roleId="tps4.701559220729212648" targetNodeId="8431776905956472858" resolveInfo="core" />
          </node>
          <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077026">
            <property name="name" nameId="tps4.1223641503366" value="languages" />
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="2235195415637077028">
            <link role="block" roleId="tps4.701559220729212648" targetNodeId="8431776905956472948" resolveInfo="util" />
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="2235195415637077029">
            <link role="block" roleId="tps4.701559220729212648" targetNodeId="8431776905956472682" resolveInfo="generate.ant.task.jar" />
          </node>
        </node>
        <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="2235195415637077031">
          <property name="name" nameId="tpck.1169194664001" value="plugin" />
          <property name="excludes" nameId="tps4.1204107522064" value="**/*.java" />
          <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077032">
            <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077033">
              <property name="name" nameId="tps4.1220976068141" value="mps_home" />
            </node>
            <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077034">
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="2235195415637077035">
                <property name="path" nameId="tps4.1220974398640" value="plugin" />
              </node>
            </node>
          </node>
        </node>
        <node role="entry" roleId="tps4.1203617897549" type="tps4.Antcall" typeId="tps4.1210777529562" id="6128676491055265548">
          <property name="excludes" nameId="tps4.1204107522064" value="" />
          <link role="project" roleId="tps4.1210777812278" targetNodeId="2235195415637076848" resolveInfo="help-build" />
          <link role="targetDeclaration" roleId="tps4.1224178284812" targetNodeId="2235195415637076873" resolveInfo="append.idea.version" />
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Echo" typeId="tps4.1205331422635" id="6128676491055265550">
            <node role="sourcePath" roleId="tps4.1220981955937" type="tps4.Path" typeId="tps4.1220973916698" id="6128676491055265551">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="6128676491055265552">
                <property name="name" nameId="tps4.1220976068141" value="basedir" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="6128676491055265553" />
            </node>
            <node role="message" roleId="tps4.1205340508811" type="tps4.CompositeString" typeId="tps4.1205342812422" id="6128676491055265554">
              <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="6128676491055265555">
                <property name="name" nameId="tps4.1223641503366" value="build.number=" />
              </node>
              <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="6128676491055265556">
                <node role="left" roleId="tps4.1205342829799" type="tps4.VariableReference" typeId="tps4.1205339464939" id="6128676491055265557">
                  <link role="variable" roleId="tps4.1205339484191" targetNodeId="2235195415637077105" resolveInfo="build" />
                </node>
                <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="6128676491055265558">
                  <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="6128676491055265559">
                    <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="6128676491055265560">
                      <node role="left" roleId="tps4.1205342829799" type="tps4.VariableReference" typeId="tps4.1205339464939" id="6128676491055265561">
                        <link role="variable" roleId="tps4.1205339484191" targetNodeId="nqc9.5558646027962551662" resolveInfo="\n" />
                      </node>
                      <node role="right" roleId="tps4.1205342834160" type="tps4.SimpleString" typeId="tps4.1205339044029" id="6128676491055265562">
                        <property name="name" nameId="tps4.1223641503366" value="date=" />
                      </node>
                    </node>
                    <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="6128676491055265563">
                      <node role="left" roleId="tps4.1205342829799" type="tps4.VariableReference" typeId="tps4.1205339464939" id="6128676491055265564">
                        <link role="variable" roleId="tps4.1205339484191" targetNodeId="nqc9.5558646027962551661" resolveInfo="date" />
                      </node>
                      <node role="right" roleId="tps4.1205342834160" type="tps4.VariableReference" typeId="tps4.1205339464939" id="6128676491055265565">
                        <link role="variable" roleId="tps4.1205339484191" targetNodeId="nqc9.5558646027962551662" resolveInfo="\n" />
                      </node>
                    </node>
                  </node>
                  <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="6128676491055265566">
                    <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="6128676491055265567">
                      <property name="name" nameId="tps4.1223641503366" value="revision.number=" />
                    </node>
                    <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="6128676491055265568">
                      <node role="left" roleId="tps4.1205342829799" type="tps4.VariableReference" typeId="tps4.1205339464939" id="6128676491055265569">
                        <link role="variable" roleId="tps4.1205339484191" targetNodeId="2235195415637077106" resolveInfo="revision" />
                      </node>
                      <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="6128676491055265570">
                        <node role="left" roleId="tps4.1205342829799" type="tps4.VariableReference" typeId="tps4.1205339464939" id="6128676491055265571">
                          <link role="variable" roleId="tps4.1205339484191" targetNodeId="nqc9.5558646027962551662" resolveInfo="\n" />
                        </node>
                        <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="6128676491055265572">
                          <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="6128676491055265573">
                            <node role="right" roleId="tps4.1205342834160" type="tps4.VariableReference" typeId="tps4.1205339464939" id="6128676491055265574">
                              <link role="variable" roleId="tps4.1205339484191" targetNodeId="2235195415637077108" resolveInfo="version" />
                            </node>
                            <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="6128676491055265575">
                              <property name="name" nameId="tps4.1223641503366" value="version=" />
                            </node>
                          </node>
                          <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="6128676491055265576">
                            <node role="right" roleId="tps4.1205342834160" type="tps4.VariableReference" typeId="tps4.1205339464939" id="6128676491055265577">
                              <link role="variable" roleId="tps4.1205339484191" targetNodeId="nqc9.5558646027962551662" resolveInfo="\n" />
                            </node>
                            <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="6128676491055265578">
                              <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="6128676491055265579">
                                <property name="name" nameId="tps4.1223641503366" value="configuration.name=" />
                              </node>
                              <node role="right" roleId="tps4.1205342834160" type="tps4.VariableReference" typeId="tps4.1205339464939" id="6128676491055265580">
                                <link role="variable" roleId="tps4.1205339484191" targetNodeId="2235195415637077107" resolveInfo="configuration" />
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
            <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="6128676491055265581">
              <property name="name" nameId="tps4.1223641503366" value="build.number" />
            </node>
          </node>
          <node role="delete" roleId="tps4.1210852534988" type="tps4.Delete" typeId="tps4.1204122781510" id="6128676491055265549" />
        </node>
        <node role="entry" roleId="tps4.1203617897549" type="tps4.File" typeId="tps4.1203598322527" id="2235195415637077074">
          <property name="name" nameId="tpck.1169194664001" value="entryPoints.xml" />
          <node role="sourcePath" roleId="tps4.1220981955937" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077075">
            <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077076">
              <property name="name" nameId="tps4.1220976068141" value="mps_home" />
            </node>
            <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077077">
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="2235195415637077078">
                <property name="path" nameId="tps4.1220974398640" value="entryPoints.xml" />
              </node>
            </node>
          </node>
        </node>
        <node role="entry" roleId="tps4.1203617897549" type="tps4.File" typeId="tps4.1203598322527" id="2235195415637077079">
          <property name="name" nameId="tpck.1169194664001" value="readme.txt" />
          <node role="sourcePath" roleId="tps4.1220981955937" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077080">
            <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077081">
              <property name="name" nameId="tps4.1220976068141" value="mps_home" />
            </node>
            <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077082">
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="2235195415637077083">
                <property name="path" nameId="tps4.1220974398640" value="readme.txt" />
              </node>
            </node>
          </node>
          <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077084">
            <property name="name" nameId="tps4.1223641503366" value="readme.txt" />
          </node>
        </node>
        <node role="entry" roleId="tps4.1203617897549" type="tps4.File" typeId="tps4.1203598322527" id="2235195415637077085">
          <node role="sourcePath" roleId="tps4.1220981955937" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077086">
            <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077087">
              <property name="name" nameId="tps4.1220976068141" value="mps_home" />
            </node>
            <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077088">
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="2235195415637077089">
                <property name="path" nameId="tps4.1220974398640" value="releaseNotes.txt" />
              </node>
            </node>
          </node>
        </node>
        <node role="entry" roleId="tps4.1203617897549" type="tps4.File" typeId="tps4.1203598322527" id="2235195415637077090">
          <node role="sourcePath" roleId="tps4.1220981955937" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077091">
            <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077092">
              <property name="name" nameId="tps4.1220976068141" value="mps_home" />
            </node>
            <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077093">
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="2235195415637077094">
                <property name="path" nameId="tps4.1220974398640" value="about.txt" />
              </node>
            </node>
          </node>
        </node>
        <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077095">
          <property name="name" nameId="tps4.1223641503366" value="MPS" />
        </node>
      </node>
      <node role="pathToBuildToolsZip" roleId="j1at.2235195415637073457" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637073472">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637073473">
          <property name="name" nameId="tps4.1220976068141" value="basedir" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637073474" />
      </node>
    </node>
    <node role="component" roleId="tps4.1203599325709" type="tps4.Antcall" typeId="tps4.1210777529562" id="6128676491055265583">
      <property name="excludes" nameId="tps4.1204107522064" value="" />
      <link role="project" roleId="tps4.1210777812278" targetNodeId="2235195415637076848" resolveInfo="help-build" />
      <link role="targetDeclaration" roleId="tps4.1224178284812" targetNodeId="2235195415637076901" resolveInfo="pack.mps.src" />
      <node role="delete" roleId="tps4.1210852534988" type="tps4.Delete" typeId="tps4.1204122781510" id="6128676491055265584" />
    </node>
    <node role="component" roleId="tps4.1203599325709" type="tps4.Zip" typeId="tps4.1204018553150" id="2235195415637077143">
      <node role="title" roleId="tps4.1205340441197" type="tps4.CompositeString" typeId="tps4.1205342812422" id="1004035210977047770">
        <node role="right" roleId="tps4.1205342834160" type="tps4.SimpleString" typeId="tps4.1205339044029" id="1004035210977047773">
          <property name="name" nameId="tps4.1223641503366" value="-buildTools.zip" />
        </node>
        <node role="left" roleId="tps4.1205342829799" type="tps4.VariableReference" typeId="tps4.1205339464939" id="1004035210977047769">
          <link role="variable" roleId="tps4.1205339484191" targetNodeId="2235195415637077105" resolveInfo="build" />
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="2235195415637077144">
        <property name="excludes" nameId="tps4.1204107522064" value="**/SignCode.exe, **/sign.code.jar" />
        <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077145">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077146">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077147">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="2235195415637077148">
              <property name="path" nameId="tps4.1220974398640" value="build" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="2235195415637077149">
              <property name="path" nameId="tps4.1220974398640" value="tools" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="2235195415637077150">
        <property name="excludes" nameId="tps4.1204107522064" value="**/*.spc, **/*.pvk, **/*.pw" />
        <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077151">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077152">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077153">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="2235195415637077154">
              <property name="path" nameId="tps4.1220974398640" value="build" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="2235195415637077155">
              <property name="path" nameId="tps4.1220974398640" value="resources" />
            </node>
          </node>
        </node>
      </node>
      <node role="delete" roleId="tps4.1239622410040" type="tps4.Delete" typeId="tps4.1204122781510" id="2235195415637077156" />
    </node>
    <node role="configuration" roleId="tps4.1204115898932" type="tps4.Configuration" typeId="tps4.1204115658627" id="2235195415637073460">
      <property name="name" nameId="tpck.1169194664001" value="external" />
    </node>
    <node role="builtInVariable" roleId="tps4.1205337304382" type="tps4.Variable" typeId="tps4.1205335290326" id="2235195415637073461">
      <property name="name" nameId="tpck.1169194664001" value=":" />
      <property name="antName" nameId="tps4.1205335307578" value="path.separator" />
    </node>
    <node role="builtInVariable" roleId="tps4.1205337304382" type="tps4.Variable" typeId="tps4.1205335290326" id="2235195415637073462">
      <property name="name" nameId="tpck.1169194664001" value="basedir" />
      <property name="antName" nameId="tps4.1205335307578" value="basedir" />
    </node>
    <node role="builtInVariable" roleId="tps4.1205337304382" type="tps4.Variable" typeId="tps4.1205335290326" id="2235195415637073463">
      <property name="name" nameId="tpck.1169194664001" value="date" />
      <property name="antName" nameId="tps4.1205335307578" value="DSTAMP" />
    </node>
    <node role="builtInVariable" roleId="tps4.1205337304382" type="tps4.Variable" typeId="tps4.1205335290326" id="2235195415637073464">
      <property name="name" nameId="tpck.1169194664001" value="\n" />
      <property name="antName" nameId="tps4.1205335307578" value="line.separator" />
    </node>
    <node role="builtInVariable" roleId="tps4.1205337304382" type="tps4.Variable" typeId="tps4.1205335290326" id="2235195415637073465">
      <property name="name" nameId="tpck.1169194664001" value="/" />
      <property name="antName" nameId="tps4.1205335307578" value="file.separator" />
    </node>
    <node role="baseDirectory" roleId="tps4.1226493152214" type="tps4.BaseDirPath" typeId="tps4.1226494304686" id="2235195415637073466">
      <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637073467">
        <property name="name" nameId="tps4.1220976068141" value="mps_home" />
      </node>
      <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637073468" />
    </node>
    <node role="deployDirectory" roleId="tps4.462257719548209895" type="tps4.Path" typeId="tps4.1220973916698" id="462257719548547135">
      <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="4483399040246280652">
        <property name="name" nameId="tps4.1220976068141" value="base_dir" />
      </node>
      <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="462257719548547137">
        <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="462257719548547138">
          <property name="path" nameId="tps4.1220974398640" value=".." />
        </node>
        <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="462257719548547139">
          <property name="path" nameId="tps4.1220974398640" value="MPS.artifacts" />
        </node>
      </node>
    </node>
    <node role="scriptsDirectory" roleId="tps4.462257719548209896" type="tps4.Path" typeId="tps4.1220973916698" id="462257719548547161">
      <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="4483399040246280653">
        <property name="name" nameId="tps4.1220976068141" value="base_dir" />
      </node>
      <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="462257719548547163">
        <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="462257719548547164">
          <property name="path" nameId="tps4.1220974398640" value="build" />
        </node>
      </node>
    </node>
  </root>
  <root id="2235195415637076848">
    <node role="property" roleId="tpsk.1200425668297" type="tpsk.ExternalPropertyDeclaration" typeId="tpsk.1219147669362" id="2235195415637076849">
      <property name="name" nameId="tpck.1169194664001" value="input.dir" />
      <node role="type" roleId="tpsk.1196870993204" type="tpsk.FileType" typeId="tpsk.1199032398223" id="2235195415637076850" />
    </node>
    <node role="property" roleId="tpsk.1200425668297" type="tpsk.ExternalPropertyDeclaration" typeId="tpsk.1219147669362" id="2235195415637076851">
      <property name="name" nameId="tpck.1169194664001" value="output.dir" />
      <node role="type" roleId="tpsk.1196870993204" type="tpsk.FileType" typeId="tpsk.1199032398223" id="2235195415637076852" />
    </node>
    <node role="property" roleId="tpsk.1200425668297" type="tpsk.ExternalPropertyDeclaration" typeId="tpsk.1219147669362" id="2235195415637076853">
      <property name="name" nameId="tpck.1169194664001" value="deploy.dir" />
      <node role="type" roleId="tpsk.1196870993204" type="tpsk.FileType" typeId="tpsk.1199032398223" id="2235195415637076854" />
    </node>
    <node role="property" roleId="tpsk.1200425668297" type="tpsk.ExternalPropertyDeclaration" typeId="tpsk.1219147669362" id="2235195415637076855">
      <property name="name" nameId="tpck.1169194664001" value="version" />
      <node role="type" roleId="tpsk.1196870993204" type="tpsk.StringType" typeId="tpsk.1196870403099" id="2235195415637076856" />
    </node>
    <node role="property" roleId="tpsk.1200425668297" type="tpsk.ExternalPropertyDeclaration" typeId="tpsk.1219147669362" id="2235195415637076857">
      <property name="name" nameId="tpck.1169194664001" value="build.number" />
      <node role="type" roleId="tpsk.1196870993204" type="tpsk.StringType" typeId="tpsk.1196870403099" id="2235195415637076858" />
    </node>
    <node role="target" roleId="tpsk.1196851079482" type="tpsk.TargetDeclaration" typeId="tpsk.1196851099544" id="2235195415637076859">
      <property name="name" nameId="tpck.1169194664001" value="repack.sources" />
      <property name="shortDescription" nameId="tpck.1156234966388" value="search for sources into subdirs and put them into one basedir" />
      <node role="taskCall" roleId="tpsk.1196851542249" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076860">
        <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802812427" resolveInfo="copy" />
        <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076861">
          <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802814270" resolveInfo="mapper" />
          <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076862">
            <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814283" resolveInfo="type" />
            <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076863">
              <property name="value" nameId="tpsk.1196861024475" value="regexp" />
            </node>
          </node>
          <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076864">
            <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814277" resolveInfo="from" />
            <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076865">
              <property name="value" nameId="tpsk.1196861024475" value="(.*)(/|\\)(src|sources|source|source_gen|source-api)(/|\\)(.*)" />
            </node>
          </node>
          <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076866">
            <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814281" resolveInfo="to" />
            <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076867">
              <property name="value" nameId="tpsk.1196861024475" value="\5" />
            </node>
          </node>
        </node>
        <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076868">
          <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802813175" resolveInfo="fileset" />
          <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076869">
            <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802811531" resolveInfo="dir" />
            <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="2235195415637076870">
              <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="2235195415637076849" resolveInfo="input.dir" />
            </node>
          </node>
        </node>
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076871">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802812455" resolveInfo="todir" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="2235195415637076872">
            <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="2235195415637076851" resolveInfo="output.dir" />
          </node>
        </node>
      </node>
    </node>
    <node role="target" roleId="tpsk.1196851079482" type="tpsk.TargetDeclaration" typeId="tpsk.1196851099544" id="2235195415637076873">
      <property name="name" nameId="tpck.1169194664001" value="append.idea.version" />
      <property name="shortDescription" nameId="tpck.1156234966388" value="reads idea version from file" />
      <node role="propertyList" roleId="tpsk.1200425580778" type="tpsk.PropertyDeclaration" typeId="tpsk.1196851107341" id="2235195415637076874">
        <property name="name" nameId="tpck.1169194664001" value="build.number.file" />
        <node role="type" roleId="tpsk.1196870993204" type="tpsk.FileType" typeId="tpsk.1199032398223" id="2235195415637076875" />
        <node role="propertyValue" roleId="tpsk.1196851904859" type="tpsk.FileName" typeId="tpsk.1199031681512" id="2235195415637076876">
          <node role="value" roleId="tpsk.1199031757132" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="2235195415637076877">
            <node role="right" roleId="tpsk.1197107881958" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076878">
              <property name="value" nameId="tpsk.1196861024475" value="/build.number" />
            </node>
            <node role="left" roleId="tpsk.1197107855106" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="2235195415637076879">
              <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="2235195415637076849" resolveInfo="input.dir" />
            </node>
          </node>
        </node>
      </node>
      <node role="propertyList" roleId="tpsk.1200425580778" type="tpsk.ExternalPropertyDeclaration" typeId="tpsk.1219147669362" id="2235195415637076880">
        <property name="name" nameId="tpck.1169194664001" value="mps_home" />
        <node role="type" roleId="tpsk.1196870993204" type="tpsk.FileType" typeId="tpsk.1199032398223" id="2235195415637076881" />
      </node>
      <node role="taskCall" roleId="tpsk.1196851542249" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076882">
        <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802814750" resolveInfo="property" />
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076883">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814757" resolveInfo="file" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.FileName" typeId="tpsk.1199031681512" id="2235195415637076884">
            <node role="value" roleId="tpsk.1199031757132" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="2235195415637076885">
              <node role="left" roleId="tpsk.1197107855106" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="2235195415637076886">
                <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="2235195415637076880" resolveInfo="mps_home" />
              </node>
              <node role="right" roleId="tpsk.1197107881958" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076887">
                <property name="value" nameId="tpsk.1196861024475" value="/build.number" />
              </node>
            </node>
          </node>
        </node>
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076888">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814761" resolveInfo="prefix" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076889">
            <property name="value" nameId="tpsk.1196861024475" value="repo" />
          </node>
        </node>
      </node>
      <node role="taskCall" roleId="tpsk.1196851542249" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076890">
        <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802812872" resolveInfo="echo" />
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076891">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802812878" resolveInfo="file" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="2235195415637076892">
            <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="2235195415637076874" resolveInfo="build.number.file" />
          </node>
        </node>
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076893">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802812873" resolveInfo="append" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.BooleanLiteral" typeId="tpsk.1196865966685" id="2235195415637076894">
            <property name="value" nameId="tpsk.1196866040780" value="true" />
          </node>
        </node>
        <node role="internalText" roleId="tpsk.1197724814674" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076895">
          <property name="value" nameId="tpsk.1196861024475" value="${line.separator}idea.platform.build.number=${repo.idea.platform.build.number}" />
        </node>
      </node>
      <node role="taskCall" roleId="tpsk.1196851542249" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076896">
        <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802812427" resolveInfo="copy" />
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076897">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802812435" resolveInfo="file" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="2235195415637076898">
            <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="2235195415637076874" resolveInfo="build.number.file" />
          </node>
        </node>
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076899">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802812455" resolveInfo="todir" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="2235195415637076900">
            <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="2235195415637076851" resolveInfo="output.dir" />
          </node>
        </node>
      </node>
    </node>
    <node role="target" roleId="tpsk.1196851079482" type="tpsk.TargetDeclaration" typeId="tpsk.1196851099544" id="2235195415637076901">
      <property name="name" nameId="tpck.1169194664001" value="pack.mps.src" />
      <property name="shortDescription" nameId="tpck.1156234966388" value="package mps sources" />
      <node role="propertyList" roleId="tpsk.1200425580778" type="tpsk.PropertyDeclaration" typeId="tpsk.1196851107341" id="2235195415637076902">
        <property name="name" nameId="tpck.1169194664001" value="tmpdir" />
        <node role="type" roleId="tpsk.1196870993204" type="tpsk.FileType" typeId="tpsk.1199032398223" id="2235195415637076903" />
        <node role="propertyValue" roleId="tpsk.1196851904859" type="tpsk.FileName" typeId="tpsk.1199031681512" id="2235195415637076904">
          <node role="value" roleId="tpsk.1199031757132" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="2235195415637076905">
            <node role="right" roleId="tpsk.1197107881958" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="2235195415637076906">
              <node role="right" roleId="tpsk.1197107881958" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076907">
                <property name="value" nameId="tpsk.1196861024475" value="MPS.src" />
              </node>
              <node role="left" roleId="tpsk.1197107855106" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076908">
                <property name="value" nameId="tpsk.1196861024475" value="/" />
              </node>
            </node>
            <node role="left" roleId="tpsk.1197107855106" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076909">
              <property name="value" nameId="tpsk.1196861024475" value="${java.io.tmpdir}" />
            </node>
          </node>
        </node>
      </node>
      <node role="taskCall" roleId="tpsk.1196851542249" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076910">
        <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802814434" resolveInfo="mkdir" />
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076911">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814435" resolveInfo="dir" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="2235195415637076912">
            <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="2235195415637076902" resolveInfo="tmpdir" />
          </node>
        </node>
      </node>
      <node role="taskCall" roleId="tpsk.1196851542249" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076913">
        <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802815892" resolveInfo="zip" />
        <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076914">
          <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802815941" resolveInfo="zipfileset" />
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2339938892738274374">
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802811560" resolveInfo="exclude" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2339938892738274375">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814494" resolveInfo="name" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="2339938892738274376">
                <node role="left" roleId="tpsk.1197107855106" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="2339938892738274377">
                  <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="2235195415637076853" resolveInfo="deploy.dir" />
                </node>
                <node role="right" roleId="tpsk.1197107881958" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2339938892738274378">
                  <property name="value" nameId="tpsk.1196861024475" value="/**" />
                </node>
              </node>
            </node>
          </node>
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2339938892738152803">
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802811560" resolveInfo="exclude" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2339938892738152804">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814494" resolveInfo="name" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2339938892738152805">
                <property name="value" nameId="tpsk.1196861024475" value="classes/**" />
              </node>
            </node>
          </node>
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076926">
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802811560" resolveInfo="exclude" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076927">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814494" resolveInfo="name" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076928">
                <property name="value" nameId="tpsk.1196861024475" value="**/*.class" />
              </node>
            </node>
          </node>
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076929">
            <property name="shortDescription" nameId="tpck.1156234966388" value="exclude build desk files" />
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802811560" resolveInfo="exclude" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076930">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814494" resolveInfo="name" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076931">
                <property name="value" nameId="tpsk.1196861024475" value="**/*.bdp" />
              </node>
            </node>
          </node>
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076932">
            <property name="shortDescription" nameId="tpck.1156234966388" value="exclude files used for signing" />
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802811560" resolveInfo="exclude" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076933">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814494" resolveInfo="name" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076934">
                <property name="value" nameId="tpsk.1196861024475" value="**/*.pvk" />
              </node>
            </node>
          </node>
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076935">
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802811560" resolveInfo="exclude" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076936">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814494" resolveInfo="name" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076937">
                <property name="value" nameId="tpsk.1196861024475" value="**/*.spc" />
              </node>
            </node>
          </node>
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076938">
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802811560" resolveInfo="exclude" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076939">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814494" resolveInfo="name" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076940">
                <property name="value" nameId="tpsk.1196861024475" value="**/*.pw" />
              </node>
            </node>
          </node>
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076941">
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802811560" resolveInfo="exclude" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076942">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814494" resolveInfo="name" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076943">
                <property name="value" nameId="tpsk.1196861024475" value="**/sign/**" />
              </node>
            </node>
          </node>
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076944">
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802811560" resolveInfo="exclude" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076945">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814494" resolveInfo="name" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076946">
                <property name="value" nameId="tpsk.1196861024475" value="system/**" />
              </node>
            </node>
          </node>
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076947">
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802811560" resolveInfo="exclude" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076948">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814494" resolveInfo="name" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076949">
                <property name="value" nameId="tpsk.1196861024475" value="**/*.hprof" />
              </node>
            </node>
          </node>
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076950">
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802811560" resolveInfo="exclude" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076951">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814494" resolveInfo="name" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076952">
                <property name="value" nameId="tpsk.1196861024475" value="integrationBuild*" />
              </node>
            </node>
          </node>
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8375061986520656486">
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802811560" resolveInfo="exclude" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8375061986520656487">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814494" resolveInfo="name" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8375061986520656488">
                <property name="value" nameId="tpsk.1196861024475" value=".git/**" />
              </node>
            </node>
          </node>
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2339938892738152794">
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802811560" resolveInfo="exclude" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2339938892738152795">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814494" resolveInfo="name" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2339938892738152796">
                <property name="value" nameId="tpsk.1196861024475" value=".idea/workspace.xml" />
              </node>
            </node>
          </node>
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2339938892738152791">
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802811560" resolveInfo="exclude" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2339938892738152792">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814494" resolveInfo="name" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2339938892738152793">
                <property name="value" nameId="tpsk.1196861024475" value="**/.idea/workspace.xml" />
              </node>
            </node>
          </node>
          <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076953">
            <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802811856" resolveInfo="dir" />
            <node role="value" roleId="ddum.353793545802643468" type="tpsk.FileName" typeId="tpsk.1199031681512" id="2235195415637076954">
              <node role="value" roleId="tpsk.1199031757132" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076955">
                <property name="value" nameId="tpsk.1196861024475" value="${base_dir}" />
              </node>
            </node>
          </node>
          <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076956">
            <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802811860" resolveInfo="prefix" />
            <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076957">
              <property name="value" nameId="tpsk.1196861024475" value="MPS" />
            </node>
          </node>
        </node>
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076964">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802815899" resolveInfo="destfile" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.FileName" typeId="tpsk.1199031681512" id="2235195415637076965">
            <node role="value" roleId="tpsk.1199031757132" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="2235195415637076966">
              <node role="right" roleId="tpsk.1197107881958" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="2235195415637076967">
                <node role="right" roleId="tpsk.1197107881958" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="2235195415637076968">
                  <node role="right" roleId="tpsk.1197107881958" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076969">
                    <property name="value" nameId="tpsk.1196861024475" value="-src.zip" />
                  </node>
                  <node role="left" roleId="tpsk.1197107855106" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="2235195415637076970">
                    <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="2235195415637076857" resolveInfo="build.number" />
                  </node>
                </node>
                <node role="left" roleId="tpsk.1197107855106" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="2235195415637076971">
                  <property name="value" nameId="tpsk.1196861024475" value="/" />
                </node>
              </node>
              <node role="left" roleId="tpsk.1197107855106" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="2235195415637076972">
                <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="2235195415637076851" resolveInfo="output.dir" />
              </node>
            </node>
          </node>
        </node>
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076973">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802815911" resolveInfo="filesonly" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.BooleanLiteral" typeId="tpsk.1196865966685" id="2235195415637076974">
            <property name="value" nameId="tpsk.1196866040780" value="true" />
          </node>
        </node>
      </node>
      <node role="taskCall" roleId="tpsk.1196851542249" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="2235195415637076975">
        <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802812660" resolveInfo="delete" />
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="2235195415637076976">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802812669" resolveInfo="dir" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="2235195415637076977">
            <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="2235195415637076902" resolveInfo="tmpdir" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="8431776905956472400">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Zip" typeId="tps4.1204018553150" id="8431776905956472401">
      <property name="includes" nameId="tps4.1206439615350" value="**/*.java" />
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Antcall" typeId="tps4.1210777529562" id="8431776905956472412">
        <property name="includes" nameId="tps4.1206439615350" value="**/*.java" />
        <link role="project" roleId="tps4.1210777812278" targetNodeId="2235195415637076848" resolveInfo="help-build" />
        <link role="targetDeclaration" roleId="tps4.1224178284812" targetNodeId="2235195415637076859" resolveInfo="repack.sources" />
        <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="8431776905956472423">
          <property name="excludes" nameId="tps4.1204107522064" value="**/sandbox/**" />
          <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="8431776905956472424">
            <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8431776905956472425">
              <property name="name" nameId="tps4.1220976068141" value="mps_home" />
            </node>
            <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8431776905956472426">
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4789416207834247959">
                <property name="path" nameId="tps4.1220974398640" value="MPSPlugin" />
              </node>
            </node>
          </node>
        </node>
        <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="8431776905956472413">
          <property name="excludes" nameId="tps4.1204107522064" value="**/sandbox/**" />
          <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="8431776905956472414">
            <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8431776905956472415">
              <property name="name" nameId="tps4.1220976068141" value="mps_home" />
            </node>
            <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8431776905956472416">
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472417">
                <property name="path" nameId="tps4.1220974398640" value="core" />
              </node>
            </node>
          </node>
        </node>
        <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="4789416207834247952">
          <property name="excludes" nameId="tps4.1204107522064" value="**/sandbox/**" />
          <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="4789416207834247953">
            <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="4789416207834247954">
              <property name="name" nameId="tps4.1220976068141" value="mps_home" />
            </node>
            <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="4789416207834247955">
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4789416207834247958">
                <property name="path" nameId="tps4.1220974398640" value="languages" />
              </node>
            </node>
          </node>
        </node>
        <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="4789416207834247942">
          <property name="excludes" nameId="tps4.1204107522064" value="**/sandbox/**" />
          <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="4789416207834247943">
            <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="4789416207834247944">
              <property name="name" nameId="tps4.1220976068141" value="mps_home" />
            </node>
            <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="4789416207834247945">
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4789416207834247957">
                <property name="path" nameId="tps4.1220974398640" value="plugins" />
              </node>
            </node>
          </node>
        </node>
        <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="8431776905956472428">
          <property name="excludes" nameId="tps4.1204107522064" value="**/sandbox/**" />
          <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="8431776905956472429">
            <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8431776905956472430">
              <property name="name" nameId="tps4.1220976068141" value="mps_home" />
            </node>
            <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8431776905956472431">
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472432">
                <property name="path" nameId="tps4.1220974398640" value="resources" />
              </node>
            </node>
          </node>
        </node>
        <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="8431776905956472433">
          <property name="excludes" nameId="tps4.1204107522064" value="**/sandbox/**" />
          <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="8431776905956472434">
            <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8431776905956472435">
              <property name="name" nameId="tps4.1220976068141" value="mps_home" />
            </node>
            <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8431776905956472436">
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472437">
                <property name="path" nameId="tps4.1220974398640" value="workbench" />
              </node>
            </node>
          </node>
        </node>
        <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="135746194687529741">
          <property name="excludes" nameId="tps4.1204107522064" value="**/sandbox/**" />
          <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="135746194687529742">
            <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="135746194687529743">
              <property name="name" nameId="tps4.1220976068141" value="mps_home" />
            </node>
            <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="135746194687529744">
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="135746194687529746">
                <property name="path" nameId="tps4.1220974398640" value="testbench" />
              </node>
            </node>
          </node>
        </node>
        <node role="delete" roleId="tps4.1210852534988" type="tps4.Delete" typeId="tps4.1204122781510" id="8431776905956472438" />
      </node>
      <node role="delete" roleId="tps4.1239622410040" type="tps4.Delete" typeId="tps4.1204122781510" id="8431776905956472439" />
      <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="8431776905956472440">
        <property name="name" nameId="tps4.1223641503366" value="MPS-src.zip" />
      </node>
    </node>
  </root>
  <root id="8431776905956472682">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Jar" typeId="tps4.1203598417283" id="8431776905956472683">
      <property name="excludes" nameId="tps4.1204107522064" value="" />
      <node role="delete" roleId="tps4.1239622410040" type="tps4.Delete" typeId="tps4.1204122781510" id="8431776905956472684" />
      <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="8431776905956472685">
        <property name="name" nameId="tps4.1223641503366" value="generate.ant.task.jar" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="8431776905956472686">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <property name="includes" nameId="tps4.1206439809898" value="**/*.class, **/*.xml" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="8431776905956472687">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8431776905956472688">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8431776905956472689">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3749843785778538831">
              <property name="path" nameId="tps4.1220974398640" value="languages" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3749843785778538833">
              <property name="path" nameId="tps4.1220974398640" value="util" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472691">
              <property name="path" nameId="tps4.1220974398640" value="buildlanguage" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472692">
              <property name="path" nameId="tps4.1220974398640" value="ant" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472693">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Echo" typeId="tps4.1205331422635" id="3737212209850343886">
        <node role="sourcePath" roleId="tps4.1220981955937" type="tps4.Path" typeId="tps4.1220973916698" id="3737212209850343887">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="3737212209850343888">
            <property name="name" nameId="tps4.1220976068141" value="basedir" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="3737212209850343889" />
        </node>
        <node role="message" roleId="tps4.1205340508811" type="tps4.CompositeString" typeId="tps4.1205342812422" id="3737212209850343890">
          <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="3737212209850343891">
            <property name="name" nameId="tps4.1223641503366" value="build.number=" />
          </node>
          <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="3737212209850343892">
            <node role="left" roleId="tps4.1205342829799" type="tps4.VariableReference" typeId="tps4.1205339464939" id="3737212209850343893">
              <link role="variable" roleId="tps4.1205339484191" targetNodeId="2235195415637077105" resolveInfo="build" />
            </node>
            <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="3737212209850343894">
              <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="3737212209850343895">
                <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="3737212209850343896">
                  <node role="left" roleId="tps4.1205342829799" type="tps4.VariableReference" typeId="tps4.1205339464939" id="3737212209850343897">
                    <link role="variable" roleId="tps4.1205339484191" targetNodeId="nqc9.5558646027962551662" resolveInfo="\n" />
                  </node>
                  <node role="right" roleId="tps4.1205342834160" type="tps4.SimpleString" typeId="tps4.1205339044029" id="3737212209850343898">
                    <property name="name" nameId="tps4.1223641503366" value="date=" />
                  </node>
                </node>
                <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="3737212209850343899">
                  <node role="left" roleId="tps4.1205342829799" type="tps4.VariableReference" typeId="tps4.1205339464939" id="3737212209850343900">
                    <link role="variable" roleId="tps4.1205339484191" targetNodeId="nqc9.5558646027962551661" resolveInfo="date" />
                  </node>
                  <node role="right" roleId="tps4.1205342834160" type="tps4.VariableReference" typeId="tps4.1205339464939" id="3737212209850343901">
                    <link role="variable" roleId="tps4.1205339484191" targetNodeId="nqc9.5558646027962551662" resolveInfo="\n" />
                  </node>
                </node>
              </node>
              <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="3737212209850343902">
                <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="3737212209850343903">
                  <property name="name" nameId="tps4.1223641503366" value="revision.number=" />
                </node>
                <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="3737212209850343904">
                  <node role="left" roleId="tps4.1205342829799" type="tps4.VariableReference" typeId="tps4.1205339464939" id="3737212209850343905">
                    <link role="variable" roleId="tps4.1205339484191" targetNodeId="2235195415637077106" resolveInfo="revision" />
                  </node>
                  <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="3737212209850343906">
                    <node role="left" roleId="tps4.1205342829799" type="tps4.VariableReference" typeId="tps4.1205339464939" id="3737212209850343907">
                      <link role="variable" roleId="tps4.1205339484191" targetNodeId="nqc9.5558646027962551662" resolveInfo="\n" />
                    </node>
                    <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="3737212209850343908">
                      <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="3737212209850343909">
                        <node role="right" roleId="tps4.1205342834160" type="tps4.VariableReference" typeId="tps4.1205339464939" id="3737212209850343910">
                          <link role="variable" roleId="tps4.1205339484191" targetNodeId="2235195415637077108" resolveInfo="version" />
                        </node>
                        <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="3737212209850343911">
                          <property name="name" nameId="tps4.1223641503366" value="version=" />
                        </node>
                      </node>
                      <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="3737212209850343912">
                        <node role="right" roleId="tps4.1205342834160" type="tps4.VariableReference" typeId="tps4.1205339464939" id="3737212209850343913">
                          <link role="variable" roleId="tps4.1205339484191" targetNodeId="nqc9.5558646027962551662" resolveInfo="\n" />
                        </node>
                        <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="3737212209850343914">
                          <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="3737212209850343915">
                            <property name="name" nameId="tps4.1223641503366" value="configuration.name=" />
                          </node>
                          <node role="right" roleId="tps4.1205342834160" type="tps4.VariableReference" typeId="tps4.1205339464939" id="3737212209850343916">
                            <link role="variable" roleId="tps4.1205339484191" targetNodeId="2235195415637077107" resolveInfo="configuration" />
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
        <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="3737212209850343917">
          <property name="name" nameId="tps4.1223641503366" value="build.number" />
        </node>
      </node>
    </node>
  </root>
  <root id="8431776905956472694">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Jar" typeId="tps4.1203598417283" id="8431776905956472695">
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="8431776905956472696">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="8431776905956472697">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8431776905956472698">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8431776905956472699">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472700">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472701">
              <property name="path" nameId="tps4.1220974398640" value="idea-patch" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472702">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="delete" roleId="tps4.1239622410040" type="tps4.Delete" typeId="tps4.1204122781510" id="8431776905956472703" />
      <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="8431776905956472704">
        <property name="name" nameId="tps4.1223641503366" value="idea-patch.jar" />
      </node>
    </node>
  </root>
  <root id="8431776905956472723">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Jar" typeId="tps4.1203598417283" id="8431776905956472724">
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="8431776905956472725">
        <property name="excludes" nameId="tps4.1204107538752" value="production/, test/" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="8431776905956472726">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8431776905956472727">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8431776905956472728">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472729">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="8431776905956472743">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="8431776905956472744">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8431776905956472745">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8431776905956472746">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472747">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472748">
              <property name="path" nameId="tps4.1220974398640" value="debug" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472749">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="8431776905956472750">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="8431776905956472751">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8431776905956472752">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8431776905956472753">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472754">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472755">
              <property name="path" nameId="tps4.1220974398640" value="debug-api" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472756">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="6580548712479854556">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="6580548712479854557">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="6580548712479854558">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="6580548712479854559">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="6580548712479854560">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="6580548712479854561">
              <property name="path" nameId="tps4.1220974398640" value="runtime" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="6580548712479854562">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="584530787515934098">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="584530787515934099">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="584530787515934100">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="584530787515934101">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="584530787515934102">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="584530787515934105">
              <property name="path" nameId="tps4.1220974398640" value="actions-runtime" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="584530787515934107">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="8321411439574220249">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="8321411439574220250">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8321411439574220252">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8321411439574220253">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8321411439574220254">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8321411439574220256">
              <property name="path" nameId="tps4.1220974398640" value="editor-runtime" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8321411439574220258">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="713639312207922614">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="713639312207922615">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="713639312207922617">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="713639312207922618">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="713639312207922619">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="713639312207922621">
              <property name="path" nameId="tps4.1220974398640" value="analyzers" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="713639312207922623">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="9187726857862700399">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="9187726857862700400">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="9187726857862700402">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="9187726857862700403">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="9187726857862700404">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="9187726857862700407">
              <property name="path" nameId="tps4.1220974398640" value="intentions-runtime" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="9187726857862700409">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="3050731179905795638">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="3050731179905795639">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="3050731179905795640">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="3050731179905795641">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3050731179905795642">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3050731179905795645">
              <property name="path" nameId="tps4.1220974398640" value="findUsages-runtime" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3050731179905795644">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="4947949243743638875">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="4947949243743638876">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="4947949243743638877">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="4947949243743638878">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4947949243743638879">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4947949243743638882">
              <property name="path" nameId="tps4.1220974398640" value="refactoring-runtime" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4947949243743638881">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="4423212183691725349">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="4423212183691725350">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="4423212183691725351">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="4423212183691725352">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4423212183691725353">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4423212183691725356">
              <property name="path" nameId="tps4.1220974398640" value="plugin-runtime" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4423212183691725355">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="8431776905956472766">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="8431776905956472767">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8431776905956472768">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8431776905956472769">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472770">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472771">
              <property name="path" nameId="tps4.1220974398640" value="generator" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472772">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="6580548712479854547">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="6580548712479854548">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="6580548712479854549">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="6580548712479854550">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="6580548712479854551">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="6580548712479854552">
              <property name="path" nameId="tps4.1220974398640" value="typesystemEngine" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="6580548712479854553">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="3956519295465648157">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="3956519295465648158">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="3956519295465648159">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="3956519295465648160">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3956519295465648161">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3956519295465648164">
              <property name="path" nameId="tps4.1220974398640" value="typesystemIntegration" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3956519295465648163">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="3646513537108689199">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="3646513537108689200">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="3646513537108689203">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="3646513537108689202">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3646513537108689204">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3646513537108689206">
              <property name="path" nameId="tps4.1220974398640" value="make-runtime" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3646513537108689208">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="8340725549277608419">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="8340725549277608420">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8340725549277608422">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8340725549277608423">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608424">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608426">
              <property name="path" nameId="tps4.1220974398640" value="baseLanguage" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608430">
              <property name="path" nameId="tps4.1220974398640" value="baseLanguage" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608432">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="8340725549277608434">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="8340725549277608435">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8340725549277608436">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8340725549277608437">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608438">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608439">
              <property name="path" nameId="tps4.1220974398640" value="baseLanguage" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608466">
              <property name="path" nameId="tps4.1220974398640" value="closures" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608467">
              <property name="path" nameId="tps4.1220974398640" value="runtime" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608469">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="8340725549277608442">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="8340725549277608443">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8340725549277608444">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8340725549277608445">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608446">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608447">
              <property name="path" nameId="tps4.1220974398640" value="baseLanguage" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608470">
              <property name="path" nameId="tps4.1220974398640" value="collections" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608471">
              <property name="path" nameId="tps4.1220974398640" value="runtime" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608473">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="8340725549277608450">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="8340725549277608451">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8340725549277608452">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8340725549277608453">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608454">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608455">
              <property name="path" nameId="tps4.1220974398640" value="baseLanguage" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608474">
              <property name="path" nameId="tps4.1220974398640" value="collections" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608475">
              <property name="path" nameId="tps4.1220974398640" value="languages" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608477">
              <property name="path" nameId="tps4.1220974398640" value="trove" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608480">
              <property name="path" nameId="tps4.1220974398640" value="runtime" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608482">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="8340725549277608487">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="8340725549277608488">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8340725549277608489">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8340725549277608490">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608491">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608492">
              <property name="path" nameId="tps4.1220974398640" value="baseLanguage" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608493">
              <property name="path" nameId="tps4.1220974398640" value="runConfigurations" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608494">
              <property name="path" nameId="tps4.1220974398640" value="runtime" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608495">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="8340725549277608458">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="8340725549277608459">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8340725549277608460">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8340725549277608461">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608462">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608463">
              <property name="path" nameId="tps4.1220974398640" value="baseLanguage" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608483">
              <property name="path" nameId="tps4.1220974398640" value="tuples" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608484">
              <property name="path" nameId="tps4.1220974398640" value="runtime" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8340725549277608486">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="8431776905956472773">
        <property name="excludes" nameId="tps4.1204107538752" value="idea/IdeaApplicationInfo.xml" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="8431776905956472774">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8431776905956472775">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8431776905956472776">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472777">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472778">
              <property name="path" nameId="tps4.1220974398640" value="kernel" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472779">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="3215189890787254349">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="3215189890787254350">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="3215189890787254351">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="3215189890787254352">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3215189890787254353">
              <property name="path" nameId="tps4.1220974398640" value="core" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3215189890787254356">
              <property name="path" nameId="tps4.1220974398640" value="languageDesign" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3215189890787254358">
              <property name="path" nameId="tps4.1220974398640" value="test" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3215189890787254360">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="8431776905956472730">
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="8431776905956472731">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8431776905956472732">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8431776905956472733">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472734">
              <property name="path" nameId="tps4.1220974398640" value="workbench" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472735">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="100083319862435411">
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="100083319862435412">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="100083319862435413">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="100083319862435414">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3869841980284510818">
              <property name="path" nameId="tps4.1220974398640" value="languages" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3869841980284510819">
              <property name="path" nameId="tps4.1220974398640" value="util" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3869841980284510820">
              <property name="path" nameId="tps4.1220974398640" value="runConfigurations" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3869841980284510822">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="4136991712207258581">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="4136991712207258582">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="4136991712207258585">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="4136991712207258584">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4136991712207258587">
              <property name="path" nameId="tps4.1220974398640" value="workbench" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4136991712207258589">
              <property name="path" nameId="tps4.1220974398640" value="typesystemUi" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4136991712207258593">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="4423212183691725329">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="4423212183691725330">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="4423212183691725332">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="4423212183691725333">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3749843785778538837">
              <property name="path" nameId="tps4.1220974398640" value="languages" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3749843785778538836">
              <property name="path" nameId="tps4.1220974398640" value="util" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="3749843785778538838">
              <property name="path" nameId="tps4.1220974398640" value="uiLanguage" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4423212183691725338">
              <property name="path" nameId="tps4.1220974398640" value="runtime" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4423212183691725340">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="8431776905956472807">
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="8431776905956472808">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8431776905956472809">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8431776905956472810">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472811">
              <property name="path" nameId="tps4.1220974398640" value="MPSPlugin" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8431776905956472812">
              <property name="path" nameId="tps4.1220974398640" value="apiclasses" />
            </node>
          </node>
        </node>
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="5297918386943227809">
        <property name="excludes" nameId="tps4.1204107522064" value="" />
        <node role="entry" roleId="tps4.1203617897549" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="5297918386943402891">
          <link role="block" roleId="tps4.701559220729212648" targetNodeId="5297918386943402887" resolveInfo="mps.solutions" />
        </node>
        <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="5297918386943227812">
          <property name="name" nameId="tps4.1223641503366" value="modules" />
        </node>
      </node>
      <node role="delete" roleId="tps4.1239622410040" type="tps4.Delete" typeId="tps4.1204122781510" id="8431776905956472813" />
      <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="8431776905956472814">
        <property name="name" nameId="tps4.1223641503366" value="mps.jar" />
      </node>
    </node>
  </root>
  <root id="8431776905956472858">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="8431776905956472859">
      <link role="block" roleId="tps4.701559220729212648" targetNodeId="8431776905956472940" resolveInfo="core.usages" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="8431776905956472860">
      <link role="block" roleId="tps4.701559220729212648" targetNodeId="8431776905956472865" resolveInfo="core.baseLanguage" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="8431776905956472861">
      <link role="block" roleId="tps4.701559220729212648" targetNodeId="8431776905956472907" resolveInfo="core.languageDesign" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="8431776905956472862">
      <link role="block" roleId="tps4.701559220729212648" targetNodeId="8431776905956472902" resolveInfo="core.devkits" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="8431776905956472863">
      <link role="block" roleId="tps4.701559220729212648" targetNodeId="8431776905956472896" resolveInfo="core.debug" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="8669189765730048454">
      <link role="block" roleId="tps4.701559220729212648" targetNodeId="2738111162319948310" resolveInfo="core.execution" />
    </node>
  </root>
  <root id="8431776905956472865">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Folder" typeId="tps4.1203598512427" id="8431776905956472866">
      <property name="name" nameId="tpck.1169194664001" value="baseLanguage" />
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472874">
        <property name="id" nameId="tps4.1222447189012" value="4c6a28d1-2c60-478d-b36e-db9b3cbb21fb" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472876">
        <property name="id" nameId="tps4.1222447189012" value="9b80526e-f0bf-4992-bdf5-cee39c1833f3" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="4332999099594619242">
        <property name="id" nameId="tps4.1222447189012" value="86abb39a-11fb-4a1e-ae95-ea43cc94ae42" />
        <property name="name" nameId="tpck.1169194664001" value="collections.runtime.gwt" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472877">
        <property name="id" nameId="tps4.1222447189012" value="134ef213-c518-42b0-b12c-c109aa13d320" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472878">
        <property name="id" nameId="tps4.1222447189012" value="927a8eff-b060-4b84-9bf9-95534382f566" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472867">
        <property name="id" nameId="tps4.1222447189012" value="f3061a53-9226-4cc5-a443-f952ceaf5816" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472868">
        <property name="id" nameId="tps4.1222447189012" value="df345b11-b8c7-4213-ac66-48d2a9b75d88" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472869">
        <property name="id" nameId="tps4.1222447189012" value="ed6d7656-532c-4bc2-81d1-af945aeb8280" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472871">
        <property name="id" nameId="tps4.1222447189012" value="774bf8a0-62e5-41e1-af63-f4812e60e48b" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1881643288389932099">
        <property name="id" nameId="tps4.1222447189012" value="96ee7a94-411d-4cf8-9b94-96cad7e52411" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.baseLanguage.jdk7" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472872">
        <property name="id" nameId="tps4.1222447189012" value="443f4c36-fcf5-4eb6-9500-8d06ed259e3e" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472873">
        <property name="id" nameId="tps4.1222447189012" value="fd392034-7849-419d-9071-12563d152375" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472875">
        <property name="id" nameId="tps4.1222447189012" value="83888646-71ce-4f1c-9c53-c54016f6ad4f" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="6403884080056419735">
        <property name="id" nameId="tps4.1222447189012" value="cab85f8b-9525-42cb-8e6d-258ca6e56432" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.baseLanguage.index" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472882">
        <property name="id" nameId="tps4.1222447189012" value="f2801650-65d5-424e-bb1b-463a8781b786" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472883">
        <property name="id" nameId="tps4.1222447189012" value="760a0a8c-eabb-4521-8bfd-65db761a9ba3" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472887">
        <property name="id" nameId="tps4.1222447189012" value="a0c108f0-1637-416e-a249-3effbaa4c998" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472888">
        <property name="id" nameId="tps4.1222447189012" value="f61473f9-130f-42f6-b98d-6c438812c2f6" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472889">
        <property name="id" nameId="tps4.1222447189012" value="f618e99a-2641-465c-bb54-31fe76f9e285" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472890">
        <property name="id" nameId="tps4.1222447189012" value="83f155ff-422c-4b5a-a2f2-b459302dd215" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472892">
        <property name="id" nameId="tps4.1222447189012" value="a247e09e-2435-45ba-b8d2-07e93feba96a" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472893">
        <property name="id" nameId="tps4.1222447189012" value="d44dab97-aaac-44cb-9745-8a14db674c03" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472894">
        <property name="id" nameId="tps4.1222447189012" value="82c32a3b-4a54-4fc1-b551-7ff9f198d7c1" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="3327950833828934353">
        <property name="id" nameId="tps4.1222447189012" value="c2b4d111-b1a9-4476-8bfc-454cbf1a6e6c" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.baseLanguage.runConfigurations.runtime" />
      </node>
      <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="8431776905956472895">
        <property name="name" nameId="tps4.1223641503366" value="baseLanguage" />
      </node>
    </node>
  </root>
  <root id="8431776905956472896">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Folder" typeId="tps4.1203598512427" id="2520429355395831032">
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="2520429355395831035">
        <property name="id" nameId="tps4.1222447189012" value="7da4580f-9d75-4603-8162-51a896d78375" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="2520429355395831037">
        <property name="id" nameId="tps4.1222447189012" value="fa8aeae9-4df9-4e13-bfb1-9b04c67ddb77" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="2520429355395831038">
        <property name="id" nameId="tps4.1222447189012" value="80208897-4572-437d-b50e-8f050cba9566" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="2520429355395831039">
        <property name="id" nameId="tps4.1222447189012" value="fbc14279-5e2a-4c87-a5d1-5f7061e6c456" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.debug.apiLang" />
      </node>
      <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2520429355395831040">
        <property name="name" nameId="tps4.1223641503366" value="debug" />
      </node>
    </node>
  </root>
  <root id="8431776905956472902">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Folder" typeId="tps4.1203598512427" id="8431776905956472903">
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472904">
        <property name="id" nameId="tps4.1222447189012" value="fbc25dd2-5da4-483a-8b19-70928e1b62d7" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.devkit.general-purpose" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472905">
        <property name="id" nameId="tps4.1222447189012" value="2677cb18-f558-4e33-bc38-a5139cee06dc" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.devkit.language-design" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="6403884080056419733">
        <property name="id" nameId="tps4.1222447189012" value="e073aac8-8c71-4c23-be71-86bf7a6df0a2" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.devkit.bootstrap-languages" />
      </node>
      <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="8431776905956472906">
        <property name="name" nameId="tps4.1223641503366" value="devkits" />
      </node>
    </node>
  </root>
  <root id="8431776905956472907">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Folder" typeId="tps4.1203598512427" id="8431776905956472908">
      <property name="name" nameId="tpck.1169194664001" value="languageDesign" />
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472909">
        <property name="id" nameId="tps4.1222447189012" value="aee9cad2-acd4-4608-aef2-0004f6a1cdbd" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472911">
        <property name="id" nameId="tps4.1222447189012" value="af65afd8-f0dd-4942-87d9-63a55f2a9db1" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472912">
        <property name="id" nameId="tps4.1222447189012" value="3f4bc5f5-c6c1-4a28-8b10-c83066ffa4a1" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472913">
        <property name="id" nameId="tps4.1222447189012" value="81f0abb8-d71e-4d13-a0c1-d2291fbb28b7" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472914">
        <property name="id" nameId="tps4.1222447189012" value="18bc6592-03a6-4e29-a83a-7ff23bde13ba" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472916">
        <property name="id" nameId="tps4.1222447189012" value="64d34fcd-ad02-4e73-aff8-a581124c2e30" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472917">
        <property name="id" nameId="tps4.1222447189012" value="7a5dda62-9140-4668-ab76-d5ed1746f2b2" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472918">
        <property name="id" nameId="tps4.1222447189012" value="d7a92d38-f7db-40d0-8431-763b0c3c9f20" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472919">
        <property name="id" nameId="tps4.1222447189012" value="7fa12e9c-b949-4976-b4fa-19accbc320b4" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472923">
        <property name="id" nameId="tps4.1222447189012" value="d4615e3b-d671-4ba9-af01-2b78369b0ba7" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="5332947881305587609">
        <property name="id" nameId="tps4.1222447189012" value="5206c888-7c5d-4275-bc0a-7c4da12f46e8" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.lang.pattern.testLang" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472924">
        <property name="id" nameId="tps4.1222447189012" value="3a13115c-633c-4c5c-bbcc-75c4219e9555" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472925">
        <property name="id" nameId="tps4.1222447189012" value="28f9e497-3b42-4291-aeba-0a1039153ab1" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472926">
        <property name="id" nameId="tps4.1222447189012" value="13744753-c81f-424a-9c1b-cf8943bf4e86" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472927">
        <property name="id" nameId="tps4.1222447189012" value="7866978e-a0f0-4cc7-81bc-4d213d9375e1" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472928">
        <property name="id" nameId="tps4.1222447189012" value="9a4afe51-f114-4595-b5df-048ce3c596be" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472929">
        <property name="id" nameId="tps4.1222447189012" value="0eddeefa-c2d6-4437-bc2c-de50fd4ce470" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472930">
        <property name="id" nameId="tps4.1222447189012" value="c72da2b9-7cce-4447-8389-f407dc1158b7" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472931">
        <property name="id" nameId="tps4.1222447189012" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472932">
        <property name="id" nameId="tps4.1222447189012" value="3ecd7c84-cde3-45de-886c-135ecc69b742" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472933">
        <property name="id" nameId="tps4.1222447189012" value="b401a680-8325-4110-8fd3-84331ff25bef" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472934">
        <property name="id" nameId="tps4.1222447189012" value="d7706f63-9be2-479c-a3da-ae92af1e64d5" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="4332999099594557074">
        <property name="id" nameId="tps4.1222447189012" value="289fcc83-6543-41e8-a5ca-768235715ce4" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.lang.generator.generationParameters" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472935">
        <property name="id" nameId="tps4.1222447189012" value="8585453e-6bfb-4d80-98de-b16074f1d86c" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472937">
        <property name="id" nameId="tps4.1222447189012" value="b83431fe-5c8f-40bc-8a36-65e25f4dd253" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="2406271501070014044">
        <property name="id" nameId="tps4.1222447189012" value="9ded098b-ad6a-4657-bfd9-48636cfe8bc3" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.lang.traceable" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472938">
        <property name="id" nameId="tps4.1222447189012" value="ef703a71-a5a3-42af-b53c-ddced816ad5c" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8447281171170208180">
        <property name="id" nameId="tps4.1222447189012" value="b02ae39f-4c16-4545-8dfa-88df16804e7e" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.lang.smodelTests" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="3646513537108689210">
        <property name="id" nameId="tps4.1222447189012" value="696c1165-4a59-463b-bc5d-902caab85dd0" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.make.facet" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="3232404296906910608">
        <property name="id" nameId="tps4.1222447189012" value="86ef8290-12bb-4ca7-947f-093788f263a9" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.lang.project" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="2520429355395831041">
        <property name="id" nameId="tps4.1222447189012" value="f4ad079d-bc71-4ffb-9600-9328705cf998" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.lang.descriptor" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="3646513537108689213">
        <property name="id" nameId="tps4.1222447189012" value="95f8a3e6-f994-4ca0-a65e-763c9bae2d3b" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.make.script" />
      </node>
      <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="8431776905956472939">
        <property name="name" nameId="tps4.1223641503366" value="languageDesign" />
      </node>
    </node>
  </root>
  <root id="8431776905956472940">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472942">
      <property name="id" nameId="tps4.1222447189012" value="ceb47609-02c2-4927-bb6d-d58368388a62" />
    </node>
  </root>
  <root id="8431776905956472948">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Folder" typeId="tps4.1203598512427" id="1527228114010785692">
      <property name="excludes" nameId="tps4.1204107522064" value="" />
      <node role="entry" roleId="tps4.1203617897549" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="1527228114010785695">
        <link role="block" roleId="tps4.701559220729212648" targetNodeId="8431776905956472981" resolveInfo="platform.deprecated" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="1527228114010785696">
        <link role="block" roleId="tps4.701559220729212648" targetNodeId="8431776905956472985" resolveInfo="platform.ui" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="1527228114010785697">
        <link role="block" roleId="tps4.701559220729212648" targetNodeId="8431776905956472972" resolveInfo="platform.build" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="1527228114010785698">
        <link role="block" roleId="tps4.701559220729212648" targetNodeId="8431776905956472996" resolveInfo="platform.xml" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="1527228114010785699">
        <link role="block" roleId="tps4.701559220729212648" targetNodeId="8431776905956472964" resolveInfo="platform.baseLanguage" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.BlockReference" typeId="tps4.701559220729139189" id="1527228114010785700">
        <link role="block" roleId="tps4.701559220729212648" targetNodeId="1479728067424032862" resolveInfo="platform.editor" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785701">
        <property name="id" nameId="tps4.1222447189012" value="084f8779-0bb0-44bf-8a8b-1214d7acfbc5" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785702">
        <property name="id" nameId="tps4.1222447189012" value="26af8f6b-3531-46d0-8700-83a313e4566e" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785703">
        <property name="id" nameId="tps4.1222447189012" value="d4e445fa-e1ac-4fc8-8d3b-e62b05d0ea4c" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785704">
        <property name="id" nameId="tps4.1222447189012" value="99834b1c-2b28-4543-a97c-953df7633f72" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.ypath.runtime" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785705">
        <property name="id" nameId="tps4.1222447189012" value="4a1e4a24-105b-44ed-959c-6586fc957db3" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785706">
        <property name="id" nameId="tps4.1222447189012" value="d745e97c-8235-4470-b086-ba3da1f4c03c" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785707">
        <property name="id" nameId="tps4.1222447189012" value="8a97af52-a1ac-4297-b776-d35bf47ce8da" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.quickQuery.runtime" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785708">
        <property name="id" nameId="tps4.1222447189012" value="954c4d77-e24b-4e49-a5a5-5476c966c092" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785709">
        <property name="id" nameId="tps4.1222447189012" value="a83c3bd0-2f7e-4ba1-8373-12d49e99f57e" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785710">
        <property name="id" nameId="tps4.1222447189012" value="34f23130-e35c-4795-a45a-85d828b16016" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785711">
        <property name="id" nameId="tps4.1222447189012" value="97a52717-898f-4598-8150-573d9fd03868" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785713">
        <property name="id" nameId="tps4.1222447189012" value="cccc689c-f365-4862-a8b6-34ecddf8ee26" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785714">
        <property name="id" nameId="tps4.1222447189012" value="1991585e-225e-4371-977a-68a7888adae2" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785715">
        <property name="id" nameId="tps4.1222447189012" value="2ebbb458-8ebb-481e-a5d7-9e27903323d4" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785716">
        <property name="id" nameId="tps4.1222447189012" value="3304fc6e-7c6b-401e-a016-b944934bb21f" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785717">
        <property name="id" nameId="tps4.1222447189012" value="f43135f9-b833-4685-8d26-ffb6c8215f72" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785718">
        <property name="id" nameId="tps4.1222447189012" value="32d0a39c-772f-4490-8142-e50f9a9f19d4" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.platform.conf" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785719">
        <property name="id" nameId="tps4.1222447189012" value="3fe6ec39-7405-4314-abfd-5964c9c40e6b" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1527228114010785720">
        <property name="id" nameId="tps4.1222447189012" value="0452c5e6-046a-41b1-a1c2-bfa47ef3ae0b" />
      </node>
      <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="1527228114010785721">
        <property name="name" nameId="tps4.1223641503366" value="util" />
      </node>
    </node>
  </root>
  <root id="8431776905956472964">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472965">
      <property name="id" nameId="tps4.1222447189012" value="daafa647-f1f7-4b0b-b096-69cd7c8408c0" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="5606360948133591112">
      <property name="id" nameId="tps4.1222447189012" value="23949432-aaff-4c03-b7da-26e4e956ccea" />
      <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.baseLanguage.regexp.runtime" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472966">
      <property name="id" nameId="tps4.1222447189012" value="c23bca8e-629a-4cd7-84b4-411b6024469f" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472967">
      <property name="id" nameId="tps4.1222447189012" value="5dc5fc0d-37ef-4782-8192-8b5ce1f69f80" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472968">
      <property name="id" nameId="tps4.1222447189012" value="73736c50-f124-433b-b789-2828a15a0adc" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472969">
      <property name="id" nameId="tps4.1222447189012" value="c1b26490-e316-44a3-bb8e-c9120732af93" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472970">
      <property name="id" nameId="tps4.1222447189012" value="fc8d557e-5de6-4dd8-b749-aab2fb23aefc" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472971">
      <property name="id" nameId="tps4.1222447189012" value="0ae47ad3-5abd-486c-ac0f-298884f39393" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="4839974365908821404">
      <property name="id" nameId="tps4.1222447189012" value="132aa4d8-a3f7-441c-a7eb-3fce23492c6a" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="3646513537109043097">
      <property name="id" nameId="tps4.1222447189012" value="b98999bc-8369-4b20-9510-598d4eb5ace6" />
      <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.baseLanguage.math.runtime" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="3646513537109043099">
      <property name="id" nameId="tps4.1222447189012" value="4df1d09b-d6ae-453e-8622-14c0d6e4c038" />
      <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.baseLanguage.money.runtime" />
    </node>
  </root>
  <root id="8431776905956472972">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472973">
      <property name="id" nameId="tps4.1222447189012" value="0b608d44-1308-418d-8715-22d040c3b3cc" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472974">
      <property name="id" nameId="tps4.1222447189012" value="a79f53b6-9aaa-48eb-9fbb-aaec80a6da9a" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472976">
      <property name="id" nameId="tps4.1222447189012" value="02824ec0-c6a4-4517-a484-12d85172bbaa" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472977">
      <property name="id" nameId="tps4.1222447189012" value="fba399db-f591-45dc-a279-e2a2a986e262" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472978">
      <property name="id" nameId="tps4.1222447189012" value="4e6c5313-7662-4c44-9bc7-b488cec17508" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472979">
      <property name="id" nameId="tps4.1222447189012" value="500e32a4-ab9e-46a4-ae29-127ae883d208" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472980">
      <property name="id" nameId="tps4.1222447189012" value="dd61a7d7-8e1b-45a1-9aa3-8585ec2b60fc" />
    </node>
  </root>
  <root id="8431776905956472981">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472982">
      <property name="id" nameId="tps4.1222447189012" value="823d79c6-2e26-4b0e-92a0-e1884a10bba9" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472983">
      <property name="id" nameId="tps4.1222447189012" value="5d6bee4c-f891-4a93-a0c9-e2268726ae47" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472984">
      <property name="id" nameId="tps4.1222447189012" value="a20a42c8-ea20-45de-bc60-acb92cc25c46" />
    </node>
  </root>
  <root id="8431776905956472985">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Folder" typeId="tps4.1203598512427" id="8431776905956472986">
      <property name="excludes" nameId="tps4.1204107522064" value="" />
      <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="8431776905956472987">
        <property name="name" nameId="tps4.1223641503366" value="ui" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472988">
        <property name="id" nameId="tps4.1222447189012" value="fb26dccf-fa54-4e9a-8ddb-b66311a34393" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472989">
        <property name="id" nameId="tps4.1222447189012" value="8a448bd0-1380-4c01-9820-0f051d33888c" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472990">
        <property name="id" nameId="tps4.1222447189012" value="b648a171-98f9-494b-b822-c3147ae7d330" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472991">
        <property name="id" nameId="tps4.1222447189012" value="e5c2a44a-6085-4aeb-a5b6-851cecd2d926" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472992">
        <property name="id" nameId="tps4.1222447189012" value="51805413-e01e-4f51-bf62-a054ab51eb54" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472993">
        <property name="id" nameId="tps4.1222447189012" value="acc947bf-6778-444a-9dc7-4cc72d4eb3d0" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472994">
        <property name="id" nameId="tps4.1222447189012" value="71c80332-b17f-4f0a-be23-b5cba1d261f7" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472995">
        <property name="id" nameId="tps4.1222447189012" value="69934240-945d-492b-83e7-39bda70200e7" />
      </node>
    </node>
  </root>
  <root id="8431776905956472996">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472997">
      <property name="id" nameId="tps4.1222447189012" value="2c55c7ac-60c3-4eea-b9db-0d627bd2dcb9" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472998">
      <property name="id" nameId="tps4.1222447189012" value="a8fdde77-2e6c-41f6-ac79-8e9b6449c271" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956472999">
      <property name="id" nameId="tps4.1222447189012" value="64f62b28-36e3-4052-9f72-f616211ae615" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956473000">
      <property name="id" nameId="tps4.1222447189012" value="b51b9e02-45dc-4b48-b300-cf49360a8d1f" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8431776905956473001">
      <property name="id" nameId="tps4.1222447189012" value="f85adbd8-2ec2-4572-bcfc-8dd799a7f025" />
    </node>
  </root>
  <root id="7715871110555971738">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Jar" typeId="tps4.1203598417283" id="7715871110555971739">
      <property name="excludes" nameId="tps4.1204107522064" value="" />
      <node role="delete" roleId="tps4.1239622410040" type="tps4.Delete" typeId="tps4.1204122781510" id="7715871110555971740" />
      <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="7715871110555971741">
        <property name="name" nameId="tps4.1223641503366" value="mpsboot.jar" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="7715871110555971744">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="7715871110555971745">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="7715871110555971748">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="7715871110555971747">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="7715871110555971749">
              <property name="path" nameId="tps4.1220974398640" value="startup" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="7715871110555971751">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="1479728067424032862">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Folder" typeId="tps4.1203598512427" id="1479728067424032863">
      <property name="excludes" nameId="tps4.1204107522064" value="" />
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1479728067424032867">
        <property name="id" nameId="tps4.1222447189012" value="0272d3b4-4cc8-481e-9e2f-07793fbfcb41" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.lang.editor.table" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1479728067424032868">
        <property name="id" nameId="tps4.1222447189012" value="258bd2f6-0d02-411d-86b2-5a5ea083e6d2" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.lang.editor.table.runtime" />
      </node>
      <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="1479728067424032866">
        <property name="name" nameId="tps4.1223641503366" value="editor" />
      </node>
    </node>
  </root>
  <root id="5297918386943402887">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="7451905405776981199">
      <property name="id" nameId="tps4.1222447189012" value="af19274f-5f89-42dd-8f3c-c9932448f7f2" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="7451905405776981187">
      <property name="id" nameId="tps4.1222447189012" value="2af156ab-65c1-4a62-bd0d-ea734f71eab6" />
      <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.dataFlow.runtime" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="7451905405776981202">
      <property name="id" nameId="tps4.1222447189012" value="34e84b8f-afa8-4364-abcd-a279fddddbe7" />
      <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.editor.runtime" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="7451905405776981198">
      <property name="id" nameId="tps4.1222447189012" value="bfbdd672-7ff5-403f-af4f-16da5226f34c" />
      <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.findUsages.runtime" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="7451905405776981195">
      <property name="id" nameId="tps4.1222447189012" value="5fa23c0a-216d-4571-a163-e286643e6f5f" />
      <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.generator" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="5297918386943402892">
      <property name="id" nameId="tps4.1222447189012" value="019b622b-0aef-4dd3-86d0-4eef01f3f6bb" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="7451905405776927855">
      <property name="id" nameId="tps4.1222447189012" value="2d3c70e9-aab2-4870-8d8d-6036800e4103" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="7451905405776981191">
      <property name="id" nameId="tps4.1222447189012" value="c4f367dc-30c0-4376-9d05-1d1797bb8599" />
      <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.lang.pattern.runtime" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="8818360886175288935">
      <property name="id" nameId="tps4.1222447189012" value="707c4fde-f79a-44b5-b3d7-b5cef8844ccf" />
      <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.lang.test.runtime" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="7451905405776981192">
      <property name="id" nameId="tps4.1222447189012" value="a1250a4d-c090-42c3-ad7c-d298a3357dd4" />
      <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.make.runtime" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="1768998781380666465">
      <property name="id" nameId="tps4.1222447189012" value="20351dc3-a2df-46f5-b667-fc9adab1f1c9" />
      <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.make" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="7451905405776981204">
      <property name="id" nameId="tps4.1222447189012" value="40aea410-4b11-411f-9197-07da76ee0e82" />
      <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.plugin.runtime" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="7451905405776981207">
      <property name="id" nameId="tps4.1222447189012" value="8fe4c62a-2020-4ff4-8eda-f322a55bdc9f" />
      <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.refactoring.runtime" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="7451905405776981193">
      <property name="id" nameId="tps4.1222447189012" value="df9d410f-2ebb-43f7-893a-483a4f085250" />
      <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.smodel.resources" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="7451905405776927856">
      <property name="id" nameId="tps4.1222447189012" value="20c6e580-bdc5-4067-8049-d7e3265a86de" />
      <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.typesystemEngine" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="7451905405776981185">
      <property name="id" nameId="tps4.1222447189012" value="9b67baf0-e986-49af-b77c-998667f458cb" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="5297918386943402893">
      <property name="id" nameId="tps4.1222447189012" value="1c0088d4-c911-46d4-ace1-4500911173b5" />
      <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.workbench.make" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Module" typeId="tps4.1203599702327" id="7451905405776927857">
      <property name="id" nameId="tps4.1222447189012" value="b55d8dfc-0d9d-43d5-886d-c644e7083bff" />
      <property name="name" nameId="tpck.1169194664001" value="stubUtils" />
      <property name="doNotJar" nameId="tps4.2850282874221099799" value="true" />
    </node>
  </root>
  <root id="2738111162319948310">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Folder" typeId="tps4.1203598512427" id="2738111162319948320">
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="2738111162319948324">
        <property name="id" nameId="tps4.1222447189012" value="22e72e4c-0f69-46ce-8403-6750153aa615" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.runConfigurations" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="2738111162319948325">
        <property name="id" nameId="tps4.1222447189012" value="36c11d2d-1875-4a95-8bdb-70ea1ac63222" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.runConfigurations.runtime" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="2738111162319948326">
        <property name="id" nameId="tps4.1222447189012" value="04b376d5-fc16-403b-a344-c68b30193c6a" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.runConfigurations.util" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="2738111162319948327">
        <property name="id" nameId="tps4.1222447189012" value="f3347d8a-0e79-4f35-8ac9-1574f25c986f" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.run.commands" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="2738111162319948328">
        <property name="id" nameId="tps4.1222447189012" value="73c1a490-99fa-4d0d-8292-b8985697c74b" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.execution.common" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="2738111162319948329">
        <property name="id" nameId="tps4.1222447189012" value="756e911c-3f1f-4a48-bdf5-a2ceb91b723c" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.execution.settings" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="4666195181811172917">
        <property name="id" nameId="tps4.1222447189012" value="4caf0310-491e-41f5-8a9b-2006b3a94898" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.execution.util" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Module" typeId="tps4.1203599702327" id="1585405235656481880">
        <property name="id" nameId="tps4.1222447189012" value="5b247b59-8fd0-4475-a767-9e9ff6a9d01c" />
        <property name="name" nameId="tpck.1169194664001" value="jetbrains.mps.execution.lib.startup" />
      </node>
      <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2738111162319948323">
        <property name="name" nameId="tps4.1223641503366" value="execution" />
      </node>
    </node>
  </root>
  <root id="5358686142361317193">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Jar" typeId="tps4.1203598417283" id="5358686142361317195">
      <node role="delete" roleId="tps4.1239622410040" type="tps4.Delete" typeId="tps4.1204122781510" id="5358686142361317196" />
      <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="5358686142361317197">
        <property name="name" nameId="tps4.1223641503366" value="mpstest.jar" />
      </node>
      <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="5358686142361317205">
        <property name="name" nameId="tpck.1169194664001" value="" />
        <property name="excludes" nameId="tps4.1204107538752" value="" />
        <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="5358686142361317206">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="5358686142361317207">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="5358686142361317211">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="5358686142361317212">
              <property name="path" nameId="tps4.1220974398640" value="testbench" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="5358686142361317214">
              <property name="path" nameId="tps4.1220974398640" value="classes" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6108265972537541352">
    <node role="entry" roleId="tps4.701559220729212646" type="tps4.Branding" typeId="tps4.6108265972537166326" id="437343344535643867">
      <node role="buildNumber" roleId="tps4.6108265972537229337" type="tps4.VariableReference" typeId="tps4.1205339464939" id="437343344535644762">
        <link role="variable" roleId="tps4.1205339484191" targetNodeId="2235195415637077105" resolveInfo="build" />
      </node>
      <node role="icon32" roleId="tps4.6108265972537229338" type="tps4.Path" typeId="tps4.1220973916698" id="437343344535643869">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="437343344535644763">
          <property name="name" nameId="tps4.1220976068141" value="mps_home" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="437343344535643871">
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535644765">
            <property name="path" nameId="tps4.1220974398640" value="core" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535644767">
            <property name="path" nameId="tps4.1220974398640" value="kernel" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535644769">
            <property name="path" nameId="tps4.1220974398640" value="source" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662809">
            <property name="path" nameId="tps4.1220974398640" value="MPS_32.png" />
          </node>
        </node>
      </node>
      <node role="icon16" roleId="tps4.6108265972537229339" type="tps4.Path" typeId="tps4.1220973916698" id="437343344535643872">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="437343344535644764">
          <property name="name" nameId="tps4.1220976068141" value="mps_home" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="437343344535643874">
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662810">
            <property name="path" nameId="tps4.1220974398640" value="core" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662812">
            <property name="path" nameId="tps4.1220974398640" value="kernel" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662814">
            <property name="path" nameId="tps4.1220974398640" value="source" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662816">
            <property name="path" nameId="tps4.1220974398640" value="MPS_16.png" />
          </node>
        </node>
      </node>
      <node role="shortName" roleId="tps4.6108265972537372847" type="tps4.SimpleString" typeId="tps4.1205339044029" id="437343344535644752">
        <property name="name" nameId="tps4.1223641503366" value="MPS" />
      </node>
      <node role="fullName" roleId="tps4.6108265972537372848" type="tps4.CompositeString" typeId="tps4.1205342812422" id="437343344535644754">
        <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="437343344535644758">
          <node role="right" roleId="tps4.1205342834160" type="tps4.SimpleString" typeId="tps4.1205339044029" id="3690850548079628667">
            <property name="name" nameId="tps4.1223641503366" value="2.0.1" />
          </node>
          <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="437343344535981773">
            <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="437343344535981776" />
            <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="437343344535644757">
              <property name="name" nameId="tps4.1223641503366" value="MPS" />
            </node>
          </node>
        </node>
        <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="437343344535981769">
          <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="437343344535981772" />
          <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="437343344535644753">
            <property name="name" nameId="tps4.1223641503366" value="JetBrains" />
          </node>
        </node>
      </node>
      <node role="splashScreen" roleId="tps4.6108265972537182996" type="tps4.Path" typeId="tps4.1220973916698" id="437343344535662817">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="437343344535662820">
          <property name="name" nameId="tps4.1220976068141" value="mps_home" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="437343344535662819">
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662821">
            <property name="path" nameId="tps4.1220974398640" value="workbench" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662823">
            <property name="path" nameId="tps4.1220974398640" value="source" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662825">
            <property name="path" nameId="tps4.1220974398640" value="jetbrains" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662827">
            <property name="path" nameId="tps4.1220974398640" value="mps" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662829">
            <property name="path" nameId="tps4.1220974398640" value="workbench" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662831">
            <property name="path" nameId="tps4.1220974398640" value="icons" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662833">
            <property name="path" nameId="tps4.1220974398640" value="splash.png" />
          </node>
        </node>
      </node>
      <node role="aboutScreen" roleId="tps4.6108265972537182997" type="tps4.Path" typeId="tps4.1220973916698" id="437343344535662834">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="437343344535662837">
          <property name="name" nameId="tps4.1220976068141" value="mps_home" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="437343344535662836">
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662838">
            <property name="path" nameId="tps4.1220974398640" value="workbench" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662840">
            <property name="path" nameId="tps4.1220974398640" value="source" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662842">
            <property name="path" nameId="tps4.1220974398640" value="jetbrains" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662844">
            <property name="path" nameId="tps4.1220974398640" value="mps" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662846">
            <property name="path" nameId="tps4.1220974398640" value="workbench" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662848">
            <property name="path" nameId="tps4.1220974398640" value="icons" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662850">
            <property name="path" nameId="tps4.1220974398640" value="mpsAbout.png" />
          </node>
        </node>
      </node>
      <node role="welcomeScreen" roleId="tps4.6108265972537335222" type="tps4.WelcomeScreen" typeId="tps4.6108265972537229343" id="437343344535662851">
        <node role="caption" roleId="tps4.6108265972537229341" type="tps4.Path" typeId="tps4.1220973916698" id="437343344535662852">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="437343344535662858">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="437343344535662854">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662860">
              <property name="path" nameId="tps4.1220974398640" value="workbench" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662862">
              <property name="path" nameId="tps4.1220974398640" value="source" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662864">
              <property name="path" nameId="tps4.1220974398640" value="jetbrains" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662866">
              <property name="path" nameId="tps4.1220974398640" value="mps" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662868">
              <property name="path" nameId="tps4.1220974398640" value="workbench" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662870">
              <property name="path" nameId="tps4.1220974398640" value="icons" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662872">
              <property name="path" nameId="tps4.1220974398640" value="mpsWelcomeCaption.png" />
            </node>
          </node>
        </node>
        <node role="slogan" roleId="tps4.6108265972537229342" type="tps4.Path" typeId="tps4.1220973916698" id="437343344535662873">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="437343344535662874">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="437343344535662875">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662876">
              <property name="path" nameId="tps4.1220974398640" value="workbench" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662877">
              <property name="path" nameId="tps4.1220974398640" value="source" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662878">
              <property name="path" nameId="tps4.1220974398640" value="jetbrains" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662879">
              <property name="path" nameId="tps4.1220974398640" value="mps" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662880">
              <property name="path" nameId="tps4.1220974398640" value="workbench" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662881">
              <property name="path" nameId="tps4.1220974398640" value="icons" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="437343344535662883">
              <property name="path" nameId="tps4.1220974398640" value="mpsSlogan.png" />
            </node>
          </node>
        </node>
      </node>
      <node role="updateWebsite" roleId="tps4.6108265972537335245" type="tps4.UpdateWebsite" typeId="tps4.6108265972537335223" id="437343344535662885">
        <node role="checkUrl" roleId="tps4.6108265972537335224" type="tps4.SimpleString" typeId="tps4.1205339044029" id="437343344535662889">
          <property name="name" nameId="tps4.1223641503366" value="http://www.jetbrains.com/mps/update.xml" />
        </node>
        <node role="updateChannel" roleId="tps4.8795525031433091059" type="tps4.SimpleString" typeId="tps4.1205339044029" id="8795525031433494621">
          <property name="name" nameId="tps4.1223641503366" value="MPS20" />
        </node>
        <node role="updateUrl" roleId="tps4.6108265972537335225" type="tps4.SimpleString" typeId="tps4.1205339044029" id="1396036092323017797">
          <property name="name" nameId="tps4.1223641503366" value="http://www.jetbrains.com/mps/download/index.html" />
        </node>
      </node>
      <node role="help" roleId="tps4.437343344536486297" type="tps4.Help" typeId="tps4.437343344536486293" id="437343344536578822">
        <node role="url" roleId="tps4.437343344536486294" type="tps4.SimpleString" typeId="tps4.1205339044029" id="437343344536578828">
          <property name="name" nameId="tps4.1223641503366" value="http://www.jetbrains.com/mps/webhelp/" />
        </node>
        <node role="root" roleId="tps4.437343344536486295" type="tps4.SimpleString" typeId="tps4.1205339044029" id="437343344536578827">
          <property name="name" nameId="tps4.1223641503366" value="mps" />
        </node>
        <node role="file" roleId="tps4.437343344536486296" type="tps4.SimpleString" typeId="tps4.1205339044029" id="437343344536578826">
          <property name="name" nameId="tps4.1223641503366" value="mpshelp.jar" />
        </node>
      </node>
      <node role="textColor" roleId="tps4.8795525031433238889" type="tps4.SimpleString" typeId="tps4.1205339044029" id="8795525031433494620">
        <property name="name" nameId="tps4.1223641503366" value="002387" />
      </node>
    </node>
  </root>
</model>

