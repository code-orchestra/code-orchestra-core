<?xml version="1.0" encoding="UTF-8"?>
<solution name="jetbrains.mps.baseLanguage.dates.runtime" uuid="2ebbb458-8ebb-481e-a5d7-9e27903323d4" compileInMPS="true">
  <models>
    <modelRoot path="${solution_descriptor}/" namespacePrefix="" />
  </models>
  <stubModelEntries>
    <stubModelEntry path="${solution_descriptor}/lib/joda-time-1.6.jar">
      <manager moduleId="f3061a53-9226-4cc5-a443-f952ceaf5816" className="jetbrains.mps.baseLanguage.stubs.JavaStubs" />
    </stubModelEntry>
  </stubModelEntries>
  <dependencies>
    <dependency reexport="false">2ebbb458-8ebb-481e-a5d7-9e27903323d4(jetbrains.mps.baseLanguage.dates.runtime)</dependency>
    <dependency reexport="false">6354ebe7-c22a-4a0f-ac54-50b52ab9b065(JDK)</dependency>
  </dependencies>
  <usedLanguages>
    <usedLanguage>f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)</usedLanguage>
    <usedLanguage>cccc689c-f365-4862-a8b6-34ecddf8ee26(jetbrains.mps.baseLanguage.dates)</usedLanguage>
    <usedLanguage>fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)</usedLanguage>
  </usedLanguages>
</solution>

