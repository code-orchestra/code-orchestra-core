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

import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.constraints.INodeReferentSearchScopeProvider;
import jetbrains.mps.smodel.constraints.PresentationReferentConstraintContext;
import jetbrains.mps.smodel.constraints.ReferentConstraintContext;
import jetbrains.mps.smodel.runtime.ReferenceConstraintsContext;
import jetbrains.mps.smodel.runtime.ReferencePresentationContext;
import jetbrains.mps.smodel.runtime.ReferenceScopeProvider;
import jetbrains.mps.smodel.search.ISearchScope;

public class INodeReferentSearchScopeProviderWrapper implements ReferenceScopeProvider {
  private final INodeReferentSearchScopeProvider inner;

  public INodeReferentSearchScopeProviderWrapper(INodeReferentSearchScopeProvider referentSearchScopeProvider) {
    this.inner = referentSearchScopeProvider;
  }

  @Override
  public ISearchScope createSearchScope(IOperationContext operationContext, ReferenceConstraintsContext _context) {
    ReferentConstraintContext context = new ReferentConstraintContext(
      _context.getModel(),
      _context.getEnclosingNode(),
      _context.getReferenceNode(),
      _context.getLinkTarget()
    );
    return inner.createNodeReferentSearchScope(operationContext, context);
  }

  @Override
  public boolean hasPresentation() {
    return inner.hasPresentation();
  }

  @Override
  public String getPresentation(IOperationContext operationContext, ReferencePresentationContext _context) {
    PresentationReferentConstraintContext context = new PresentationReferentConstraintContext(
      _context.getModel(),
      _context.getEnclosingNode(),
      _context.getReferenceNode(),
      _context.getLinkTarget(),
      _context.getParameterNode(),
      _context.getVisible(),
      _context.getSmartReference(),
      _context.getInEditor()
    );
    return inner.getPresentation(operationContext, context);
  }

  @Override
  public SNodePointer getSearchScopeValidatorNode() {
    return inner.getSearchScopeValidatorNodePointer();
  }
}
