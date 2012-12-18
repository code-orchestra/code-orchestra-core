<?xml version="1.0" encoding="UTF-8"?>
<language namespace="jetbrains.mps.sampleXML" uuid="772f6dcd-8c0d-48f7-869c-908e036f7c8e" generatorOutputPath="${language_descriptor}/source_gen" compileInMPS="true" doNotGenerateAdapters="false">
  <models>
    <modelRoot path="${language_descriptor}/languageAccessories" namespacePrefix="jetbrains.mps.sampleXML" />
    <modelRoot path="${language_descriptor}/languageModels" namespacePrefix="jetbrains.mps.sampleXML" />
  </models>
  <accessoryModels />
  <generators>
    <generator name="empty" generatorUID="jetbrains.mps.sampleXML#1225240266472" uuid="0541f836-6605-43e5-8e71-9d5f3e3ed485">
      <models>
        <modelRoot path="${language_descriptor}/generator/template" namespacePrefix="jetbrains.mps.sampleXML.generator.template" />
      </models>
      <external-templates />
      <usedDevKits>
        <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
      </usedDevKits>
      <mapping-priorities />
    </generator>
  </generators>
  <sourcePath />
  <dependencies>
    <dependency reexport="false">37a3367b-1fb2-44d8-aa6b-18075e74e003(MPS.Classpath)</dependency>
  </dependencies>
  <usedDevKits>
    <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
  </usedDevKits>
  <runtime>
    <dependency reexport="false">37a3367b-1fb2-44d8-aa6b-18075e74e003(MPS.Classpath)</dependency>
  </runtime>
  <extendedLanguages />
</language>

