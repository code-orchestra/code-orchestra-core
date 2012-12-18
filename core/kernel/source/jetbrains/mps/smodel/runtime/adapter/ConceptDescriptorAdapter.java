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
package jetbrains.mps.smodel.runtime.adapter;

import jetbrains.mps.smodel.runtime.ConceptDescriptor;
import jetbrains.mps.smodel.structure.StructureDescriptor;

import java.util.List;
import java.util.Set;

public class ConceptDescriptorAdapter extends StructureDescriptor {
  private final ConceptDescriptor inner;

  public ConceptDescriptorAdapter(ConceptDescriptor conceptDescriptor) {
    this.inner = conceptDescriptor;
  }

  @Override
  public List<String> getParentsNames() {
    return inner.getParentsNames();
  }

  @Override
  public boolean isAssignableTo(String toConceptFqName) {
    return inner.isAssignableTo(toConceptFqName);
  }

  @Override
  public Set<String> getAncestorsNames() {
    return inner.getAncestorsNames();
  }
}
