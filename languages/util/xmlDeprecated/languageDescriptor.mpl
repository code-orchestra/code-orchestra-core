<?xml version="1.0" encoding="UTF-8"?>
<language namespace="jetbrains.mps.xml.deprecated" uuid="823d79c6-2e26-4b0e-92a0-e1884a10bba9" generatorOutputPath="${language_descriptor}/source_gen" compileInMPS="true" doNotGenerateAdapters="false">
  <models>
    <modelRoot path="${language_descriptor}/languageModels" namespacePrefix="jetbrains.mps.xml.deprecated" />
  </models>
  <accessoryModels />
  <generators>
    <generator name="void" generatorUID="jetbrains.mps.xml#1129923280838" uuid="648edee0-a74d-4997-b400-98c57131fd93">
      <models>
        <modelRoot path="${language_descriptor}/generator" namespacePrefix="jetbrains.mps.xml.deprecated.generator" />
      </models>
      <external-templates />
      <mapping-priorities />
    </generator>
  </generators>
  <usedDevKits>
    <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
  </usedDevKits>
  <runtime>
    <dependency reexport="false">2d3c70e9-aab2-4870-8d8d-6036800e4103(jetbrains.mps.kernel)</dependency>
  </runtime>
  <extendedLanguages>
    <extendedLanguage>ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)</extendedLanguage>
  </extendedLanguages>
</language>

