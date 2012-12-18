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
package jetbrains.mps.project.validation;

import jetbrains.mps.generator.TransientModelsModule;
import jetbrains.mps.project.DevKit;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Library;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.ProjectStructureModule;
import jetbrains.mps.smodel.Generator;
import jetbrains.mps.smodel.Language;

public class ModuleValidatorFactory {
  public static ModuleValidator createValidator(IModule m) {
    if (m instanceof TransientModelsModule) {
      return new EmptyValidator();
    } else if (m instanceof Language) {
      return new LanguageValidator((Language) m);
    } else if (m instanceof Generator) {
      return new GeneratorValidator((Generator) m);
    } else if (m instanceof Solution) {
      return new SolutionValidator((Solution) m);
    } else if (m instanceof DevKit) {
      return new DevkitValidator((DevKit) m);
    } else if (m instanceof ProjectStructureModule) {
      return new EmptyValidator();
    } else if (m instanceof Library) {
      return new EmptyValidator();
    } else {
      throw new IllegalArgumentException("Unknown module for validation: " + m.getClass());
    }
  }
}
