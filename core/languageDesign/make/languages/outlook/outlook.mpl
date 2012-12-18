<?xml version="1.0" encoding="UTF-8"?>
<language namespace="jetbrains.mps.make.outlook" uuid="dc54e1b2-86b3-49d2-9014-a76af17af22a" compileInMPS="true" doNotGenerateAdapters="false">
  <models>
    <modelRoot path="${language_descriptor}/languageModels" namespacePrefix="jetbrains.mps.make.outlook" />
  </models>
  <accessoryModels />
  <generators>
    <generator name="java" generatorUID="jetbrains.mps.make.outlook#5608160002100106841" uuid="f2324f12-b66e-4ff0-82da-267897cc06d8">
      <models>
        <modelRoot path="${language_descriptor}/generator/template" namespacePrefix="jetbrains.mps.make.outlook.generator.template" />
      </models>
      <external-templates>
        <generator generatorUID="3349c57b-62f9-4ce2-a22d-d9bd99edc6a6(jetbrains.mps.make.facet#5086995156117116954)" />
      </external-templates>
      <dependencies>
        <dependency reexport="false">a1250a4d-c090-42c3-ad7c-d298a3357dd4(jetbrains.mps.make.runtime)</dependency>
      </dependencies>
      <usedDevKits>
        <usedDevKit>e073aac8-8c71-4c23-be71-86bf7a6df0a2(jetbrains.mps.devkit.bootstrap-languages)</usedDevKit>
      </usedDevKits>
      <mapping-priorities>
        <mapping-priority-rule kind="strictly_together">
          <greater-priority-mapping>
            <generator generatorUID="f2324f12-b66e-4ff0-82da-267897cc06d8(jetbrains.mps.make.outlook#5608160002100106841)" />
            <external-mapping>
              <all-local-mappings />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="3349c57b-62f9-4ce2-a22d-d9bd99edc6a6(jetbrains.mps.make.facet#5086995156117116954)" />
            <external-mapping>
              <all-local-mappings />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
      </mapping-priorities>
    </generator>
  </generators>
  <usedDevKits>
    <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
    <usedDevKit>fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)</usedDevKit>
  </usedDevKits>
  <extendedLanguages>
    <extendedLanguage>696c1165-4a59-463b-bc5d-902caab85dd0(jetbrains.mps.make.facet)</extendedLanguage>
  </extendedLanguages>
</language>

