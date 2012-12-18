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

import jetbrains.mps.project.IModule;

public class ModuleRepositoryAdapter implements ModuleRepositoryListener {
  public void moduleAdded(IModule module) {
    repositoryChanged();
  }

  public void beforeModuleRemoved(IModule module) {
  }

  public void moduleRemoved(IModule module) {
    repositoryChanged();
  }

  public void moduleInitialized(IModule module) {
    repositoryChanged();
  }

  public void moduleChanged(IModule module) {
    repositoryChanged();
  }

  @Override
  public void repositoryChanged() {
  }
}
