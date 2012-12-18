<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:7d73e2b1-54e0-4481-9616-2b4b627a22db(jetbrains.mps.platform.conf.sandbox.sandbox)" doNotGenerate="true">
  <persistence version="7" />
  <language namespace="32d0a39c-772f-4490-8142-e50f9a9f19d4(jetbrains.mps.platform.conf)" />
  <import index="2wu3" modelUID="f:conf_stub#cbcd3c3c-107b-4f03-8578-e11f87477262#META-INF(META-INF@conf_stub)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="cs0q" modelUID="r:d3304d29-cd93-4341-982d-9f0d1a8b40bf(jetbrains.mps.platform.conf.structure)" version="1" implicit="yes" />
  <roots>
    <node type="cs0q.ConfigurationXmlDocument" typeId="cs0q.5314521579133271086" id="1740160309778217800">
      <property name="name" nameId="tpck.1169194664001" value="foobar" />
    </node>
  </roots>
  <root id="1740160309778217800">
    <node role="root" roleId="cs0q.7130790807395857418" type="cs0q.Plugin" typeId="cs0q.6536266708345244486" id="7208030699524859782">
      <property name="name" nameId="tpck.1169194664001" value="NNNNN" />
      <node role="depends" roleId="cs0q.6536266708345244499" type="cs0q.PluginDependency" typeId="cs0q.6536266708345244487" id="6191093908411707946">
        <link role="plugin" roleId="cs0q.6536266708345244489" targetNodeId="2wu3.4455495789557343236" resolveInfo="IDEA CORE" />
      </node>
      <node role="fragment" roleId="cs0q.1740160309778170996" type="cs0q.Actions" typeId="cs0q.4383174161801812099" id="5246455451713223851" />
      <node role="fragment" roleId="cs0q.1740160309778170996" type="cs0q.ExtensionPoints" typeId="cs0q.7130790807395857422" id="5246455451713223852" />
      <node role="fragment" roleId="cs0q.1740160309778170996" type="cs0q.Extensions" typeId="cs0q.1740160309778208723" id="5246455451713223854">
        <node role="fragment" roleId="cs0q.1740160309778170996" type="cs0q.BeanExtension" typeId="cs0q.6121364846593763655" id="5246455451713229103">
          <link role="extensionPoint" roleId="cs0q.6121364846593763607" targetNodeId="2wu3.~extensionPoint$referenceProviderType" resolveInfo="referenceProviderType" />
        </node>
      </node>
      <node role="fragment" roleId="cs0q.1740160309778170996" type="cs0q.ConfigurationXmlNode" typeId="cs0q.5066720069350533029" id="5246455451713265878" />
      <node role="fragment" roleId="cs0q.1740160309778170996" type="cs0q.Actions" typeId="cs0q.4383174161801812099" id="7208030699524859783">
        <node role="fragment" roleId="cs0q.1740160309778170996" type="cs0q.Group" typeId="cs0q.4383174161802026701" id="8087864013722247578">
          <property name="id" nameId="cs0q.4383174161802026699" value="sdsad" />
        </node>
        <node role="fragment" roleId="cs0q.1740160309778170996" type="cs0q.Group" typeId="cs0q.4383174161802026701" id="8087864013722247576">
          <property name="id" nameId="cs0q.4383174161802026699" value="eqq" />
        </node>
        <node role="fragment" roleId="cs0q.1740160309778170996" type="cs0q.Group" typeId="cs0q.4383174161802026701" id="4146194781600412277">
          <property name="id" nameId="cs0q.4383174161802026699" value="343434" />
          <node role="actionItem" roleId="cs0q.8605160448688984317" type="cs0q.Separator" typeId="cs0q.8605160448688984324" id="3886786302241755448" />
          <node role="actionItem" roleId="cs0q.8605160448688984317" type="cs0q.ActionReference" typeId="cs0q.4383174161802026707" id="4146194781600604415">
            <link role="action" roleId="cs0q.4383174161802026708" targetNodeId="4146194781600412277" />
          </node>
          <node role="actionItem" roleId="cs0q.8605160448688984317" type="cs0q.ActionReference" typeId="cs0q.4383174161802026707" id="4146194781600611065">
            <link role="action" roleId="cs0q.4383174161802026708" targetNodeId="7208030699524868312" />
          </node>
          <node role="actionItem" roleId="cs0q.8605160448688984317" type="cs0q.ActionReference" typeId="cs0q.4383174161802026707" id="4146194781600611067">
            <link role="action" roleId="cs0q.4383174161802026708" targetNodeId="4146194781600412277" />
          </node>
          <node role="actionItem" roleId="cs0q.8605160448688984317" type="cs0q.ActionReference" typeId="cs0q.4383174161802026707" id="4146194781600611063">
            <link role="action" roleId="cs0q.4383174161802026708" targetNodeId="4146194781600412277" />
          </node>
          <node role="addToGroup" roleId="cs0q.8605160448688984311" type="cs0q.GroupReference" typeId="cs0q.4383174161802026705" id="8087864013722247579">
            <link role="group" roleId="cs0q.4383174161802026706" targetNodeId="8087864013722247578" resolveInfo="group$sdsad" />
          </node>
        </node>
        <node role="fragment" roleId="cs0q.1740160309778170996" type="cs0q.Group" typeId="cs0q.4383174161802026701" id="3886786302241703521">
          <node role="addToGroup" roleId="cs0q.8605160448688984311" type="cs0q.GroupReference" typeId="cs0q.4383174161802026705" id="8841589787282318385" />
          <node role="addToGroup" roleId="cs0q.8605160448688984311" type="cs0q.GroupReference" typeId="cs0q.4383174161802026705" id="8841589787282318386" />
        </node>
        <node role="fragment" roleId="cs0q.1740160309778170996" type="cs0q.Action" typeId="cs0q.8605160448688984307" id="3886786302241428374" />
        <node role="fragment" roleId="cs0q.1740160309778170996" type="cs0q.Action" typeId="cs0q.8605160448688984307" id="7208030699524868312">
          <property name="id" nameId="cs0q.4383174161802026699" value="adasdas" />
          <node role="shortcut" roleId="cs0q.8605160448688984308" type="cs0q.KeyboardShortcut" typeId="cs0q.4383174161802016298" id="7208030699524902450">
            <property name="keymap" nameId="cs0q.4383174161802016296" value="asd" />
          </node>
          <node role="addToGroup" roleId="cs0q.8605160448688984311" type="cs0q.GroupReference" typeId="cs0q.4383174161802026705" id="5158603367164230888">
            <property name="position" nameId="cs0q.8605160448689289382" value="before" />
          </node>
        </node>
      </node>
      <node role="fragment" roleId="cs0q.1740160309778170996" type="cs0q.ConfigurationXmlNode" typeId="cs0q.5066720069350533029" id="3886786302241755558" />
      <node role="vendor" roleId="cs0q.6536266708345244498" type="cs0q.PluginVendor" typeId="cs0q.6536266708345244494" id="6191093908411707942">
        <property name="name" nameId="tpck.1169194664001" value="asd" />
      </node>
      <node role="helpset" roleId="cs0q.6536266708345477912" type="cs0q.PluginHelpset" typeId="cs0q.6536266708345477909" id="6191093908411707944" />
      <node role="ideaVersion" roleId="cs0q.6536266708345477901" type="cs0q.IdeaVersion" typeId="cs0q.6536266708345477897" id="6191093908411707949" />
    </node>
  </root>
</model>

