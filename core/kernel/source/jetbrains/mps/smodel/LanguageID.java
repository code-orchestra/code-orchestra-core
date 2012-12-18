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

import jetbrains.mps.project.structure.model.ModelRootManager;

public class LanguageID {
  public static final String JAVA = "java";
  public static final String SWC = "swc";
  public static final String ASSET = "asset";

  // TODO move JavaStub -> core?
  public static final ModelRootManager JAVA_MANAGER = new ModelRootManager(BootstrapLanguages.BASE_LANGUAGE.getModuleId().toString(), "jetbrains.mps.baseLanguage.stubs.JavaStubs");

  // ActionScript stubs

  private static final String SWC_STUBS_MODULE_UUID = "d547343e-176a-45a2-8748-f7abfd850b86";
  private static final String SWC_STUBS_CLASS = "codeOrchestra.actionScript.core.stubs.SWCStubs";

  private static final String AS_STUBS_MODULE_UUID = "245456ae-b11f-4439-b991-ffed67bf9f97";
  private static final String AS_STUBS_CLASS = "codeOrchestra.actionScript.asstubs.stubs.ASSourceStubs";

  private static final String ASSETS_MODULE_UUID = "f8e34e2c-a7e4-43d2-ae57-c99a2499fa39";
  private static final String ASSETS_CLASS = "codeOrchestra.projectAssets.stubs.AssetsStub";

  public static final ModelRootManager SWC_MANAGER = new ModelRootManager(SWC_STUBS_MODULE_UUID, SWC_STUBS_CLASS);
  public static final ModelRootManager AS_MANAGER = new ModelRootManager(AS_STUBS_MODULE_UUID, AS_STUBS_CLASS);
  public static final ModelRootManager ASSETS_MANAGER = new ModelRootManager(ASSETS_MODULE_UUID, ASSETS_CLASS);

}
