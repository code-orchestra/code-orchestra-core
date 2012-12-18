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

import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.NameUtil;

import java.awt.Font;

public class NodePresentationUtil {

  public static boolean isLocalTo(SNode referenceNode, SNode referentNode) {
    IModule referenceModule = toLanguage(referenceNode.getModel().getModelDescriptor().getModule());
    if (referenceModule instanceof Language) {
      IModule referentModule = toLanguage(referentNode.getModel().getModelDescriptor().getModule());
      return referentModule == referenceModule;
    } else {
      return referentNode.getModel() == referenceNode.getModel();
    }
  }

  public static int getFontStyle(SNode referenceNode, SNode referentNode) {
    if (!SModelStereotype.isUserModel(referentNode.getModel())) return Font.PLAIN;
    return isLocalTo(referenceNode, referentNode) ? Font.BOLD : Font.PLAIN;
  }

  public static int getSortPriority(SNode referenceNode, SNode referentNode) {
    if (isLocalTo(referenceNode, referentNode)) {
      return -2;
    }
    if (SModelStereotype.isUserModel(referentNode.getModel())) {
      return -1;
    }
    return 0;
  }

  private static IModule toLanguage(IModule m) {
    if (m instanceof Generator) {
      return ((Generator) m).getSourceLanguage();
    }
    return m;
  }

  public static String matchingText(SNode node) {
    return matchingText(node, false);
  }

  public static String matchingText(SNode node, boolean referent_presentation) {
    return matchingText(node.getAdapter(), referent_presentation, true);
  }

  public static String matchingText(INodeAdapter nodeAdapter, boolean referent_presentation) {
    return matchingText(nodeAdapter, referent_presentation, true);
  }

  public static String matchingText(INodeAdapter nodeAdapter, boolean referent_presentation, boolean visible) {
    return matchingText(BaseAdapter.fromAdapter(nodeAdapter), referent_presentation, visible);
  }

  public static String matchingText(SNode node, boolean referent_presentation, boolean visible) {
    // handle concept declarations is a special way.
    if (SNodeUtil.isInstanceOfConceptDeclaration(node)) {
      if (!referent_presentation) {
        String alias = SNodeUtil.getConceptAlias(node);
        if (alias != null) {
          return alias;
        }
      }
      return node.getName();
    }

    if (!visible) {
      if (node.isInstanceOfConcept(SNodeUtil.concept_IResolveInfo)) {
        return SNodeUtil.getResolveInfo(node);
      }
    }
    return node.getPresentation();
  }

  public static String descriptionText(SNode node) {
    return descriptionText(node, false);
  }

  public static String descriptionText(INodeAdapter nodeAdapter, boolean referent_presentation) {
    return descriptionText(BaseAdapter.fromAdapter(nodeAdapter), referent_presentation);
  }

  public static String descriptionText(SNode node, boolean referent_presentation) {
    if (SNodeUtil.isInstanceOfConceptDeclaration(node) && !referent_presentation) {
      String description = SNodeUtil.getConceptShortDescription(node);
      if (description != null) {
        return description;
      }

      SNode anExtends = SNodeUtil.getConceptDeclaration_Extends(node);
      if (anExtends != null) {
        String namespace = NameUtil.namespaceFromConceptFQName(NameUtil.nodeFQName(node));
        namespace = NameUtil.compactNamespace(namespace);
        return "(" + anExtends.getName() + " in " + namespace + ")";
      }
      return "";
    }

    return descriptionText_internal(node);
  }

  private static String descriptionText_internal(SNode node) {
    if (node == null) {
      return "";
    }

    String shortDescription = SNodeUtil.getNodeShortDescription(node);
    if (shortDescription != null) {
      return shortDescription;
    }

    if (node.isRoot()) {
      return NameUtil.shortNameFromLongName(node.getConceptFqName()) + " (" + node.getModel().getSModelReference().getCompactPresentation() + ")";
    }

    return node.getRole_() + " (" + NameUtil.compactNodeFQName(node.getContainingRoot()) + ")";
  }

  public static String getAliasOrConceptName(SNode node) {
    String alias = node.getConceptProperty("alias");
    if (alias != null) {
      return alias;
    }

    return node.getConceptShortName();
  }

  public static String getRoleInParentOrConceptName(SNode node) {
    String role = node.getRole_();
    if (role != null) {
      return role;
    }
    if (SNodeUtil.isInstanceOfConceptDeclaration(node) && node.getName() != null) {
      return node.getName();
    }
    return NameUtil.shortNameFromLongName(node.getClass().getName());
  }

  public static String getPathToRoot(SNode node) {
    if (node == null) return "null";
    if (node.isRoot()) return node.getName();
    return getPathToRoot(node.getParent()) + " > " + node.getName();
  }
}
