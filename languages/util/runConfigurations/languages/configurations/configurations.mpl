<?xml version="1.0" encoding="UTF-8"?>
<language namespace="jetbrains.mps.execution.configurations" uuid="22e72e4c-0f69-46ce-8403-6750153aa615" compileInMPS="true" doNotGenerateAdapters="false">
  <models>
    <modelRoot path="${language_descriptor}/languageModels" namespacePrefix="jetbrains.mps.execution.configurations" />
  </models>
  <accessoryModels />
  <generators>
    <generator name="" generatorUID="jetbrains.mps.execution.configurations#3754890006475631525" uuid="d84d74f3-ca7f-48ba-ab57-d22a60cad837">
      <models>
        <modelRoot path="${language_descriptor}/generator/template" namespacePrefix="jetbrains.mps.execution.configurations.generator.template" />
      </models>
      <external-templates>
        <generator generatorUID="0e7466c6-bdd9-48a0-921b-a0f4bac08259(jetbrains.mps.baseLanguage.classifiers#1205839057922)" />
        <generator generatorUID="5f9babc9-8d5d-4825-8e61-17b241ee6272(jetbrains.mps.baseLanguage.collections#1151699677197)" />
        <generator generatorUID="c31fc437-4bfb-4447-bafe-2aa77860610e(jetbrains.mps.execution.commands#856705193941426438)" />
        <generator generatorUID="d05c4356-e6a8-4dcf-a81a-3adf36be3c35(jetbrains.mps.execution.settings#946964771156035778)" />
        <generator generatorUID="1d6e05d7-9de9-40a7-9dad-7b8444280942(jetbrains.mps.lang.plugin#1203080439937)" />
      </external-templates>
      <dependencies>
        <dependency reexport="false">6354ebe7-c22a-4a0f-ac54-50b52ab9b065(JDK)</dependency>
        <dependency reexport="false">37a3367b-1fb2-44d8-aa6b-18075e74e003(MPS.Classpath)</dependency>
        <dependency reexport="false">36c11d2d-1875-4a95-8bdb-70ea1ac63222(jetbrains.mps.execution.api)</dependency>
        <dependency reexport="false">73c1a490-99fa-4d0d-8292-b8985697c74b(jetbrains.mps.execution.common)</dependency>
        <dependency reexport="false">756e911c-3f1f-4a48-bdf5-a2ceb91b723c(jetbrains.mps.execution.settings)</dependency>
        <dependency reexport="false">d05c4356-e6a8-4dcf-a81a-3adf36be3c35(jetbrains.mps.execution.settings#946964771156035778)</dependency>
        <dependency reexport="false">1d6e05d7-9de9-40a7-9dad-7b8444280942(jetbrains.mps.lang.plugin#1203080439937)</dependency>
      </dependencies>
      <usedLanguages>
        <usedLanguage>83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)</usedLanguage>
        <usedLanguage>760a0a8c-eabb-4521-8bfd-65db761a9ba3(jetbrains.mps.baseLanguage.logging)</usedLanguage>
        <usedLanguage>22e72e4c-0f69-46ce-8403-6750153aa615(jetbrains.mps.execution.configurations)</usedLanguage>
        <usedLanguage>13744753-c81f-424a-9c1b-cf8943bf4e86(jetbrains.mps.lang.sharedConcepts)</usedLanguage>
        <usedLanguage>7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)</usedLanguage>
        <usedLanguage>51805413-e01e-4f51-bf62-a054ab51eb54(jetbrains.mps.ui.swing)</usedLanguage>
      </usedLanguages>
      <usedDevKits>
        <usedDevKit>fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)</usedDevKit>
      </usedDevKits>
      <mapping-priorities>
        <mapping-priority-rule kind="strictly_before">
          <greater-priority-mapping>
            <generator generatorUID="d84d74f3-ca7f-48ba-ab57-d22a60cad837(jetbrains.mps.execution.configurations#3754890006475631525)" />
            <external-mapping>
              <mapping-node modelUID="r:d91dc8be-68f3-42d9-b558-87a2756c080a(jetbrains.mps.execution.configurations.generator.template.main@generator)" nodeID="*" />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="5f9babc9-8d5d-4825-8e61-17b241ee6272(jetbrains.mps.baseLanguage.collections#1151699677197)" />
            <external-mapping>
              <all-local-mappings />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
        <mapping-priority-rule kind="strictly_before">
          <greater-priority-mapping>
            <generator generatorUID="d84d74f3-ca7f-48ba-ab57-d22a60cad837(jetbrains.mps.execution.configurations#3754890006475631525)" />
            <external-mapping>
              <mapping-node modelUID="r:d91dc8be-68f3-42d9-b558-87a2756c080a(jetbrains.mps.execution.configurations.generator.template.main@generator)" nodeID="*" />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="1d6e05d7-9de9-40a7-9dad-7b8444280942(jetbrains.mps.lang.plugin#1203080439937)" />
            <external-mapping>
              <mapping-node modelUID="r:00000000-0000-4000-0000-011c89590369(jetbrains.mps.lang.plugin.generator.baseLanguage.template.main@generator)" nodeID="1215266411913" />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
        <mapping-priority-rule kind="strictly_together">
          <greater-priority-mapping>
            <generator generatorUID="d84d74f3-ca7f-48ba-ab57-d22a60cad837(jetbrains.mps.execution.configurations#3754890006475631525)" />
            <external-mapping>
              <mapping-node modelUID="r:d91dc8be-68f3-42d9-b558-87a2756c080a(jetbrains.mps.execution.configurations.generator.template.main@generator)" nodeID="*" />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="0e7466c6-bdd9-48a0-921b-a0f4bac08259(jetbrains.mps.baseLanguage.classifiers#1205839057922)" />
            <external-mapping>
              <all-local-mappings />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
        <mapping-priority-rule kind="strictly_together">
          <greater-priority-mapping>
            <generator generatorUID="d84d74f3-ca7f-48ba-ab57-d22a60cad837(jetbrains.mps.execution.configurations#3754890006475631525)" />
            <external-mapping>
              <mapping-node modelUID="r:d91dc8be-68f3-42d9-b558-87a2756c080a(jetbrains.mps.execution.configurations.generator.template.main@generator)" nodeID="*" />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="d05c4356-e6a8-4dcf-a81a-3adf36be3c35(jetbrains.mps.execution.settings#946964771156035778)" />
            <external-mapping>
              <all-local-mappings />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
        <mapping-priority-rule kind="strictly_before">
          <greater-priority-mapping>
            <generator generatorUID="d84d74f3-ca7f-48ba-ab57-d22a60cad837(jetbrains.mps.execution.configurations#3754890006475631525)" />
            <external-mapping>
              <mapping-node modelUID="r:2a0121e0-959c-434f-b621-0b4c60f1f305(jetbrains.mps.execution.configurations.generator.template.preprocess@generator)" nodeID="*" />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="d84d74f3-ca7f-48ba-ab57-d22a60cad837(jetbrains.mps.execution.configurations#3754890006475631525)" />
            <external-mapping>
              <mapping-node modelUID="r:d91dc8be-68f3-42d9-b558-87a2756c080a(jetbrains.mps.execution.configurations.generator.template.main@generator)" nodeID="*" />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
        <mapping-priority-rule kind="strictly_before">
          <greater-priority-mapping>
            <generator generatorUID="d84d74f3-ca7f-48ba-ab57-d22a60cad837(jetbrains.mps.execution.configurations#3754890006475631525)" />
            <external-mapping>
              <mapping-node modelUID="r:2a0121e0-959c-434f-b621-0b4c60f1f305(jetbrains.mps.execution.configurations.generator.template.preprocess@generator)" nodeID="*" />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="d05c4356-e6a8-4dcf-a81a-3adf36be3c35(jetbrains.mps.execution.settings#946964771156035778)" />
            <external-mapping>
              <all-local-mappings />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
      </mapping-priorities>
    </generator>
  </generators>
  <dependencies>
    <dependency reexport="false">73c1a490-99fa-4d0d-8292-b8985697c74b(jetbrains.mps.execution.common)</dependency>
    <dependency reexport="false">756e911c-3f1f-4a48-bdf5-a2ceb91b723c(jetbrains.mps.execution.settings)</dependency>
    <dependency reexport="false">28f9e497-3b42-4291-aeba-0a1039153ab1(jetbrains.mps.lang.plugin)</dependency>
  </dependencies>
  <usedLanguages>
    <usedLanguage>ed6d7656-532c-4bc2-81d1-af945aeb8280(jetbrains.mps.baseLanguage.blTypes)</usedLanguage>
    <usedLanguage>774bf8a0-62e5-41e1-af63-f4812e60e48b(jetbrains.mps.baseLanguage.checkedDots)</usedLanguage>
    <usedLanguage>daafa647-f1f7-4b0b-b096-69cd7c8408c0(jetbrains.mps.baseLanguage.regexp)</usedLanguage>
    <usedLanguage>fbc14279-5e2a-4c87-a5d1-5f7061e6c456(jetbrains.mps.debug.apiLang)</usedLanguage>
    <usedLanguage>f3347d8a-0e79-4f35-8ac9-1574f25c986f(jetbrains.mps.execution.commands)</usedLanguage>
    <usedLanguage>22e72e4c-0f69-46ce-8403-6750153aa615(jetbrains.mps.execution.configurations)</usedLanguage>
    <usedLanguage>756e911c-3f1f-4a48-bdf5-a2ceb91b723c(jetbrains.mps.execution.settings)</usedLanguage>
    <usedLanguage>13744753-c81f-424a-9c1b-cf8943bf4e86(jetbrains.mps.lang.sharedConcepts)</usedLanguage>
    <usedLanguage>f3347d8a-0e79-4f35-8ac9-1574f25c986f(jetbrains.mps.execution.commands)</usedLanguage>
    <usedLanguage>22e72e4c-0f69-46ce-8403-6750153aa615(jetbrains.mps.execution.configurations)</usedLanguage>
  </usedLanguages>
  <usedDevKits>
    <usedDevKit>fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)</usedDevKit>
    <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
  </usedDevKits>
  <extendedLanguages>
    <extendedLanguage>f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)</extendedLanguage>
    <extendedLanguage>443f4c36-fcf5-4eb6-9500-8d06ed259e3e(jetbrains.mps.baseLanguage.classifiers)</extendedLanguage>
    <extendedLanguage>fbc14279-5e2a-4c87-a5d1-5f7061e6c456(jetbrains.mps.debug.apiLang)</extendedLanguage>
    <extendedLanguage>f3347d8a-0e79-4f35-8ac9-1574f25c986f(jetbrains.mps.execution.commands)</extendedLanguage>
    <extendedLanguage>73c1a490-99fa-4d0d-8292-b8985697c74b(jetbrains.mps.execution.common)</extendedLanguage>
    <extendedLanguage>756e911c-3f1f-4a48-bdf5-a2ceb91b723c(jetbrains.mps.execution.settings)</extendedLanguage>
  </extendedLanguages>
</language>

