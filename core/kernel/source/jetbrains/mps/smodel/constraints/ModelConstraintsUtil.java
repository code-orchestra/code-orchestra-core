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

import com.intellij.openapi.util.Computable;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.newTypesystem.TypeSystemException;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.constraints.SearchScopeStatus.ERROR;
import jetbrains.mps.smodel.constraints.SearchScopeStatus.OK;
import jetbrains.mps.smodel.runtime.ReferenceScopeProvider;
import jetbrains.mps.smodel.search.EmptySearchScope;
import jetbrains.mps.smodel.search.ISearchScope;
import jetbrains.mps.smodel.search.SModelSearchUtil;
import jetbrains.mps.smodel.search.UndefinedSearchScope;
import jetbrains.mps.typesystem.inference.TypeContextManager;

/**
 * Igor Alshannikov
 * May 30, 2006
 */
public class ModelConstraintsUtil {
  private static final Logger LOG = Logger.getLogger(ModelConstraintsUtil.class);

  public static SearchScopeStatus getSearchScope(SNode enclosingNode, SNode referenceNode, SNode referenceNodeConcept, SNode referenceLinkDeclaration, IOperationContext context) {
    String linkRole = SModelUtil.getGenuineLinkRole(referenceLinkDeclaration);
    SNode linkTarget = SModelUtil.getLinkDeclarationTarget(referenceLinkDeclaration);
    return getSearchScope(enclosingNode, referenceNode, referenceNodeConcept, linkRole, linkTarget, context);
  }

  /**
   * @param linkRole - use *genuine* link role here!!!
   */
  public static SearchScopeStatus getSearchScope(SNode enclosingNode, SNode referenceNode, SNode referenceNodeConcept, String linkRole, IOperationContext context) {
    return getSearchScope(enclosingNode, referenceNode, referenceNodeConcept, linkRole, null, context);
  }

  private static SearchScopeStatus getSearchScope(SNode enclosingNode, final SNode referenceNode, final SNode referenceNodeConcept, final String linkRole, final SNode linkTarget, final IOperationContext context) {
    final SModel model;
    if (enclosingNode != null) {
      model = enclosingNode.getModel();
    } else if (referenceNode != null) {
      model = referenceNode.getModel();
      enclosingNode = referenceNode.getParent();
    } else {
      model = null;
    }

    final SNode enclosingNode_ = enclosingNode;
    final SearchScopeStatus[] status = new SearchScopeStatus[1];
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        SNode contextNode = enclosingNode_;
        if (contextNode == null) {
          contextNode = referenceNode;
        }
        TypeContextManager.getInstance().runResolveAction(new Runnable() {
          @Override
          public void run() {
            try {
              status[0] = getSearchScope_intern(model, enclosingNode_, referenceNode, referenceNodeConcept, linkRole, linkTarget, context);
            } catch (Exception t) {
              LOG.error(t, referenceNode != null ? referenceNode : enclosingNode_);
              status[0] = new SearchScopeStatus.ERROR("can't create search scope for role '" + linkRole + "' in '" + referenceNodeConcept.getName() + "'");
            }
          }
        });
      }
    });
    return status[0];
  }

  private static SearchScopeStatus getSearchScope_intern(
    SModel model,
    SNode enclosingNode,
    SNode referenceNode,
    SNode referenceNodeConcept,
    String linkRole,
    SNode linkTarget,
    IOperationContext context) {

    INodeReferentSearchScopeProvider scopeProvider = getSearchScopeProvider(referenceNodeConcept, linkRole);
    ReferentConstraintContext referentConstraintContext = new ReferentConstraintContext(model, enclosingNode, referenceNode, linkTarget);
    DefaultReferencPresentation referencePresentation = null;
    if (scopeProvider != null) {
      referencePresentation = scopeProvider.hasPresentation() ? new DefaultReferencPresentation(context, referentConstraintContext, scopeProvider) : null;
      ISearchScope searchScope = scopeProvider.createNodeReferentSearchScope(context, referentConstraintContext);
      if (!(searchScope instanceof UndefinedSearchScope)) {
        return newOK(searchScope,
          referencePresentation,
          false,
          scopeProvider.getSearchScopeValidatorNodePointer());
      }
    }
    // global search scope
    ISearchScope searchScope = createDefaultScope(model, context);
    return newOK(searchScope, referencePresentation, true, null);
  }

  public static ISearchScope createDefaultScope(SModel model, IOperationContext context) {
    return SModelSearchUtil.createModelAndImportedModelsScope(model, false, context.getScope());
  }

  //used in checkers
  public static SearchScopeStatus createSearchScope(final INodeReferentSearchScopeProvider scopeProvider,
                                                    SModel model,
                                                    SNode enclosingNode,
                                                    SNode referenceNode,
                                                    SNode linkTarget,
                                                    final IOperationContext context) {
    if (scopeProvider == null) return new OK(createDefaultScope(model, context), null, true, null);
    final ReferentConstraintContext referentConstraintContext = new ReferentConstraintContext(model, enclosingNode, referenceNode, linkTarget);
    try {
      ISearchScope searchScope = TypeContextManager.getInstance().runResolveAction(new Computable<ISearchScope>() {
        @Override
        public ISearchScope compute() {
          return scopeProvider.createNodeReferentSearchScope(context, referentConstraintContext);
        }
      });
      if (searchScope instanceof UndefinedSearchScope) {
        return new OK(createDefaultScope(model, context), null, true, null);
      } else {
        return new OK(searchScope, null, false, scopeProvider.getSearchScopeValidatorNodePointer());
      }
    } catch (Throwable t) {
      return new ERROR(t.getMessage());
    }
  }

  public static INodeReferentSearchScopeProvider getSearchScopeProvider(SNode referenceNodeConcept, String linkRole) {
    // todo: rewrite it
    final ReferenceScopeProvider provider = ModelConstraintsManager.getNodeReferentSearchScopeProvider(referenceNodeConcept, linkRole);

    if (provider == null) {
      return null;
    }

    return new INodeReferentSearchScopeProvider() {
      @Override
      public ISearchScope createNodeReferentSearchScope(IOperationContext operationContext, ReferentConstraintContext _context) {
        return provider.createSearchScope(operationContext, _context);
      }

      @Override
      public boolean hasPresentation() {
        return provider.hasPresentation();
      }

      @Override
      public String getPresentation(IOperationContext operationContext, PresentationReferentConstraintContext _context) {
        return provider.getPresentation(operationContext, _context);
      }

      @Override
      public SNodePointer getSearchScopeValidatorNodePointer() {
        return provider.getSearchScopeValidatorNode();
      }

      @Override
      public void registerSelf(ModelConstraintsManager manager) {
      }

      @Override
      public void unRegisterSelf(ModelConstraintsManager manager) {
      }
    };
  }

  public static IReferencePresentation getPresentation(SNode enclosingNode, SNode referenceNode, SNode referenceNodeConcept, SNode referenceLinkDeclaration, IOperationContext context) {
    String linkRole = SModelUtil.getGenuineLinkRole(referenceLinkDeclaration);
    SNode linkTarget = SModelUtil.getLinkDeclarationTarget(referenceLinkDeclaration);
    final SModel model;
    if (enclosingNode != null) {
      model = enclosingNode.getModel();
    } else if (referenceNode != null) {
      model = referenceNode.getModel();
      enclosingNode = referenceNode.getParent();
    } else {
      model = null;
    }

    INodeReferentSearchScopeProvider scopeProvider = getSearchScopeProvider(referenceNodeConcept, linkRole);
    ReferentConstraintContext referentConstraintContext = new ReferentConstraintContext(model, enclosingNode, referenceNode, linkTarget);
    return new DefaultReferencPresentation(context, referentConstraintContext, scopeProvider);
  }


  private static OK newOK(ISearchScope searchScope, IReferencePresentation presentation, boolean isDefault, SNodePointer searchScopeFactory) {
    if (searchScope == null) {
      searchScope = new EmptySearchScope();
    }
    return new OK(searchScope, presentation, isDefault, searchScopeFactory);
  }

  private static class DefaultReferencPresentation implements IReferencePresentation {
    private IOperationContext myOperationContext;
    private ReferentConstraintContext myContext;
    private INodeReferentSearchScopeProvider myProvider;

    private DefaultReferencPresentation(IOperationContext operationContext, ReferentConstraintContext context, INodeReferentSearchScopeProvider provider) {
      myOperationContext = operationContext;
      myContext = context;
      myProvider = provider;
    }

    public String getText(SNode node, boolean visible, boolean smartRef, boolean inEditor) {
      if(myProvider != null) {
        return myProvider.getPresentation(myOperationContext,
          new PresentationReferentConstraintContext(myContext.getModel(), myContext.getEnclosingNode(),
            myContext.getReferenceNode(), myContext.getLinkTarget(), node, visible, smartRef, inEditor));
      }
      return node.getPresentation();
    }
  }

}
