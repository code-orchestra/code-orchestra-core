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

import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.search.EmptySearchScope;
import jetbrains.mps.smodel.search.ISearchScope;
import jetbrains.mps.smodel.search.SimpleSearchScope;
import jetbrains.mps.smodel.search.UndefinedSearchScope;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.IterableUtil;

public abstract class BaseNodeReferenceSearchScopeProvider implements INodeReferentSearchScopeProvider {
  private static Logger LOG = Logger.getLogger(BaseNodeReferenceSearchScopeProvider.class);

  public Object createSearchScopeOrListOfNodes(final IOperationContext operationContext, final ReferentConstraintContext _context) {
    return new UndefinedSearchScope();
  }

  public ISearchScope createNodeReferentSearchScope(final IOperationContext operationContext, final ReferentConstraintContext _context) {
    try {
      Object searchScopeOrListOfNodes = createSearchScopeOrListOfNodes(operationContext, _context);
      if (searchScopeOrListOfNodes == null) return new EmptySearchScope();
      if (searchScopeOrListOfNodes instanceof ISearchScope) return (ISearchScope) searchScopeOrListOfNodes;
      if (searchScopeOrListOfNodes instanceof Iterable) {
        Iterable iterable = CollectionUtil.withoutNulls((Iterable) searchScopeOrListOfNodes);
        return new SimpleSearchScope(IterableUtil.asList(iterable));
      }
      throw new RuntimeException("unexpected type in search-scope provider " + searchScopeOrListOfNodes.getClass());
    } catch (Throwable t) {
      LOG.error(t);
      return new EmptySearchScope();
    }
  }

  public boolean hasPresentation() {
    return false;
  }

  public String getPresentation(IOperationContext operationContext, PresentationReferentConstraintContext _context) {
    throw new UnsupportedOperationException();
  }

  public SNodePointer getSearchScopeValidatorNodePointer() {
    return null;
  }
}
