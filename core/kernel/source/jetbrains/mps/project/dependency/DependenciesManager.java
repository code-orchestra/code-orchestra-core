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
package jetbrains.mps.project.dependency;

import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.util.List;
import java.util.Set;

public interface DependenciesManager {

  /*
   *  Transitive closure of all used langs + langs exported from used devkits and all langs being extended by those.
   */
  Set<Language> getAllUsedLanguages();

  /*
   *  Visible modules, respecting re-export dependencies & solutions exported from used devkits (
   */
  Set<IModule> getAllVisibleModules();

  /*
   *  All modules required for compilation (including languages with runtime stub paths)
   */
  Set<IModule> getAllRequiredModules();

  /*
  *  Only direct dependencies, required for compilation.
  */
  Set<IModule> getRequiredModules();

  /*
  *  Collects all visible modules (including current).
  */
  void collectVisibleModules(/* out */ Set<IModule> dependencies, boolean reexportOnly);

  /*
   *  Collects all modules required for compilation + languages with runtime stub paths
   */
  void collectAllCompileTimeDependencies(/* out */ Set<IModule> dependencies, /* out */ Set<Language> languagesWithRuntime);

}
