<?xml version="1.0" encoding="UTF-8"?>
<language namespace="jetbrains.mps.samples.generator_demo.demoLang3" uuid="7a4dedfe-9c99-4610-b299-d4a37832823b" compileInMPS="true" doNotGenerateAdapters="false">
  <models>
    <modelRoot path="${language_descriptor}/languageModels" namespacePrefix="jetbrains.mps.samples.generator_demo.demoLang3" />
    <modelRoot path="${language_descriptor}/languageAccessories" namespacePrefix="jetbrains.mps.samples.generator_demo.demoLang3" />
  </models>
  <accessoryModels />
  <generators>
    <generator name="swing" generatorUID="jetbrains.mps.samples.generator_demo.demoLang3#1228529645905" uuid="501bdcdb-b428-41e5-a3c0-8062725ab158">
      <models>
        <modelRoot path="${language_descriptor}/generator/template" namespacePrefix="jetbrains.mps.samples.generator_demo.demoLang3.generator.template" />
      </models>
      <external-templates />
      <dependencies>
        <dependency reexport="false">f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)</dependency>
      </dependencies>
      <usedDevKits>
        <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
      </usedDevKits>
      <mapping-priorities />
    </generator>
  </generators>
  <sourcePath />
  <usedDevKits>
    <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
  </usedDevKits>
  <extendedLanguages>
    <extendedLanguage>772f6dcd-8c0d-48f7-869c-908e036f7c8e(jetbrains.mps.sampleXML)</extendedLanguage>
  </extendedLanguages>
</language>

