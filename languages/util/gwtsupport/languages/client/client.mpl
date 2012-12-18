<?xml version="1.0" encoding="UTF-8"?>
<language namespace="jetbrains.mps.gwt.client" uuid="954c4d77-e24b-4e49-a5a5-5476c966c092" compileInMPS="true" doNotGenerateAdapters="false">
  <models>
    <modelRoot path="${language_descriptor}/languageModels" namespacePrefix="jetbrains.mps.gwt.client" />
  </models>
  <accessoryModels />
  <generators>
    <generator name="xml" generatorUID="jetbrains.mps.gwt.client#1572321421814275034" uuid="486577d1-3c2e-499e-91d3-9bab36e681a9">
      <models>
        <modelRoot path="${language_descriptor}/generator/template" namespacePrefix="jetbrains.mps.gwt.client.generator.template" />
      </models>
      <external-templates>
        <generator generatorUID="94951427-301e-4a1c-a1cd-d2c6bc9f3cfa(jetbrains.mps.xml#1163716442262)" />
        <generator generatorUID="54e8601c-dee3-4b7a-94f7-5ee53b3f2dcb(jetbrains.mps.xmlInternal#1165632612566)" />
      </external-templates>
      <usedLanguages>
        <usedLanguage>f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)</usedLanguage>
        <usedLanguage>83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)</usedLanguage>
        <usedLanguage>954c4d77-e24b-4e49-a5a5-5476c966c092(jetbrains.mps.gwt.client)</usedLanguage>
        <usedLanguage>7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)</usedLanguage>
        <usedLanguage>2c55c7ac-60c3-4eea-b9db-0d627bd2dcb9(jetbrains.mps.xml)</usedLanguage>
        <usedLanguage>64f62b28-36e3-4052-9f72-f616211ae615(jetbrains.mps.xmlInternal)</usedLanguage>
      </usedLanguages>
      <usedDevKits>
        <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
      </usedDevKits>
      <mapping-priorities>
        <mapping-priority-rule kind="strictly_before">
          <greater-priority-mapping>
            <generator generatorUID="486577d1-3c2e-499e-91d3-9bab36e681a9(jetbrains.mps.gwt.client#1572321421814275034)" />
            <external-mapping>
              <all-local-mappings />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="486577d1-3c2e-499e-91d3-9bab36e681a9(jetbrains.mps.gwt.client#1572321421814275034)" />
            <external-mapping>
              <mapping-set>
                <mapping-set-element>
                  <generator generatorUID="94951427-301e-4a1c-a1cd-d2c6bc9f3cfa(jetbrains.mps.xml#1163716442262)" />
                  <external-mapping>
                    <all-local-mappings />
                  </external-mapping>
                </mapping-set-element>
                <mapping-set-element>
                  <generator generatorUID="54e8601c-dee3-4b7a-94f7-5ee53b3f2dcb(jetbrains.mps.xmlInternal#1165632612566)" />
                  <external-mapping>
                    <all-local-mappings />
                  </external-mapping>
                </mapping-set-element>
              </mapping-set>
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
        <mapping-priority-rule kind="strictly_before">
          <greater-priority-mapping>
            <generator generatorUID="486577d1-3c2e-499e-91d3-9bab36e681a9(jetbrains.mps.gwt.client#1572321421814275034)" />
            <external-mapping>
              <mapping-node modelUID="r:1662aa20-edf5-46c3-8002-c6d4c875fd31(jetbrains.mps.gwt.client.generator.template.main@generator)" nodeID="1220369573364066229" />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="486577d1-3c2e-499e-91d3-9bab36e681a9(jetbrains.mps.gwt.client#1572321421814275034)" />
            <external-mapping>
              <mapping-node modelUID="r:1662aa20-edf5-46c3-8002-c6d4c875fd31(jetbrains.mps.gwt.client.generator.template.main@generator)" nodeID="1572321421814275035" />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
      </mapping-priorities>
    </generator>
  </generators>
  <stubModelEntries>
    <stubModelEntry path="${language_descriptor}/redist/gwt-dev.jar">
      <manager moduleId="954c4d77-e24b-4e49-a5a5-5476c966c092" className="jetbrains.mps.gwt.client.stubs.GWTModuleStubs" />
    </stubModelEntry>
    <stubModelEntry path="${language_descriptor}/redist/gwt-user.jar">
      <manager moduleId="f3061a53-9226-4cc5-a443-f952ceaf5816" className="jetbrains.mps.baseLanguage.stubs.JavaStubs" />
    </stubModelEntry>
    <stubModelEntry path="${language_descriptor}/redist/gwt-user.jar">
      <manager moduleId="954c4d77-e24b-4e49-a5a5-5476c966c092" className="jetbrains.mps.gwt.client.stubs.GWTModuleStubs" />
    </stubModelEntry>
  </stubModelEntries>
  <dependencies>
    <dependency reexport="false">37a3367b-1fb2-44d8-aa6b-18075e74e003(MPS.Classpath)</dependency>
    <dependency reexport="false">f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)</dependency>
    <dependency reexport="false">b55d8dfc-0d9d-43d5-886d-c644e7083bff(stubUtils)</dependency>
  </dependencies>
  <usedLanguages>
    <usedLanguage>fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)</usedLanguage>
    <usedLanguage>83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)</usedLanguage>
    <usedLanguage>a247e09e-2435-45ba-b8d2-07e93feba96a(jetbrains.mps.baseLanguage.tuples)</usedLanguage>
  </usedLanguages>
  <usedDevKits>
    <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
  </usedDevKits>
  <extendedLanguages>
    <extendedLanguage>ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)</extendedLanguage>
  </extendedLanguages>
</language>

