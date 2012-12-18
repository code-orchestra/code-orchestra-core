<?xml version="1.0" encoding="UTF-8"?>
<solution name="jetbrains.mps.platform.conf.sandbox" uuid="cbcd3c3c-107b-4f03-8578-e11f87477262" compileInMPS="true">
  <models>
    <modelRoot path="${solution_descriptor}/" namespacePrefix="" />
  </models>
  <stubModelEntries>
    <stubModelEntry path="${mps_home}/core/kernel/source">
      <manager moduleId="32d0a39c-772f-4490-8142-e50f9a9f19d4" className="jetbrains.mps.platform.conf.stubs.ConfStubs" />
    </stubModelEntry>
    <stubModelEntry path="${mps_home}/lib/platform.jar">
      <manager moduleId="32d0a39c-772f-4490-8142-e50f9a9f19d4" className="jetbrains.mps.platform.conf.stubs.ConfStubs" />
    </stubModelEntry>
    <stubModelEntry path="${mps_home}/lib/resources.jar">
      <manager moduleId="32d0a39c-772f-4490-8142-e50f9a9f19d4" className="jetbrains.mps.platform.conf.stubs.ConfStubs" />
    </stubModelEntry>
  </stubModelEntries>
  <dependencies>
    <dependency reexport="false">cbcd3c3c-107b-4f03-8578-e11f87477262(jetbrains.mps.platform.conf.sandbox)</dependency>
  </dependencies>
  <usedLanguages>
    <usedLanguage>32d0a39c-772f-4490-8142-e50f9a9f19d4(jetbrains.mps.platform.conf)</usedLanguage>
  </usedLanguages>
</solution>

