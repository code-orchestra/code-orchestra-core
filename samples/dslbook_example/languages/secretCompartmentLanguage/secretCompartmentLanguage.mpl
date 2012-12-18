<?xml version="1.0" encoding="UTF-8"?>
<language namespace="jetbrains.mps.samples.secretCompartmentLanguage" uuid="6986543d-8218-4ebf-a2e9-565e5049c1ce" compileInMPS="true" doNotGenerateAdapters="false">
  <models>
    <modelRoot path="${language_descriptor}/languageModels" namespacePrefix="jetbrains.mps.samples.secretCompartmentLanguage" />
  </models>
  <accessoryModels />
  <generators>
    <generator generatorUID="secretCompartmentLanguage#1197167152697" uuid="b77e1ec6-a025-4317-a254-45c93d6d6fbb">
      <models>
        <modelRoot path="${language_descriptor}/generator/baseLanguage/template" namespacePrefix="jetbrains.mps.samples.secretCompartmentLanguage.generator.baseLanguage.template" />
      </models>
      <external-templates />
      <dependencies>
        <dependency reexport="true">f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)</dependency>
        <dependency reexport="true">f61473f9-130f-42f6-b98d-6c438812c2f6(jetbrains.mps.baseLanguage.unitTest)</dependency>
      </dependencies>
      <usedLanguages>
        <usedLanguage>f61473f9-130f-42f6-b98d-6c438812c2f6(jetbrains.mps.baseLanguage.unitTest)</usedLanguage>
      </usedLanguages>
      <mapping-priorities />
    </generator>
  </generators>
  <usedDevKits>
    <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
  </usedDevKits>
  <runtime>
    <dependency reexport="false">086f6299-eca0-43c4-bbca-fab3f95963aa(jetbrains.mps.samples.secretCompartment.runtime)</dependency>
  </runtime>
  <extendedLanguages>
    <extendedLanguage>f61473f9-130f-42f6-b98d-6c438812c2f6(jetbrains.mps.baseLanguage.unitTest)</extendedLanguage>
  </extendedLanguages>
</language>

