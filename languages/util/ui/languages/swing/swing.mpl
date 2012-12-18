<?xml version="1.0" encoding="UTF-8"?>
<language namespace="jetbrains.mps.ui.swing" uuid="51805413-e01e-4f51-bf62-a054ab51eb54" compileInMPS="true" doNotGenerateAdapters="false">
  <models>
    <modelRoot path="${language_descriptor}/languageAccessories" namespacePrefix="jetbrains.mps.ui.swing" />
    <modelRoot path="${language_descriptor}/languageModels" namespacePrefix="jetbrains.mps.ui.swing" />
  </models>
  <accessoryModels>
    <model modelUID="r:e8762dad-daad-468e-8f14-8910b1a06775(jetbrains.mps.ui.swing.events)" />
    <model modelUID="r:22d98723-5ac5-4775-a416-434d71d737ed(jetbrains.mps.ui.swing.widgets)" />
  </accessoryModels>
  <generators>
    <generator name="ui" generatorUID="jetbrains.mps.ui.swing#5725024602606914374" uuid="feb13c42-6479-4631-bedd-7524f34b91c0">
      <models>
        <modelRoot path="${language_descriptor}/generator/template" namespacePrefix="jetbrains.mps.ui.swing.generator.template" />
      </models>
      <external-templates>
        <generator generatorUID="da5e4290-fe8f-4051-99eb-423e4107c1b4(jetbrains.mps.ui#5725024602606565468)" />
      </external-templates>
      <dependencies>
        <dependency reexport="false">da5e4290-fe8f-4051-99eb-423e4107c1b4(jetbrains.mps.ui#5725024602606565468)</dependency>
        <dependency reexport="false">a5a5d5ab-3987-4848-9421-998f92430773(jetbrains.mps.ui.gwt#9106854556042091019)</dependency>
        <dependency reexport="false">8a448bd0-1380-4c01-9820-0f051d33888c(jetbrains.mps.ui.modeling)</dependency>
      </dependencies>
      <usedLanguages>
        <usedLanguage>f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)</usedLanguage>
        <usedLanguage>5dc5fc0d-37ef-4782-8192-8b5ce1f69f80(jetbrains.mps.baseLanguage.extensionMethods)</usedLanguage>
        <usedLanguage>8a448bd0-1380-4c01-9820-0f051d33888c(jetbrains.mps.ui.modeling)</usedLanguage>
      </usedLanguages>
      <usedDevKits>
        <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
      </usedDevKits>
      <mapping-priorities>
        <mapping-priority-rule kind="strictly_together">
          <greater-priority-mapping>
            <generator generatorUID="feb13c42-6479-4631-bedd-7524f34b91c0(jetbrains.mps.ui.swing#5725024602606914374)" />
            <external-mapping>
              <mapping-node modelUID="r:32537826-1146-4f8d-92f2-d34a6c6f2706(jetbrains.mps.ui.swing.generator.template.main@generator)" nodeID="5725024602606933015" />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="da5e4290-fe8f-4051-99eb-423e4107c1b4(jetbrains.mps.ui#5725024602606565468)" />
            <external-mapping>
              <mapping-set>
                <mapping-set-element>
                  <mapping-node modelUID="r:7fdb3fe3-1923-41bc-947f-2eaffc319dea(jetbrains.mps.ui.generator.template.main@generator)" nodeID="*" />
                </mapping-set-element>
                <mapping-set-element>
                  <mapping-node modelUID="r:39023b18-af4f-44db-bcb1-c118a59086cd(jetbrains.mps.ui.generator.template.meta@generator)" nodeID="*" />
                </mapping-set-element>
              </mapping-set>
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
        <mapping-priority-rule kind="strictly_before">
          <greater-priority-mapping>
            <generator generatorUID="feb13c42-6479-4631-bedd-7524f34b91c0(jetbrains.mps.ui.swing#5725024602606914374)" />
            <external-mapping>
              <mapping-node modelUID="r:32537826-1146-4f8d-92f2-d34a6c6f2706(jetbrains.mps.ui.swing.generator.template.main@generator)" nodeID="5725024602606933015" />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="feb13c42-6479-4631-bedd-7524f34b91c0(jetbrains.mps.ui.swing#5725024602606914374)" />
            <external-mapping>
              <mapping-node modelUID="r:32537826-1146-4f8d-92f2-d34a6c6f2706(jetbrains.mps.ui.swing.generator.template.main@generator)" nodeID="873604604378927023" />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
        <mapping-priority-rule kind="strictly_before">
          <greater-priority-mapping>
            <generator generatorUID="feb13c42-6479-4631-bedd-7524f34b91c0(jetbrains.mps.ui.swing#5725024602606914374)" />
            <external-mapping>
              <mapping-node modelUID="r:32537826-1146-4f8d-92f2-d34a6c6f2706(jetbrains.mps.ui.swing.generator.template.main@generator)" nodeID="873604604378927023" />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="da5e4290-fe8f-4051-99eb-423e4107c1b4(jetbrains.mps.ui#5725024602606565468)" />
            <external-mapping>
              <mapping-node modelUID="r:0c4bfdbb-e20d-4270-a9e7-42e358fb6809(jetbrains.mps.ui.generator.template.cleanup@generator)" nodeID="*" />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
      </mapping-priorities>
    </generator>
  </generators>
  <sourcePath />
  <dependencies>
    <dependency reexport="false">feb13c42-6479-4631-bedd-7524f34b91c0(jetbrains.mps.ui.swing#5725024602606914374)</dependency>
    <dependency reexport="false">acc947bf-6778-444a-9dc7-4cc72d4eb3d0(jetbrains.mps.ui.swing.runtime)</dependency>
    <dependency reexport="false">28f9e497-3b42-4291-aeba-0a1039153ab1(jetbrains.mps.lang.plugin)</dependency>
  </dependencies>
  <usedLanguages>
    <usedLanguage>443f4c36-fcf5-4eb6-9500-8d06ed259e3e(jetbrains.mps.baseLanguage.classifiers)</usedLanguage>
    <usedLanguage>8a448bd0-1380-4c01-9820-0f051d33888c(jetbrains.mps.ui.modeling)</usedLanguage>
  </usedLanguages>
  <usedDevKits>
    <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
  </usedDevKits>
  <runtime>
    <dependency reexport="false">acc947bf-6778-444a-9dc7-4cc72d4eb3d0(jetbrains.mps.ui.swing.runtime)</dependency>
  </runtime>
  <extendedLanguages>
    <extendedLanguage>fb26dccf-fa54-4e9a-8ddb-b66311a34393(jetbrains.mps.ui)</extendedLanguage>
  </extendedLanguages>
</language>

