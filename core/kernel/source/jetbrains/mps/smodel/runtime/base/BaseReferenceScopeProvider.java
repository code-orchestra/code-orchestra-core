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
package jetbrains.mps.smodel.runtime.base;

import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.runtime.ReferenceConstraintsContext;
import jetbrains.mps.smodel.runtime.ReferencePresentationContext;
import jetbrains.mps.smodel.runtime.ReferenceScopeProvider;
import jetbrains.mps.smodel.search.EmptySearchScope;
import jetbrains.mps.smodel.search.ISearchScope;
import jetbrains.mps.smodel.search.SimpleSearchScope;
import jetbrains.mps.smodel.search.UndefinedSearchScope;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.IterableUtil;

public class BaseReferenceScopeProvider implements ReferenceScopeProvider {
  public Object createSearchScopeOrListOfNodes(final IOperationContext operationContext, ReferenceConstraintsContext _context) {
    return new UndefinedSearchScope();
  }

  @Override
  public ISearchScope createSearchScope(IOperationContext operationContext, ReferenceConstraintsContext _context) {
    Object searchScopeOrListOfNodes = this.createSearchScopeOrListOfNodes(operationContext, _context);
    if (searchScopeOrListOfNodes == null) {
      return new EmptySearchScope();
    }
    if (searchScopeOrListOfNodes instanceof ISearchScope) {
      return (ISearchScope) searchScopeOrListOfNodes;
    }
/*    if (searchScopeOrListOfNodes instanceof List) {
      Iterable iterable = CollectionUtil.withoutNulls((Iterable) searchScopeOrListOfNodes);
      return new SimpleSearchScope(IterableUtil.asList(iterable));
    }*/
    if (searchScopeOrListOfNodes instanceof Iterable) {
      Iterable iterable = CollectionUtil.withoutNulls((Iterable) searchScopeOrListOfNodes);
      return new SimpleSearchScope(IterableUtil.asList(iterable));
    }
    throw new RuntimeException("unexpected type in search-scope provider " + searchScopeOrListOfNodes.getClass());
  }

  @Override
  public boolean hasPresentation() {
    return false;
  }

  @Override
  public String getPresentation(IOperationContext operationContext, ReferencePresentationContext _context) {
    throw new UnsupportedOperationException();
  }

  @Override
  public SNodePointer getSearchScopeValidatorNode() {
    return null;
  }
}
