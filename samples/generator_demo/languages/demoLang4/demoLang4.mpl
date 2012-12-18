<?xml version="1.0" encoding="UTF-8"?>
<language namespace="jetbrains.mps.samples.generator_demo.demoLang4" uuid="1409a436-ea24-4d03-a196-53795139ce8d" compileInMPS="true" doNotGenerateAdapters="false">
  <models>
    <modelRoot path="${language_descriptor}/languageModels" namespacePrefix="jetbrains.mps.samples.generator_demo.demoLang4" />
    <modelRoot path="${language_descriptor}/languageAccessories" namespacePrefix="jetbrains.mps.samples.generator_demo.demoLang4" />
  </models>
  <accessoryModels />
  <generators>
    <generator name="swing" generatorUID="jetbrains.mps.samples.generator_demo.demoLang4#1228678587345" uuid="fba3f122-376d-47a5-9857-db3c00612598">
      <models>
        <modelRoot path="${language_descriptor}/generator/template" namespacePrefix="jetbrains.mps.samples.generator_demo.demoLang4.generator.template" />
      </models>
      <external-templates />
      <dependencies>
        <dependency reexport="false">772f6dcd-8c0d-48f7-869c-908e036f7c8e(jetbrains.mps.sampleXML)</dependency>
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

