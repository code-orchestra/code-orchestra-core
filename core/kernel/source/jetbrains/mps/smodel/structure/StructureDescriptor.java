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

import java.util.List;
import java.util.Set;

public abstract class StructureDescriptor {
  // LanguageHierarchyCache replace
  public abstract List<String> getParentsNames();
  public abstract boolean isAssignableTo(String toConceptFqName);
  public abstract Set<String> getAncestorsNames();

//  public Set<String> getDescendantsOfConcept(String conceptFQName);
//  public Set<String> getAllDescendantsOfConcept(String conceptFqName);
//  public Set<String> getDefaultSubstitutableDescendantsOf(String concept, Language language);

  // ConceptAndSuperConceptCache replace
//  public SNode[] getConcepts();
//  public SNode getPropertyDeclarationByName(String name);
//  public List<SNode> getPropertyDeclarations();
//  public SNode getLinkDeclarationByRole(String role);
//  public SNode getMostSpecificLinkDeclarationByRole(final String role);
//  public List<SNode> getLinkDeclarationsExcludingOverridden();
//  public SNode getConceptPropertyByName(final String name);
}
