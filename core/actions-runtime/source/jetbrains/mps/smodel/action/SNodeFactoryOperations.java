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

import jetbrains.mps.lang.smodel.generator.smodelAdapter.AttributeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.IAttributeDescriptor;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.AttributesRolesUtil;
import jetbrains.mps.smodel.CopyUtil;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.search.SModelSearchUtil;

/**
 * Evgeny Gryaznov, 1/4/11
 */
public class SNodeFactoryOperations {

  private static final Logger LOG = Logger.getLogger(SNodeFactoryOperations.class);

  public static SNode createNewNode(String conceptFqName, SNode prototypeNode) {
    if (conceptFqName == null) return null;
    return NodeFactoryManager.createNode(conceptFqName, prototypeNode, null, null);
  }

  public static SNode createNewNode(SModel model, String conceptFqName, SNode prototypeNode) {
    SNode enclosingNode = null;
    if (prototypeNode != null) {
      enclosingNode = prototypeNode.getParent();
    }

    return NodeFactoryManager.createNode(conceptFqName, prototypeNode, enclosingNode, model);
  }

  public static SNode createNewRootNode(SModel model, String conceptFqName, SNode prototypeNode) {
    SNode newNode = NodeFactoryManager.createNode(conceptFqName, prototypeNode, null, model);
    model.addRoot(newNode);
    return newNode;
  }

  public static SNode addNewChild(SNode node, String role, String childConceptFQName) {
    if (node != null) {
      SNode newChild = NodeFactoryManager.createNode(childConceptFQName, null, node, node.getModel());
      node.addChild(role, newChild);
      return newChild;
    }
    return null;
  }

  public static SNode addNewAttribute(SNode node, IAttributeDescriptor descriptor, String childConceptFQName) {
    if (node != null) {
      SNode newChild = NodeFactoryManager.createNode(childConceptFQName, null, node, node.getModel());
      AttributeOperations.addAttribute(node, descriptor, newChild);
      return newChild;
    }
    return null;
  }

  public static SNode setNewChild(SNode node, String role, String childConceptFQName) {
    if (node != null) {
      SNode prototypeNode = node.getChild(role);
      SNode newChild = NodeFactoryManager.createNode(childConceptFQName, prototypeNode, node, node.getModel());
      node.setChild(role, newChild);
      return newChild;
    }
    return null;
  }

  public static SNode setNewAttribute(SNode node, IAttributeDescriptor descriptor, String childConceptFQName) {
    if (node != null) {
      SNode prototypeNode = AttributeOperations.getAttribute(node, descriptor);
      SNode newChild = NodeFactoryManager.createNode(childConceptFQName, prototypeNode, node, node.getModel());
      AttributeOperations.setAttribute(node, descriptor, newChild);
      return newChild;
    }
    return null;
  }

  public static SNode replaceWithNewChild(SNode oldChild, String conceptFqName) {
    assert oldChild != null : "can't replace node. node is NULL";
    SNode oldChildParent = oldChild.getParent();
    if (oldChildParent == null && !oldChild.isRoot()) {
      return null;
    }
    SModel model = oldChild.getModel();
    SNode newChild = NodeFactoryManager.createNode(conceptFqName, oldChild, oldChildParent, model);
    if (newChild == null) return null;
    if (oldChildParent == null) {
      model.addRoot(newChild);
      model.removeRoot(oldChild);
    } else {
      oldChildParent.replaceChild(oldChild, newChild);
    }
    copyAllAttributes(oldChild, newChild);
    return newChild;
  }

  private static void copyAllAttributes(SNode oldChild, SNode newChild) {
    for (SNode attribute : AttributeOperations.getAllAttributes(oldChild)) {
      String role = attribute.getRole_();
      if (AttributesRolesUtil.isPropertyAttributeRole(role)) {
        String propertyName = AttributesRolesUtil.getPropertyNameFromPropertyAttributeRole(role);
        if (SModelSearchUtil.findPropertyDeclaration(newChild.getConceptDeclarationNode(), propertyName) == null) {
          // no such property in new child : don't copy the attribute
          LOG.error("couldn't copy attribute " + attribute.getConceptShortName() + " for property '" + propertyName + "' : so such property in concept " + newChild.getConceptShortName(), newChild);
          continue;
        }
      }
      if (AttributesRolesUtil.isLinkAttributeRole(role)) {
        String linkRole = AttributesRolesUtil.getLinkRoleFromLinkAttributeRole(role);
        if (SModelSearchUtil.findLinkDeclaration(newChild.getConceptDeclarationNode(), linkRole) == null) {
          // no such link in new child : don't copy the attribute
          LOG.error("couldn't copy attribute " + attribute.getConceptShortName() + " for link '" + linkRole + "' : so such link in concept " + newChild.getConceptShortName(), newChild);
          continue;
        }
      }

      SNode newAttribute = CopyUtil.copy(attribute);
      newChild.addChild(role, newAttribute);
    }
  }

  public static SNode insertNewNextSiblingChild(SNode node, String conceptFQName) {
    if (node == null || node.getParent() == null) return null;
    SNode parent = node.getParent();
    SNode newChild = NodeFactoryManager.createNode(conceptFQName, null, parent, node.getModel());
    if (newChild == null) return null;
    String role = node.getRole_();
    assert parent != null && role != null;
    parent.insertChild(node, role, newChild);
    return newChild;
  }

  public static SNode insertNewPrevSiblingChild(SNode node, String conceptFqName) {
    if (node == null) return null;
    SNode parent = node.getParent();
    if (parent == null) return null;
    SNode newChild = NodeFactoryManager.createNode(conceptFqName, null, parent, node.getModel());
    if (newChild == null) return null;
    String role = node.getRole_();
    assert role != null;
    parent.insertChild(node, role, newChild, true);
    return newChild;
  }
}
