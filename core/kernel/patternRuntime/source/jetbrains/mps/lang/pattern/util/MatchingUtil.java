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
package jetbrains.mps.lang.pattern.util;

import jetbrains.mps.smodel.PropertySupport;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.search.SModelSearchUtil;
import jetbrains.mps.logging.Logger;
import org.apache.commons.lang.ObjectUtils;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class MatchingUtil {
  private static final Logger LOG = Logger.getLogger(MatchingUtil.class);

  public static boolean matchNodes(SNode node1, SNode node2) {
    return matchNodes(node1, node2, IMatchModifier.DEFAULT, true);
  }

  public static boolean matchNodes(SNode node1, SNode node2, IMatchModifier matchModifier, boolean matchAttributes) {
    if (node1 == node2) return true;
    if (node1 == null) return false;
    if (node2 == null) return false;
    if (!node1.getConceptFqName().equals(node2.getConceptFqName())) return false;

    //properties
    Set<String> propertyNames1 = node1.getPropertyNames();
    Set<String> propertyNames = propertyNames1;
    propertyNames.addAll(node2.getPropertyNames());
    for (String propertyName : propertyNames) {
      SNode typeDeclaration = node1.getConceptDeclarationNode();
      SNode propertyDeclaration = SModelSearchUtil.findPropertyDeclaration(typeDeclaration, propertyName);
      String propertyValue1 = node1.getProperty(propertyName);
      String propertyValue2 = node2.getProperty(propertyName);
      if (propertyDeclaration == null) {
        SNode diagnosticsNode = propertyNames1.contains(propertyName) ? node1 : node2;
        LOG.warning("can't find a property declaration for property " + propertyName + " in a concept " + typeDeclaration, diagnosticsNode);
        LOG.warning("try to compare just properties' internal values");
        if (!ObjectUtils.equals(propertyValue1, propertyValue2)) {
          return false;
        }
      } else {
        PropertySupport propertySupport = PropertySupport.getPropertySupport(propertyDeclaration);
        if (!ObjectUtils.equals(propertySupport.fromInternalValue(propertyValue1),
          propertySupport.fromInternalValue(propertyValue2))) return false;
      }
    }

    //-- matching references
    Set<String> referenceRoles = node1.getReferenceRoles();
    referenceRoles.addAll(node2.getReferenceRoles());
    for (String role : referenceRoles) {
      SNode target1 = node1.getReferent(role);
      SNode target2 = node2.getReferent(role);
      if (matchModifier.accept(target1, target2)) {
        matchModifier.performAction(target1, target2);
        continue;
      }
      if (target2 != target1) return false;
    }

    // children
    Set<String> childRoles = node1.getChildRoles(matchAttributes);
    node2.addChildRoles(childRoles, matchAttributes);
    for (String role : childRoles) {
      List<SNode> children1 = node1.getChildren(role);
      List<SNode> children2 = node2.getChildren(role);
      if (matchModifier.acceptList(children1, children2)) {
        matchModifier.performGroupAction(children1, children2);
        continue;
      }
      Iterator<SNode> childrenIterator = children1.iterator();
      for (SNode child2 : children2.toArray(new SNode[children2.size()])) {
        SNode child1 = childrenIterator.hasNext() ? childrenIterator.next() : null;
        if (matchModifier.accept(child1, child2)) {
          matchModifier.performAction(child1, child2);
          continue;
        }
        if (!matchNodes(child1, child2, matchModifier, matchAttributes)) return false;
      }
      while (childrenIterator.hasNext()) {
        SNode child1 = childrenIterator.next();
        SNode child2 = null;
        if (matchModifier.accept(child1, child2)) {
          matchModifier.performAction(child1, child2);
          continue;
        }
        if (!matchNodes(child1, child2, matchModifier, matchAttributes)) return false;
      }
    }

    return true;
  }

}
