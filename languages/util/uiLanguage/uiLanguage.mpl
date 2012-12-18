<?xml version="1.0" encoding="UTF-8"?>
<language namespace="jetbrains.mps.uiLanguage" uuid="5d6bee4c-f891-4a93-a0c9-e2268726ae47" compileInMPS="true" doNotGenerateAdapters="false">
  <models>
    <modelRoot path="${language_descriptor}/languageModels" namespacePrefix="jetbrains.mps.uiLanguage" />
  </models>
  <accessoryModels>
    <model modelUID="r:00000000-0000-4000-0000-011c8959054d(jetbrains.mps.uiLanguage.components)" />
  </accessoryModels>
  <generators>
    <generator generatorUID="jetbrains.mps.uiLanguage#1202393863737" uuid="d1415f93-6c9c-4200-81f9-9205ed57131a">
      <models>
        <modelRoot path="${language_descriptor}/generator/baseLanguage/template" namespacePrefix="jetbrains.mps.uiLanguage.generator.baseLanguage.template" />
      </models>
      <external-templates>
        <generator generatorUID="0e7466c6-bdd9-48a0-921b-a0f4bac08259(jetbrains.mps.baseLanguage.classifiers#1205839057922)" />
        <generator generatorUID="5f9babc9-8d5d-4825-8e61-17b241ee6272(jetbrains.mps.baseLanguage.collections#1151699677197)" />
      </external-templates>
      <dependencies>
        <dependency reexport="false">f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)</dependency>
        <dependency reexport="false">df345b11-b8c7-4213-ac66-48d2a9b75d88(jetbrains.mps.baseLanguageInternal)</dependency>
      </dependencies>
      <usedLanguages>
        <usedLanguage>df345b11-b8c7-4213-ac66-48d2a9b75d88(jetbrains.mps.baseLanguageInternal)</usedLanguage>
      </usedLanguages>
      <mapping-priorities>
        <mapping-priority-rule kind="strictly_before">
          <greater-priority-mapping>
            <generator generatorUID="d1415f93-6c9c-4200-81f9-9205ed57131a(jetbrains.mps.uiLanguage#1202393863737)" />
            <external-mapping>
              <mapping-node modelUID="r:00000000-0000-4000-0000-011c89590555(jetbrains.mps.uiLanguage.generator.baseLanguage.template.form@generator)" nodeID="*" />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="d1415f93-6c9c-4200-81f9-9205ed57131a(jetbrains.mps.uiLanguage#1202393863737)" />
            <external-mapping>
              <mapping-node modelUID="r:00000000-0000-4000-0000-011c89590557(jetbrains.mps.uiLanguage.generator.baseLanguage.template.main@generator)" nodeID="1202393865414" />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
        <mapping-priority-rule kind="strictly_before">
          <greater-priority-mapping>
            <generator generatorUID="d1415f93-6c9c-4200-81f9-9205ed57131a(jetbrains.mps.uiLanguage#1202393863737)" />
            <external-mapping>
              <mapping-node modelUID="r:00000000-0000-4000-0000-011c89590556(jetbrains.mps.uiLanguage.generator.baseLanguage.template.grid@generator)" nodeID="*" />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="d1415f93-6c9c-4200-81f9-9205ed57131a(jetbrains.mps.uiLanguage#1202393863737)" />
            <external-mapping>
              <mapping-node modelUID="r:00000000-0000-4000-0000-011c89590557(jetbrains.mps.uiLanguage.generator.baseLanguage.template.main@generator)" nodeID="1202393865414" />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
        <mapping-priority-rule kind="strictly_before">
          <greater-priority-mapping>
            <generator generatorUID="d1415f93-6c9c-4200-81f9-9205ed57131a(jetbrains.mps.uiLanguage#1202393863737)" />
            <external-mapping>
              <mapping-node modelUID="r:00000000-0000-4000-0000-011c89590554(jetbrains.mps.uiLanguage.generator.baseLanguage.template.dialog@generator)" nodeID="*" />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="d1415f93-6c9c-4200-81f9-9205ed57131a(jetbrains.mps.uiLanguage#1202393863737)" />
            <external-mapping>
              <mapping-node modelUID="r:00000000-0000-4000-0000-011c89590557(jetbrains.mps.uiLanguage.generator.baseLanguage.template.main@generator)" nodeID="1202393865414" />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
        <mapping-priority-rule kind="strictly_together">
          <greater-priority-mapping>
            <generator generatorUID="d1415f93-6c9c-4200-81f9-9205ed57131a(jetbrains.mps.uiLanguage#1202393863737)" />
            <external-mapping>
              <mapping-node modelUID="r:00000000-0000-4000-0000-011c89590557(jetbrains.mps.uiLanguage.generator.baseLanguage.template.main@generator)" nodeID="1202393865414" />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="d1415f93-6c9c-4200-81f9-9205ed57131a(jetbrains.mps.uiLanguage#1202393863737)" />
            <external-mapping>
              <mapping-node modelUID="r:00000000-0000-4000-0000-011c89590557(jetbrains.mps.uiLanguage.generator.baseLanguage.template.main@generator)" nodeID="1208105628414" />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
        <mapping-priority-rule kind="strictly_before">
          <greater-priority-mapping>
            <generator generatorUID="d1415f93-6c9c-4200-81f9-9205ed57131a(jetbrains.mps.uiLanguage#1202393863737)" />
            <external-mapping>
              <all-local-mappings />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="5f9babc9-8d5d-4825-8e61-17b241ee6272(jetbrains.mps.baseLanguage.collections#1151699677197)" />
            <external-mapping>
              <all-local-mappings />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
      </mapping-priorities>
    </generator>
  </generators>
  <stubModelEntries>
    <stubModelEntry path="${mps_home}/lib/beansbinding-1.2.1.jar">
      <manager moduleId="f3061a53-9226-4cc5-a443-f952ceaf5816" className="jetbrains.mps.baseLanguage.stubs.JavaStubs" />
    </stubModelEntry>
  </stubModelEntries>
  <runtimeStubModels>
    <stubModelEntry path="${language_descriptor}/runtime/classes">
      <manager moduleId="f3061a53-9226-4cc5-a443-f952ceaf5816" className="jetbrains.mps.baseLanguage.stubs.JavaStubs" />
    </stubModelEntry>
    <stubModelEntry path="${mps_home}/lib/beansbinding-1.2.1.jar">
      <manager moduleId="f3061a53-9226-4cc5-a443-f952ceaf5816" className="jetbrains.mps.baseLanguage.stubs.JavaStubs" />
    </stubModelEntry>
  </runtimeStubModels>
  <dependencies>
    <dependency reexport="false">6354ebe7-c22a-4a0f-ac54-50b52ab9b065(JDK)</dependency>
    <dependency reexport="true">37a3367b-1fb2-44d8-aa6b-18075e74e003(MPS.Classpath)</dependency>
    <dependency reexport="false">a0c108f0-1637-416e-a249-3effbaa4c998(jetbrains.mps.baseLanguage.search)</dependency>
    <dependency reexport="true">ceb47609-02c2-4927-bb6d-d58368388a62(jetbrains.mps.ide.uiLanguage.runtime)</dependency>
  </dependencies>
  <usedLanguages>
    <usedLanguage>df345b11-b8c7-4213-ac66-48d2a9b75d88(jetbrains.mps.baseLanguageInternal)</usedLanguage>
  </usedLanguages>
  <usedDevKits>
    <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
  </usedDevKits>
  <runtime>
    <dependency reexport="true">37a3367b-1fb2-44d8-aa6b-18075e74e003(MPS.Classpath)</dependency>
    <dependency reexport="true">ceb47609-02c2-4927-bb6d-d58368388a62(jetbrains.mps.ide.uiLanguage.runtime)</dependency>
  </runtime>
  <extendedLanguages>
    <extendedLanguage>f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)</extendedLanguage>
    <extendedLanguage>443f4c36-fcf5-4eb6-9500-8d06ed259e3e(jetbrains.mps.baseLanguage.classifiers)</extendedLanguage>
    <extendedLanguage>83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)</extendedLanguage>
  </extendedLanguages>
</language>

