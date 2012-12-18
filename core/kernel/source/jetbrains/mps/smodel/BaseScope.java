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

import jetbrains.mps.project.structure.modules.ModuleReference;

public abstract class BaseScope implements IScope {
  public final SModelDescriptor getModelDescriptor(SModelFqName fqName) {
    return getModelDescriptor(new SModelReference(fqName, null));
  }

  public final Language getLanguage(String fqName) {
    return getLanguage(new ModuleReference(fqName));
  }

  public Iterable<SModelDescriptor> getOwnModelDescriptors() {
    return getModelDescriptors();
  }
}
