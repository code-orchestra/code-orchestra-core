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
package jetbrains.mps.migration20;

import jetbrains.mps.migration20.stages.*;

public enum MState {
  INITIAL(null),
  PERSISTENCE_UPGRADE(new PersistenceUpgradeStage()),
  LANGUAGES_DEPS_CORRECTION(new DependenciesCorrectionStage()),
  STUBS_CONVERSION(new StubConversionStage()),
  BROKEN_REFS_FIX(new BrokenRefsFixStage()),
  OPTIMIZE_IMPORTS(new OptimizeImportsStage()),
  LANGUAGES_MIGRATION(new LanguageMigrationStage()),
  REGENERATION(new RegenerationStage()),
  DONE(null);

  private MigrationStage myStage;

  MState(MigrationStage stage) {
    myStage = stage;
  }

  public MigrationStage getStage() {
    return myStage;
  }
}
