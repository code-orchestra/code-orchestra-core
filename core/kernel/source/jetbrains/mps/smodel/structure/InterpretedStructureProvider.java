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
package jetbrains.mps.smodel.structure;

import jetbrains.mps.smodel.LanguageHierarchyCache;

import java.util.List;
import java.util.Set;

public class InterpretedStructureProvider extends DescriptorProvider<StructureDescriptor> {
  @Override
  public StructureDescriptor getDescriptor(String fqName) {
    return new InterpretedStructure(fqName);
  }

  private static class InterpretedStructure extends StructureDescriptor {
    private final String fqName;

    public InterpretedStructure(String fqName) {
      this.fqName = fqName;
    }

    @Override
    public List<String> getParentsNames() {
      return LanguageHierarchyCache.getInstance()._getParentsNames(fqName);
    }

    @Override
    public boolean isAssignableTo(String toConceptFqName) {
      return LanguageHierarchyCache.getInstance()._isAssignable(fqName, toConceptFqName);
    }

    @Override
    public Set<String> getAncestorsNames() {
      return LanguageHierarchyCache.getInstance()._getAncestorsNames(fqName);
    }
  }
}
