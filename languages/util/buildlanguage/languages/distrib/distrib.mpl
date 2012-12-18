<?xml version="1.0" encoding="UTF-8"?>
<language namespace="jetbrains.mps.build.distrib" uuid="02824ec0-c6a4-4517-a484-12d85172bbaa" generatorOutputPath="${language_descriptor}/source_gen" compileInMPS="true" doNotGenerateAdapters="false">
  <models>
    <modelRoot path="${language_descriptor}/languageAccessories" namespacePrefix="jetbrains.mps.build.distrib" />
    <modelRoot path="${language_descriptor}/languageModels" namespacePrefix="jetbrains.mps.build.distrib" />
  </models>
  <accessoryModels />
  <generators>
    <generator name="gtextGenerator" generatorUID="jetbrains.mps.build.distrib#1230058167282" uuid="87fb3934-638b-4bed-947e-b13049093817">
      <models>
        <modelRoot path="${language_descriptor}/generator/template" namespacePrefix="jetbrains.mps.build.distrib.generator.template" />
      </models>
      <external-templates>
        <generator generatorUID="ab777ef3-cd35-47a2-8db1-108b4d67986f(jetbrains.mps.build.packaging###1203014923802)" />
      </external-templates>
      <dependencies>
        <dependency reexport="false">a83c3bd0-2f7e-4ba1-8373-12d49e99f57e(jetbrains.mps.gtext)</dependency>
        <dependency reexport="false">a79f53b6-9aaa-48eb-9fbb-aaec80a6da9a(jetbrains.mps.build.custommps)</dependency>
      </dependencies>
      <usedLanguages>
        <usedLanguage>a83c3bd0-2f7e-4ba1-8373-12d49e99f57e(jetbrains.mps.gtext)</usedLanguage>
        <usedLanguage>823d79c6-2e26-4b0e-92a0-e1884a10bba9(jetbrains.mps.xml.deprecated)</usedLanguage>
        <usedLanguage>af65afd8-f0dd-4942-87d9-63a55f2a9db1(jetbrains.mps.lang.behavior)</usedLanguage>
        <usedLanguage>fba399db-f591-45dc-a279-e2a2a986e262(jetbrains.mps.build.generictasks)</usedLanguage>
        <usedLanguage>4a1e4a24-105b-44ed-959c-6586fc957db3(jetbrains.mps.bash)</usedLanguage>
      </usedLanguages>
      <usedDevKits>
        <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
      </usedDevKits>
      <mapping-priorities>
        <mapping-priority-rule kind="strictly_before">
          <greater-priority-mapping>
            <generator generatorUID="87fb3934-638b-4bed-947e-b13049093817(jetbrains.mps.build.distrib#1230058167282)" />
            <external-mapping>
              <mapping-node modelUID="r:77d362e8-0519-479e-a414-6d18b8d2c0d4(jetbrains.mps.build.distrib.generator.template.main@generator)" nodeID="*" />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="ab777ef3-cd35-47a2-8db1-108b4d67986f(jetbrains.mps.build.packaging###1203014923802)" />
            <external-mapping>
              <all-local-mappings />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
      </mapping-priorities>
    </generator>
  </generators>
  <dependencies>
    <dependency reexport="false">a83c3bd0-2f7e-4ba1-8373-12d49e99f57e(jetbrains.mps.gtext)</dependency>
  </dependencies>
  <usedLanguages>
    <usedLanguage>a83c3bd0-2f7e-4ba1-8373-12d49e99f57e(jetbrains.mps.gtext)</usedLanguage>
  </usedLanguages>
  <usedDevKits>
    <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
  </usedDevKits>
  <extendedLanguages>
    <extendedLanguage>4e6c5313-7662-4c44-9bc7-b488cec17508(jetbrains.mps.build.packaging)</extendedLanguage>
    <extendedLanguage>0b608d44-1308-418d-8715-22d040c3b3cc(jetbrains.mps.buildlanguage)</extendedLanguage>
  </extendedLanguages>
</language>

