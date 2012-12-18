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
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.search.AbstractSearchScope;
import jetbrains.mps.util.Condition;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;


public class ProviderGeneratedSearchScope extends AbstractSearchScope {
  private final BaseNodeReferenceSearchScopeProvider myProvider;
  private final IOperationContext myOperationContext;
  private final ReferentConstraintContext myContext;

  public ProviderGeneratedSearchScope(@NotNull BaseNodeReferenceSearchScopeProvider provider, @NotNull IOperationContext operationContext, @NotNull ReferentConstraintContext _context) {
    myProvider = provider;
    myOperationContext = operationContext;
    myContext = _context;
  }

  @NotNull
  @Override
  public List<SNode> getNodes(Condition<SNode> condition) {
    Iterable<SNode> seq = (Iterable<SNode>) myProvider.createSearchScopeOrListOfNodes(myOperationContext, myContext);
    List<SNode> result = new ArrayList<SNode>();
    if (seq != null) {
      for (SNode node : seq) {
        if (condition.met(node)) {
          result.add(node);
        }
      }
    }
    return result;
  }
}
