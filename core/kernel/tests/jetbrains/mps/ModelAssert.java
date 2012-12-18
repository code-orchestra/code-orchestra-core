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
package jetbrains.mps;

import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.SModel.ImportElement;
import org.junit.Assert;

import java.util.*;

import static org.junit.Assert.*;

public class ModelAssert {
  public static void assertDeepModelEquals(SModel expectedModel, SModel actualModel) {
    ModelAccess.instance().checkReadAccess();

    assertSameImports(expectedModel, actualModel);
    assertSameModelImports(expectedModel, actualModel);
    assertSameLanguageAspects(expectedModel, actualModel);

    assertSameNodesCollections("root", expectedModel.roots(), actualModel.roots());
  }

  private static void assertSameNodesCollections(String objectName, Iterable<SNode> expected, Iterable<SNode> actual) {
    HashMap<SNodeId, SNode> actualIdToNodeMap = new HashMap<SNodeId, SNode>();
    for (SNode actualNode : actual) {
      actualIdToNodeMap.put(actualNode.getSNodeId(), actualNode);
    }

    for (SNode expectedNode : expected) {
      SNodeId rootId = expectedNode.getSNodeId();
      SNode actualNode = actualIdToNodeMap.get(rootId);
      assertNotNull("Not found expected " + objectName + " " + expectedNode, actualNode);
      assertDeepNodeEquals(expectedNode, actualNode);
      actualIdToNodeMap.remove(rootId);
    }

    assertTrue("Found not expected " + objectName + " " + actualIdToNodeMap, actualIdToNodeMap.isEmpty());
  }

  private static void assertSameModelImports(SModel expectedModel, SModel actualModel) {
    assertListsEqual(SModelOperations.getImportedModelUIDs(expectedModel),
      SModelOperations.getImportedModelUIDs(actualModel),
      "model import");
  }

  private static void assertSameLanguageAspects(SModel expectedModel, SModel actualModel) {
    List<ImportElement> expectedLanguageAspects = expectedModel.getAdditionalModelVersions();
    List<ImportElement> actualLanguageAspects = actualModel.getAdditionalModelVersions();

    for (ImportElement expectedEl : expectedLanguageAspects) {
      boolean found = false;
      for (ImportElement actualEl : actualLanguageAspects) {
        if (actualEl.getModelReference().equals(expectedEl.getModelReference())) {
          assertSameLanguageAspects(expectedEl, actualEl);
          found = true;
          break;
        }
      }

      if (!found) {
        fail("Not found expected language aspect " + expectedEl.getModelReference());
      }
    }

    for (ImportElement actualEl : actualLanguageAspects) {
      boolean found = false;
      for (ImportElement expectedEl : expectedLanguageAspects) {
        if (actualEl.getModelReference().equals(expectedEl.getModelReference())) {
          assertSameLanguageAspects(expectedEl, actualEl);
          found = true;
          break;
        }
      }

      if (!found) {
        fail("Unexpected language aspect " + actualEl.getModelReference());
      }
    }
  }

  private static void assertSameLanguageAspects(ImportElement expectedEl, ImportElement actualEl) {
    assertEquals("Language aspect verion of model " + expectedEl.getModelReference() + " differ ", expectedEl.getUsedVersion(), actualEl.getUsedVersion());
  }

  private static void assertSameImports(SModel expectedModel, SModel actualModel) {
    assertListsEqual(expectedModel.getAdditionalModelVersions(),
      actualModel.getAdditionalModelVersions(), new Comparator<ImportElement>() {
        @Override
        public int compare(ImportElement import1, ImportElement import2) {
          if (import1.getModelReference().equals(import2.getModelReference())) {
            return import1.getUsedVersion() - import2.getUsedVersion();
          }
          return 1;
        }
      },
      "import");
  }

  private static <C> void assertListsEqual(List<C> expectedList, List<C> actualList, String name) {
    assertListsEqual(expectedList, actualList, new Comparator<C>() {
      @Override
      public int compare(C o1, C o2) {
        return o1.equals(o2) ? 0 : 1;
      }
    }, name);
  }

  private static <C> void assertListsEqual(List<C> expectedList, List<C> actualList, Comparator<C> comparator, String name) {
    List<C> notFoundExpected = new ArrayList<C>();
    List<C> notFoundActual = new ArrayList<C>();
    for (C expected : expectedList) {
      boolean found = false;
      for (C actual : actualList) {
        if (comparator.compare(actual, expected) == 0) {
          found = true;
          break;
        }
      }
      if (!found) {
        notFoundExpected.add(expected);
      }
    }

    for (C actual : actualList) {
      boolean found = false;
      for (C expected : expectedList) {
        if (comparator.compare(actual, expected) == 0) {
          found = true;
          break;
        }
      }
      if (!found) {
        notFoundActual.add(actual);
      }
    }

    if (!notFoundExpected.isEmpty()) {
      fail("Not found expected " + name + " " + Arrays.toString(notFoundExpected.toArray()));
    }

    if (!notFoundActual.isEmpty()) {
      fail("Not expected " + name + " " + Arrays.toString(notFoundActual.toArray()));
    }
  }

  public static void assertDeepNodeEquals(SNode expectedNode, SNode actualNode) {
    assertEquals(getErrorString("concept", expectedNode, actualNode),
      expectedNode.getConceptFqName(),
      actualNode.getConceptFqName());

    // match properties
    assertPropertyEquals(expectedNode, actualNode);
    // match references
    assertReferenceEquals(expectedNode, actualNode);
    // match children
    assertDeepChildrenEquals(expectedNode, actualNode);
  }

  private static void assertDeepChildrenEquals(SNode expectedNode, SNode actualNode) {
    Set<String> roles = new HashSet<String>(expectedNode.getChildRoles());
    roles.addAll(actualNode.getChildRoles());

    for (String role : roles) {
      List<SNode> expectedChildren = expectedNode.getChildren(role);
      List<SNode> actualChildren = actualNode.getChildren(role);

      assertEquals(getErrorString("child count in role " + role, expectedNode, actualNode), expectedChildren.size(), actualChildren.size());

      Iterator<SNode> actualIterator = actualChildren.iterator();
      for (SNode expectedChild : expectedChildren) {
        SNode actualChild = actualIterator.next();
        assertEquals(getErrorString("children in role " + role, expectedNode, actualNode), expectedChild.getSNodeId(), actualChild.getSNodeId());
        assertDeepNodeEquals(expectedChild, actualChild);
      }
    }
  }

  private static void assertPropertyEquals(SNode expectedNode, SNode actualNode) {
    HashSet<String> propertes = new HashSet<String>();
    propertes.addAll(expectedNode.getPropertyNames());
    propertes.addAll(actualNode.getPropertyNames());
    for (String key : propertes) {
      String expectedProperty = expectedNode.getProperties().get(key);
      String actualProperty = actualNode.getProperties().get(key);
      assertEquals(getErrorString("property", expectedNode, actualNode), expectedProperty, actualProperty);
    }
  }

  private static String getErrorString(String text, SNode expectedNode, SNode actualNode) {
    return "Different " + text + " for nodes " + expectedNode + " and " + actualNode + ".";
  }

  private static void assertReferenceEquals(SNode expectedNode, SNode actualNode) {
    Set<String> roles = new HashSet<String>();
    roles.addAll(expectedNode.getReferenceRoles());
    roles.addAll(actualNode.getReferenceRoles());
    Map<String, Set<SReference>> expRoleToReferenceMap = createRoleToReferenceMap(expectedNode);
    Map<String, Set<SReference>> actRoleToReferenceMap = createRoleToReferenceMap(actualNode);

    for (String role : roles) {
      Assert.assertEquals(getErrorString("different number of referents in role " + role, expectedNode, actualNode),
        expRoleToReferenceMap.get(role).size(), actRoleToReferenceMap.get(role).size());

      SReference expectedReference = expectedNode.getReference(role);
      SReference actualReference = actualNode.getReference(role);

      assertReferenceEquals(getErrorString("reference in role " + role, expectedNode, actualNode),
        expectedReference,
        actualReference);
    }
  }

  private static Map<String, Set<SReference>> createRoleToReferenceMap(SNode expectedNode) {
    Map<String, Set<SReference>> expRoleToReferenceMap = new HashMap<String, Set<SReference>>();
    for (SReference ref : expectedNode.getReferences()) {
      if (expRoleToReferenceMap.get(ref.getRole()) == null) {
        expRoleToReferenceMap.put(ref.getRole(), new HashSet<SReference>());
      }
      expRoleToReferenceMap.get(ref.getRole()).add(ref);
    }
    return expRoleToReferenceMap;
  }

  private static void assertReferenceEquals(String errorString, SReference expectedReference, SReference actualReference) {
    if (expectedReference == null) {
      assertNull(errorString, actualReference);
      return;
    }
    assertNotNull(errorString, actualReference);

//    assertIdEqualsOrBothNull(errorString, expectedReference.getTargetNode(), actualReference.getTargetNode());
    assertEquals(errorString, expectedReference.getResolveInfo(), actualReference.getResolveInfo());
    assertEquals(errorString, expectedReference.getRole(), actualReference.getRole());
    assertEquals(errorString, expectedReference.getTargetNodeId(), actualReference.getTargetNodeId());
  }

  private static void assertIdEqualsOrBothNull(String errorString, SNode expectedNode, SNode actualNode) {
    if (expectedNode == null) {
      assertNull(errorString, actualNode);
      return;
    }
    assertNotNull(errorString, actualNode);
    assertEquals(errorString, expectedNode.getSNodeId(), actualNode.getSNodeId());
  }
}
