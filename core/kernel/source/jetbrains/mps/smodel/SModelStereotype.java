/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.smodel;

import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;

/**
 * Igor Alshannikov
 * Jul 20, 2005
 */
public class SModelStereotype {
  @Deprecated
  public static final String TEMPLATES = "templates";
  @Deprecated
  public static final String JAVA_STUB = "java_stub";
  @CodeOrchestraPatch
  public static final String SWC_STUB = "swc_stub";

  //------

  public static final String STUB_SUFFIX = "_stub";

  //------

  public static final String NONE = "";
  public static final String GENERATOR = "generator";
  public static final String TESTS = "tests";
  public static final String DESCRIPTOR = "descriptor";
  public static final String GENERATED_MODEL = "generatedModel";
  public static final String INTERNAL_COPY = "internal_copy";
  public static final String INTERNAL = "$internal$";

  //------

  public static final String[] values = new String[]{NONE, GENERATOR, TESTS};

  public static boolean isUserModel(@NotNull SModel model) {
    return isUserModelStereotype(model.getStereotype());
  }

  public static boolean isUserModel(@NotNull SModelDescriptor model) {
    return isUserModelStereotype(model.getStereotype());
  }

  private static boolean isUserModelStereotype(String stereotype) {
    return NONE.equals(stereotype) || GENERATOR.equals(stereotype) || TEMPLATES.equals(stereotype)
      || TESTS.equals(stereotype) || DESCRIPTOR.equals(stereotype);
  }

  public static boolean isGeneratorModel(SModel model) {
    return isGeneratorModelStereotype(model.getStereotype());
  }

  public static boolean isGeneratorModel(SModelDescriptor model) {
    return isGeneratorModelStereotype(model.getStereotype());
  }

  public static boolean isTestModelStereotype(String stereotype) {
    return TESTS.equals(stereotype);
  }

  public static boolean isTestModel(SModelDescriptor model) {
    return isTestModelStereotype(model.getStereotype());
  }

  public static boolean isTestModel(SModel model) {
    return isTestModelStereotype(model.getStereotype());
  }

  public static boolean isStubModelStereotype(String stereotype) {
    return stereotype.endsWith(STUB_SUFFIX);
  }

  public static String getStubStereotypeForId(String languageId) {
    return languageId + STUB_SUFFIX;
  }

  private static boolean isGeneratorModelStereotype(String stereotype) {
    return GENERATOR.equals(stereotype) || TEMPLATES.equals(stereotype);
  }
}
