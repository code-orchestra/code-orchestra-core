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
package jetbrains.mps.smodel.constraints;

import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.search.ISearchScope;

public interface INodeReferentSearchScopeProvider extends IModelConstraints {
  ISearchScope createNodeReferentSearchScope(IOperationContext operationContext, ReferentConstraintContext _context);

  boolean hasPresentation();

  String getPresentation(IOperationContext operationContext, PresentationReferentConstraintContext _context);

  /**
   * For convenience navigation from errors in search scope to the checking function
   *
   * @return pointer to corresponding ConceptFunction node or null
   */
  SNodePointer getSearchScopeValidatorNodePointer();
}
