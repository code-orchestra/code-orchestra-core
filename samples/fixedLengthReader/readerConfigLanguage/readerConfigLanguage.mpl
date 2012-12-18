<?xml version="1.0" encoding="UTF-8"?>
<language namespace="jetbrains.mps.samples.readerConfigLanguage" uuid="089e26c5-bfc3-4a60-9953-f68169a4608a" compileInMPS="true" doNotGenerateAdapters="false">
  <models>
    <modelRoot path="${language_descriptor}/languageModels" namespacePrefix="jetbrains.mps.samples.readerConfigLanguage" />
  </models>
  <accessoryModels />
  <generators>
    <generator generatorUID="readerConfigLanguage#1129923280150" uuid="5b79f56d-c904-49ad-93b5-e535ce9a83fc">
      <models>
        <modelRoot path="${language_descriptor}/generator/baseLanguage" namespacePrefix="jetbrains.mps.samples.readerConfigLanguage.generator.baseLanguage" />
      </models>
      <external-templates />
      <dependencies>
        <dependency reexport="false">2d3c70e9-aab2-4870-8d8d-6036800e4103(jetbrains.mps.kernel)</dependency>
        <dependency reexport="false">f4f64bcd-8732-4771-be32-6b92ca717f39(readerFramework)</dependency>
        <dependency reexport="false">f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)</dependency>
      </dependencies>
      <mapping-priorities />
    </generator>
    <generator generatorUID="readerConfigLanguage#1129923281152" uuid="ffb71f3a-317f-4241-a93c-321d713ebf82">
      <models>
        <modelRoot path="${language_descriptor}/generator/xml" namespacePrefix="jetbrains.mps.samples.readerConfigLanguage.generator.xml" />
      </models>
      <external-templates />
      <dependencies>
        <dependency reexport="false">823d79c6-2e26-4b0e-92a0-e1884a10bba9(jetbrains.mps.xml.deprecated)</dependency>
      </dependencies>
      <usedLanguages>
        <usedLanguage>823d79c6-2e26-4b0e-92a0-e1884a10bba9(jetbrains.mps.xml.deprecated)</usedLanguage>
      </usedLanguages>
      <mapping-priorities />
    </generator>
  </generators>
  <sourcePath />
  <usedDevKits>
    <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
  </usedDevKits>
  <runtime>
    <dependency reexport="false">f4f64bcd-8732-4771-be32-6b92ca717f39(readerFramework)</dependency>
  </runtime>
  <extendedLanguages>
    <extendedLanguage>823d79c6-2e26-4b0e-92a0-e1884a10bba9(jetbrains.mps.xml.deprecated)</extendedLanguage>
  </extendedLanguages>
</language>

