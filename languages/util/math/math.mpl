<?xml version="1.0" encoding="UTF-8"?>
<language namespace="jetbrains.mps.baseLanguage.math" uuid="3304fc6e-7c6b-401e-a016-b944934bb21f" compileInMPS="true" doNotGenerateAdapters="false">
  <models>
    <modelRoot path="${language_descriptor}/languageAccessories" namespacePrefix="jetbrains.mps.baseLanguage.math" />
    <modelRoot path="${language_descriptor}/languageModels" namespacePrefix="jetbrains.mps.baseLanguage.math" />
  </models>
  <accessoryModels />
  <generators>
    <generator name="" generatorUID="jetbrains.mps.baseLanguage.math#1235731725718" uuid="a4f54010-f543-4c3d-a263-da72012ed5d5">
      <models>
        <modelRoot path="${language_descriptor}/generator/template" namespacePrefix="jetbrains.mps.baseLanguage.math.generator.template" />
      </models>
      <external-templates>
        <generator generatorUID="857d0a79-6f44-4f46-84ed-9c5b42632011(jetbrains.mps.baseLanguage.closures#1199623535494)" />
        <generator generatorUID="5f9babc9-8d5d-4825-8e61-17b241ee6272(jetbrains.mps.baseLanguage.collections#1151699677197)" />
      </external-templates>
      <dependencies>
        <dependency reexport="false">985c8c6a-64b4-486d-a91e-7d4112742556(jetbrains.mps.baseLanguage#1129914002933)</dependency>
      </dependencies>
      <usedLanguages>
        <usedLanguage>fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)</usedLanguage>
        <usedLanguage>b401a680-8325-4110-8fd3-84331ff25bef(jetbrains.mps.lang.generator)</usedLanguage>
      </usedLanguages>
      <usedDevKits>
        <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
      </usedDevKits>
      <mapping-priorities>
        <mapping-priority-rule kind="strictly_before">
          <greater-priority-mapping>
            <generator generatorUID="a4f54010-f543-4c3d-a263-da72012ed5d5(jetbrains.mps.baseLanguage.math#1235731725718)" />
            <external-mapping>
              <mapping-set>
                <mapping-set-element>
                  <mapping-node modelUID="r:44a13e0a-5741-450e-b617-f6a7b8d52ba5(jetbrains.mps.baseLanguage.math.generator.template.types@generator)" nodeID="*" />
                </mapping-set-element>
                <mapping-set-element>
                  <mapping-node modelUID="r:85be6a23-8e6d-4452-b81d-2513e76e45bd(jetbrains.mps.baseLanguage.math.generator.template.intervals@generator)" nodeID="*" />
                </mapping-set-element>
              </mapping-set>
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="a4f54010-f543-4c3d-a263-da72012ed5d5(jetbrains.mps.baseLanguage.math#1235731725718)" />
            <external-mapping>
              <mapping-set>
                <mapping-set-element>
                  <generator generatorUID="857d0a79-6f44-4f46-84ed-9c5b42632011(jetbrains.mps.baseLanguage.closures#1199623535494)" />
                  <external-mapping>
                    <mapping-node modelUID="r:00000000-0000-4000-0000-011c8959033a(jetbrains.mps.baseLanguage.closures.generator.baseLanguage.template.main@generator)" nodeID="*" />
                  </external-mapping>
                </mapping-set-element>
                <mapping-set-element>
                  <generator generatorUID="5f9babc9-8d5d-4825-8e61-17b241ee6272(jetbrains.mps.baseLanguage.collections#1151699677197)" />
                  <external-mapping>
                    <mapping-node modelUID="r:00000000-0000-4000-0000-011c8959032f(jetbrains.mps.baseLanguage.collections.generator.baseLanguage.template.main@generator)" nodeID="*" />
                  </external-mapping>
                </mapping-set-element>
              </mapping-set>
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
        <mapping-priority-rule kind="strictly_before">
          <greater-priority-mapping>
            <generator generatorUID="a4f54010-f543-4c3d-a263-da72012ed5d5(jetbrains.mps.baseLanguage.math#1235731725718)" />
            <external-mapping>
              <mapping-set>
                <mapping-set-element>
                  <mapping-node modelUID="r:85be6a23-8e6d-4452-b81d-2513e76e45bd(jetbrains.mps.baseLanguage.math.generator.template.intervals@generator)" nodeID="*" />
                </mapping-set-element>
                <mapping-set-element>
                  <mapping-node modelUID="r:e8891659-6cf7-4c12-aefc-c30d28622ede(jetbrains.mps.baseLanguage.math.generator.template.operations@generator)" nodeID="*" />
                </mapping-set-element>
              </mapping-set>
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="a4f54010-f543-4c3d-a263-da72012ed5d5(jetbrains.mps.baseLanguage.math#1235731725718)" />
            <external-mapping>
              <mapping-node modelUID="r:44a13e0a-5741-450e-b617-f6a7b8d52ba5(jetbrains.mps.baseLanguage.math.generator.template.types@generator)" nodeID="*" />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
        <mapping-priority-rule kind="strictly_before">
          <greater-priority-mapping>
            <generator generatorUID="a4f54010-f543-4c3d-a263-da72012ed5d5(jetbrains.mps.baseLanguage.math#1235731725718)" />
            <external-mapping>
              <mapping-node modelUID="r:44a13e0a-5741-450e-b617-f6a7b8d52ba5(jetbrains.mps.baseLanguage.math.generator.template.types@generator)" nodeID="1237546393303" />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="a4f54010-f543-4c3d-a263-da72012ed5d5(jetbrains.mps.baseLanguage.math#1235731725718)" />
            <external-mapping>
              <mapping-node modelUID="r:44a13e0a-5741-450e-b617-f6a7b8d52ba5(jetbrains.mps.baseLanguage.math.generator.template.types@generator)" nodeID="1237208627073" />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
        <mapping-priority-rule kind="strictly_before">
          <greater-priority-mapping>
            <generator generatorUID="a4f54010-f543-4c3d-a263-da72012ed5d5(jetbrains.mps.baseLanguage.math#1235731725718)" />
            <external-mapping>
              <mapping-node modelUID="r:44a13e0a-5741-450e-b617-f6a7b8d52ba5(jetbrains.mps.baseLanguage.math.generator.template.types@generator)" nodeID="1238330267976" />
            </external-mapping>
          </greater-priority-mapping>
          <lesser-priority-mapping>
            <generator generatorUID="a4f54010-f543-4c3d-a263-da72012ed5d5(jetbrains.mps.baseLanguage.math#1235731725718)" />
            <external-mapping>
              <mapping-node modelUID="r:44a13e0a-5741-450e-b617-f6a7b8d52ba5(jetbrains.mps.baseLanguage.math.generator.template.types@generator)" nodeID="1237546393303" />
            </external-mapping>
          </lesser-priority-mapping>
        </mapping-priority-rule>
      </mapping-priorities>
    </generator>
  </generators>
  <dependencies>
    <dependency reexport="false">b98999bc-8369-4b20-9510-598d4eb5ace6(jetbrains.mps.baseLanguage.math.runtime)</dependency>
  </dependencies>
  <usedLanguages>
    <usedLanguage>f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)</usedLanguage>
    <usedLanguage>18bc6592-03a6-4e29-a83a-7ff23bde13ba(jetbrains.mps.lang.editor)</usedLanguage>
  </usedLanguages>
  <usedDevKits>
    <usedDevKit>2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)</usedDevKit>
  </usedDevKits>
  <runtime>
    <dependency reexport="false">b98999bc-8369-4b20-9510-598d4eb5ace6(jetbrains.mps.baseLanguage.math.runtime)</dependency>
  </runtime>
  <extendedLanguages>
    <extendedLanguage>f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)</extendedLanguage>
    <extendedLanguage>fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)</extendedLanguage>
    <extendedLanguage>83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)</extendedLanguage>
  </extendedLanguages>
</language>

