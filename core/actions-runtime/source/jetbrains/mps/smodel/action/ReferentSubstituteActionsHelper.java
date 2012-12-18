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
package jetbrains.mps.smodel.action;

import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.constraints.IReferencePresentation;
import jetbrains.mps.smodel.constraints.ModelConstraintsUtil;
import jetbrains.mps.smodel.constraints.SearchScopeStatus;
import jetbrains.mps.smodel.search.ISearchScope;
import jetbrains.mps.smodel.search.IsInstanceCondition;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

/*package*/ class ReferentSubstituteActionsHelper {
  private static final Logger LOG = Logger.getLogger(ReferentSubstituteActionsHelper.class);

  public static List<INodeSubstituteAction> createActions(SNode referenceNode, SNode currentReferent, SNode linkDeclaration, IOperationContext context) {
    IScope scope = context.getScope();

    // proceed with custom builders
    SNode referenceNodeConcept = referenceNode.getConceptDeclarationNode();
    Language primaryLanguage = SModelUtil.getDeclaringLanguage(referenceNodeConcept);
    if (primaryLanguage == null) {
      LOG.error("Couldn't build actions : couldn't get declaring language for concept " + referenceNodeConcept.getDebugText());
      return new LinkedList<INodeSubstituteAction>();
    }

    // search scope
    SearchScopeStatus status = ModelConstraintsUtil.getSearchScope(referenceNode.getParent(), referenceNode, referenceNodeConcept, linkDeclaration, context);
    if (status.isError()) {
      LOG.error("Couldn't create referent search scope : " + status.getMessage());
      return new LinkedList<INodeSubstituteAction>();
    }

    ISearchScope searchScope = status.getSearchScope();
    IReferencePresentation presentation = status.getPresentation();
    return createActions(referenceNode, currentReferent, linkDeclaration, searchScope, presentation, scope);
  }

  private static List<INodeSubstituteAction> createActions(
    SNode referenceNode, SNode currentReferent, SNode linkDeclaration,
    ISearchScope searchScope, IReferencePresentation presentation, final IScope scope) {

    final SNode referentConcept = SModelUtil.getLinkDeclarationTarget(linkDeclaration);
    if (referentConcept == null) {
      return Collections.emptyList();
    }
    List<SNode> nodes = searchScope.getNodes(new IsInstanceCondition(referentConcept));
    List<INodeSubstituteAction> actions = new ArrayList<INodeSubstituteAction>();
    for (SNode node : nodes) {
      actions.add(new DefaultReferentNodeSubstituteAction(node, referenceNode, currentReferent, linkDeclaration, presentation));
    }
    return actions;
  }
}
