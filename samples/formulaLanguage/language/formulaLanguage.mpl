<?xml version="1.0" encoding="UTF-8"?>
<language namespace="jetbrains.mps.samples.formulaLanguage" uuid="b1a9bc47-8a26-4792-8b68-4660c531090a" generatorOutputPath="${language_descriptor}/source_gen" compileInMPS="true" doNotGenerateAdapters="false">
  <models>
    <modelRoot path="${language_descriptor}/languageModels" namespacePrefix="jetbrains.mps.samples.formulaLanguage" />
  </models>
  <accessoryModels />
  <generators>
    <generator generatorUID="jetbrains.mps.formulaLanguage#1130266266255" uuid="9e79e6dc-3005-4fdf-901d-d1d70047ef7b">
      <models>
        <modelRoot path="${language_descriptor}/generator" namespacePrefix="jetbrains.mps.samples.formulaLanguage.generator" />
      </models>
      <external-templates />
      <mapping-priorities />
    </generator>
  </generators>
  <sourcePath />
  <dependencies>
    <dependency reexport="true">daafa647-f1f7-4b0b-b096-69cd7c8408c0(jetbrains.mps.baseLanguage.regexp)</dependency>
  </dependencies>
  <usedLanguages>
    <usedLanguage>daafa647-f1f7-4b0b-b096-69cd7c8408c0(jetbrains.mps.baseLanguage.regexp)</usedLanguage>
  </usedLanguages>
  <usedDevKits>
    <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
  </usedDevKits>
  <runtime>
    <dependency reexport="true">191c9cb2-d1d4-4aae-aafa-a30eaf3192a6(jetbrains.mps.samples.formula.runtime)</dependency>
  </runtime>
  <extendedLanguages />
</language>

