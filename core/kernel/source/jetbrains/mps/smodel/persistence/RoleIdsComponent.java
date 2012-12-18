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
package jetbrains.mps.smodel.persistence;

import jetbrains.mps.smodel.SModel.ImportElement;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.SReference;

/**
 * @author Evgeny Gerashchenko
 * @since 6/6/11
 */
public class RoleIdsComponent {
  private static RoleIdsHandler ourHandler = null;

  private RoleIdsComponent() {
  }

  public static void setHandler(RoleIdsHandler handler) {
    ourHandler = handler;
  }

  public static boolean isEnabled() {
    return ourHandler != null;
  }

  public static void conceptRead(SNode node, SNodePointer conceptPointer) {
    if (ourHandler != null) {
      ourHandler.conceptRead(node.getConceptFqName(), conceptPointer);
    }
  }

  public static void nodeRoleRead(SNode node, SNodePointer linkPointer) {
    if (ourHandler != null) {
      if (node.getParent() != null) {
        ourHandler.nodeRoleRead(node.getParent().getConceptFqName(), node.getRole_(), linkPointer);
      }
    }
  }

  public static void referenceRoleRead(SReference reference, SNodePointer linkPointer) {
    if (ourHandler != null) {
      ourHandler.referenceRoleRead(reference.getSourceNode().getConceptFqName(), reference.getRole(), linkPointer);
    }
  }

  public static void propertyNameRead(SNode containingNode, String propertyName, SNodePointer propertyPointer) {
    if (ourHandler != null) {
      ourHandler.propertyNameRead(containingNode.getConceptFqName(), propertyName, propertyPointer);
    }
  }

  public static void modelVersionRead(ImportElement importElement) {
    if (ourHandler != null) {
      ourHandler.modelVersionRead(importElement.getModelReference(), importElement.getUsedVersion());
    }
  }

  public static SNodePointer getConceptPointer(SNode node) {
    if (ourHandler != null) {
      return ourHandler.getConceptPointer(node.getConceptFqName());
    } else {
      return null;
    }
  }

  public static SNodePointer getNodeRolePointer(SNode node) {
    if (ourHandler != null) {
      String linkRole = node.getRole_();
      if (linkRole == null) {
        return null;
      } else {
        String conceptFqName = node.getParent().getConceptFqName();
        return ourHandler.getNodeRolePointer(conceptFqName, linkRole);
      }
    } else {
      return null;
    }
  }

  public static SNodePointer getReferenceRolePointer(SReference reference) {
    if (ourHandler != null) {
      String conceptFqName = reference.getSourceNode().getConceptFqName();
      return ourHandler.getReferenceRolePointer(conceptFqName, reference.getRole());
    } else {
      return null;
    }
  }

  public static SNodePointer getPropertyNamePointer(SNode containingNode, String propertyName) {
    if (ourHandler != null) {
      String conceptFqName = containingNode.getConceptFqName();
      return ourHandler.getPropertyNamePointer(conceptFqName, propertyName);
    } else {
      return null;
    }
  }

  public static int getModelVersion(SModelReference modelReference) {
    if (ourHandler != null) {
      return ourHandler.getModelVersion(modelReference);
    } else {
      return -1;
    }
  }

  public interface RoleIdsHandler {
    void conceptRead(String conceptFqName, SNodePointer conceptPointer);
    void nodeRoleRead(String conceptFqName, String linkRole, SNodePointer linkPointer);
    void referenceRoleRead(String conceptFqName, String referenceLinkRole, SNodePointer linkPointer);
    void propertyNameRead(String conceptFqName, String propertyName, SNodePointer linkPointer);
    void modelVersionRead(SModelReference modelReference, int version);

    SNodePointer getConceptPointer(String conceptFqName);
    SNodePointer getNodeRolePointer(String conceptFqName, String linkRole);
    SNodePointer getReferenceRolePointer(String conceptFqName, String referenceLinkRole);
    SNodePointer getPropertyNamePointer(String conceptFqName, String propertyName);
    int getModelVersion(SModelReference modelReference);
  }
}
