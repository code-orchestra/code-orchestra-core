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
package jetbrains.mps.smodel.runtime.impl;

import jetbrains.mps.smodel.language.ConceptRegistry;
import jetbrains.mps.smodel.runtime.ConceptDescriptor;
import jetbrains.mps.smodel.runtime.base.BaseConceptDescriptor;
import org.jetbrains.annotations.Nullable;
import sun.reflect.generics.tree.ArrayTypeSignature;

import java.util.*;

public class CompiledConceptDescriptor extends BaseConceptDescriptor {
  private final String conceptFqName;
  private final String superConcept;
  private final boolean isInterfaceConcept;
  private final List<String> parents;
  private final Set<String> ancestors;
  private final List<String> propertyNames;
  private final List<String> referenceNames;

  public CompiledConceptDescriptor(String conceptFqName,
                                   @Nullable String superConcept,
                                   boolean isInterfaceConcept,
                                   String[] parents,
                                   String[] ownPropertyNames,
                                   String[] ownReferenceNames) {
    this.conceptFqName = conceptFqName;
    this.superConcept = superConcept;
    this.isInterfaceConcept = isInterfaceConcept;
    this.parents = Arrays.asList(parents);

    // hierarchy
    // todo: common with StructureAspectInterpreted to new class!
    // get parent descriptors
    ConceptRegistry registry = ConceptRegistry.getInstance();

    List<ConceptDescriptor> parentDescriptors = new ArrayList<ConceptDescriptor>(parents.length);
    for (String parent : parents) {
      ConceptDescriptor descriptor = registry.getConceptDescriptor(parent);
      parentDescriptors.add(descriptor);
    }

    // ancestors
    ancestors = new HashSet<String>(this.parents);
    ancestors.add(conceptFqName);
    for (ConceptDescriptor parentDescriptor : parentDescriptors) {
      ancestors.addAll(parentDescriptor.getAncestorsNames());
    }

    // properties
    LinkedHashSet<String> properties = new LinkedHashSet<String>();
    properties.addAll(Arrays.asList(ownPropertyNames));

    for (ConceptDescriptor parentDescriptor : parentDescriptors) {
      properties.addAll(parentDescriptor.getPropertyNames());
    }

    propertyNames = new ArrayList<String>(properties);

    // references
    LinkedHashSet<String> references = new LinkedHashSet<String>();
    references.addAll(Arrays.asList(ownReferenceNames));

    for (ConceptDescriptor parentDescriptor : parentDescriptors) {
      references.addAll(parentDescriptor.getReferenceNames());
    }

    referenceNames = new ArrayList<String>(references);
  }

  @Override
  public String getConceptFqName() {
    return conceptFqName;
  }

  @Override
  public String getSuperConcept() {
    return superConcept;
  }

  @Override
  public boolean isInterfaceConcept() {
    return isInterfaceConcept;
  }

  @Override
  public List<String> getPropertyNames() {
    return propertyNames;
  }

  @Override
  public List<String> getReferenceNames() {
    return referenceNames;
  }

  @Override
  public List<String> getParentsNames() {
    return parents;
  }

  @Override
  public Set<String> getAncestorsNames() {
    return ancestors;
  }
}
