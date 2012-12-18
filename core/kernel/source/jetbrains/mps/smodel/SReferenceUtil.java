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
package jetbrains.mps.smodel;

import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.search.ConceptAndSuperConceptsScope;
import jetbrains.mps.util.NameUtil;

/**
 * Igor Alshannikov
 * Dec 18, 2007
 */
public class SReferenceUtil {
  private static final Logger LOG = Logger.getLogger(SReferenceUtil.class);

  /**
   * @param role - genuine role
   */
  public static boolean isDynamicResolve(String role, SNode sourceNode) {
//     return false;  // disable dynamic references

    SNode link = new ConceptAndSuperConceptsScope(sourceNode.getConceptDeclarationNode()).getMostSpecificLinkDeclarationByRole(role);
    if (link == null) {
      LOG.error("couldn't find link declaration '" + role + "' in concept '" + sourceNode.getConceptFqName() + "'", sourceNode);
      return false;
    }

    SNode target = SModelUtil.getLinkDeclarationTarget(link);
    if (target == null) {
      LOG.error("link target is not defined", link);
      return false;
    }

    return SModelUtil.isAssignableConcept(NameUtil.nodeFQName(target), SNodeUtil.concept_IResolveInfo);
  }
}
