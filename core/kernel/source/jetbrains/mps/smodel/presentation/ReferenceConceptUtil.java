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
package jetbrains.mps.smodel.presentation;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.search.SModelSearchUtil;

import java.util.List;
import java.util.regex.Pattern;

/**
 * Igor Alshannikov
 * Jan 31, 2008
 */
public class ReferenceConceptUtil {
  private static final Logger LOG = Logger.getLogger(ReferenceConceptUtil.class);

  private static final Pattern SMART_ALIAS = Pattern.compile(".*<\\{.+\\}>.*");
  private static final Pattern SMART_ALIAS_SEPARATOR = Pattern.compile("<\\{|\\}>");

  /**
   * Puprose of some concepts is only to hold refrence on something else.
   * In such a concepts, the most importent thing is that reference, which is called 'characteristic reference'.
   * <p/>
   * Concept is considered 'pure reference' if
   * - it has alias which matches the pattern 'xxx <{_referent_role_}> yyy' (and declares reference link with this role)
   * or
   * - it declares declares exactly ONE reference link with cardinality 1
   *
   * @param concept with is possibly 'pure reference' concept.
   * @return characteristic reference or NULL
   */
  public static SNode getCharacteristicReference(final SNode concept) {
    return NodeReadAccessCasterInEditor.runReadTransparentAction(new Computable<SNode>() {
      public SNode compute() {
        String expectedReferentRole = null;
        String alias = concept.getConceptProperty("alias");
        if (alias != null) {
          // handle pattern 'xxx <{_referent_role_}> yyy'
          if (!alias.matches(".*<\\{.+\\}>.*")) {
            // trick (why?): has an alias but it doesn't match pattern - no characteristic reference
            return null;
          }
          String[] matches = alias.split("<\\{|\\}>");
          expectedReferentRole = matches[1];
        }

        List<SNode> links = SModelSearchUtil.getReferenceLinkDeclarations(concept);
        if (expectedReferentRole != null) {
          for (SNode link : links) {
            if (expectedReferentRole.equals(SModelUtil.getLinkDeclarationRole(link))) {
              return link;
            }
          }
          LOG.warning("the '" + alias + "' doesn't match any reference link in " + concept.getDebugText());
        } else {
          // if concept declares exactly ONE REQUIRED reference link...
          if (links.size() == 1) {
            SNode genuineLinkDeclaration = SModelUtil.getGenuineLinkDeclaration(links.get(0));
            if (SNodeUtil.getLinkDeclaration_IsExactlyOneMultiplicity(genuineLinkDeclaration)) {
              return links.get(0);
            }
          }
        }
        return null;
      }
    });
  }

  public static boolean hasSmartAlias(SNode concept) {
    String conceptAlias = concept.getConceptProperty("alias");
    // matches pattern 'xxx <{_referent_role_}> yyy' ?
    return conceptAlias != null && SMART_ALIAS.matcher(conceptAlias).matches();
  }

  public static String getPresentationFromSmartAlias(SNode concept, String referentPresentation) {
    String conceptAlias = concept.getConceptProperty("alias");
    // handle pattern 'xxx <{_referent_role_}> yyy'
    String[] matches = SMART_ALIAS_SEPARATOR.split(conceptAlias, 0);
    matches[1] = referentPresentation;
    StringBuilder sb = new StringBuilder();
    for (String segment : matches) {
      sb.append(segment);
    }
    return sb.toString();
  }

  public static String getPresentation(SNode node) {
    SNode nodeConcept = node.getConceptDeclarationNode();
    SNode characteristicReference = getCharacteristicReference(nodeConcept);
    if (characteristicReference == null) return null;
    String genuineRole = SModelUtil.getGenuineLinkRole(characteristicReference);
    SReference reference = node.getReference(genuineRole);
    if (reference instanceof DynamicReference) {
      return reference.getResolveInfo();
    }
    SNode referentNode = node.getReferent(genuineRole);
    String referentPresentation = "<no " + SModelUtil.getLinkDeclarationRole(characteristicReference) + ">";
    if (referentNode != null) {
      referentPresentation = referentNode.toString();
    }
    if (hasSmartAlias(nodeConcept)) {
      return getPresentationFromSmartAlias(nodeConcept, referentPresentation);
    }
    return referentPresentation;
  }
}
