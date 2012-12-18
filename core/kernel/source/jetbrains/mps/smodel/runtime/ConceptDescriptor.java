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
package jetbrains.mps.smodel.runtime;

import org.jetbrains.annotations.Nullable;

import java.util.List;
import java.util.Set;

public interface ConceptDescriptor {
  String getConceptFqName();

  @Nullable
  String getSuperConcept();

  boolean isInterfaceConcept();

  List<String> getPropertyNames();

  boolean hasProperty(String name);

  List<String> getReferenceNames();

  boolean hasReference(String name);

  // LanguageHierarchyCache replace
  List<String> getParentsNames();

  boolean isAssignableTo(String toConceptFqName);

  Set<String> getAncestorsNames();

//  Set<String> getDescendantsOfConcept(String conceptFQName);
//  Set<String> getAllDescendantsOfConcept(String conceptFqName);
//  Set<String> getDefaultSubstitutableDescendantsOf(String concept, Language language);

  // ConceptAndSuperConceptCache replace
//  SNode[] getConcepts();
//  SNode getPropertyDeclarationByName(String name);
//  List<SNode> getPropertyDeclarations();
//  SNode getLinkDeclarationByRole(String role);
//  SNode getMostSpecificLinkDeclarationByRole(final String role);
//  List<SNode> getLinkDeclarationsExcludingOverridden();
//  SNode getConceptPropertyByName(final String name);
}
