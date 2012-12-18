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

import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.constraints.*;
import jetbrains.mps.smodel.runtime.ConstraintsDescriptor;
import jetbrains.mps.smodel.runtime.ReferenceConstraintsDescriptor;
import jetbrains.mps.smodel.runtime.ReferenceScopeProvider;
import jetbrains.mps.smodel.runtime.base.BaseReferenceConstraintsDescriptor;
import org.jetbrains.annotations.Nullable;

public class ReferenceWrapper {
  private ReferenceWrapper() {
  }

  public static ReferenceConstraintsDescriptor getReference(final String role, final ConstraintsDescriptor container,
                                                            @Nullable final INodeReferentSearchScopeProvider searchScopeProvider,
                                                            @Nullable final INodeReferentSetEventHandler referentSetEventHandler) {
    return new BaseReferenceConstraintsDescriptor(role, container) {
      private ReferenceScopeProvider referenceScopeProvider;

      {
        if (searchScopeProvider != null) {
          referenceScopeProvider = new INodeReferentSearchScopeProviderWrapper(searchScopeProvider);
        }
      }

      @Nullable
      @Override
      public ReferenceScopeProvider getScopeProvider() {
        if (referenceScopeProvider != null) {
          return referenceScopeProvider;
        } else {
          return super.getScopeProvider();
        }
      }

      @Override
      public boolean validate(SNode referenceNode, SNode oldReferentNode, SNode newReferentNode, IScope scope) {
        if (referentSetEventHandler != null) {
          if (referentSetEventHandler instanceof INodeReferenceFullSetHandler) {
            return ((INodeReferenceFullSetHandler) referentSetEventHandler).keepsOriginalReference(referenceNode, oldReferentNode, newReferentNode, scope);
          } else {
            return true;
          }
        } else {
          return super.validate(referenceNode, oldReferentNode, newReferentNode, scope);
        }
      }

      @Override
      public void onReferenceSet(SNode referenceNode, SNode oldReferentNode, SNode newReferentNode, IScope scope) {
        if (referentSetEventHandler != null) {
          referentSetEventHandler.processReferentSetEvent(referenceNode, oldReferentNode, newReferentNode, scope);
        } else {
          super.onReferenceSet(referenceNode, oldReferentNode, newReferentNode, scope);
        }
      }

      @Override
      public boolean hasOwnScopeProvider() {
        return searchScopeProvider != null;
      }

      @Override
      public boolean hasOwnOnReferenceSetHandler() {
        return referentSetEventHandler != null;
      }
    };
  }
}
