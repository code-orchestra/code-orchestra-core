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

import gnu.trove.TObjectIntHashMap;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;

public class SModelVersionsInfo {
  private static final Logger LOG = Logger.getLogger(SModelVersionsInfo.class);

  private boolean myIsDisposed = false;
  private final TObjectIntHashMap<SNode> myNodeConceptVersions = new TObjectIntHashMap<SNode>();
  private final TObjectIntHashMap<SNode> myNodeRolesVersions = new TObjectIntHashMap<SNode>();
  private final TObjectIntHashMap<NodeStringPair> myNodePropertiesVersions = new TObjectIntHashMap<NodeStringPair>();
  private final TObjectIntHashMap<NodeStringPair> myNodeLinkRolesVersions = new TObjectIntHashMap<NodeStringPair>();
  private final TObjectIntHashMap<NodeStringPair> myNodeLinkTargetsVersions = new TObjectIntHashMap<NodeStringPair>();

  public void dispose() {
    LOG.assertLog(!myIsDisposed);

    myNodeConceptVersions.clear();
    myNodeRolesVersions.clear();
    myNodePropertiesVersions.clear();

    myIsDisposed = true;
  }

  public void addPropertyVersion(SNode node, String propertyName, int version) {
    LOG.assertLog(!myIsDisposed);

    NodeStringPair property = new NodeStringPair(node, propertyName);
    myNodePropertiesVersions.put(property, version);
  }

  public int getPropertyVersion(SNode node, String propertyName) {
    LOG.assertLog(!myIsDisposed);

    NodeStringPair key = new NodeStringPair(node, propertyName);
    if (myNodePropertiesVersions.containsKey(key)) {
      return myNodePropertiesVersions.get(key);
    }
    return -1;
  }

  public void addRoleVersion(SNode node, int version) {
    LOG.assertLog(!myIsDisposed);
    myNodeRolesVersions.put(node, version);
  }

  public int getRoleVersion(SNode node) {
    LOG.assertLog(!myIsDisposed);

    if (myNodeRolesVersions.containsKey(node)) {
      return myNodeRolesVersions.get(node);
    }
    return -1;
  }

  public void addConceptNameVersion(SNode node, int version) {
    LOG.assertLog(!myIsDisposed);
    myNodeConceptVersions.put(node, version);
  }

  public int getConceptNameVersion(SNode node) {
    LOG.assertLog(!myIsDisposed);

    if (myNodeConceptVersions.containsKey(node)) {
      return myNodeConceptVersions.get(node);
    }
    return -1;
  }

  public void addLinkRoleVersion(SNode node, String linkRole, int version) {
    LOG.assertLog(!myIsDisposed);

    NodeStringPair link = new NodeStringPair(node, linkRole);
    if (myNodeLinkRolesVersions.contains(link)) {
      myNodeLinkRolesVersions.put(link, Math.min(version, myNodeLinkRolesVersions.get(link)));
    } else {
      myNodeLinkRolesVersions.put(link, version);
    }
  }

  public int getLinkRoleVersion(SNode node, String linkRole) {
    LOG.assertLog(!myIsDisposed);

    NodeStringPair key = new NodeStringPair(node, linkRole);
    if (myNodeLinkRolesVersions.containsKey(key)) {
      return myNodeLinkRolesVersions.get(key);
    }
    return -1;
  }

  public void addLinkTargetIdVersion(SNode node, String linkRole, int version) {
    LOG.assertLog(!myIsDisposed);

    NodeStringPair link = new NodeStringPair(node, linkRole);
    myNodeLinkTargetsVersions.put(link, version);
  }

  public int getLinkTargetIdVersion(SNode node, String linkRole) {
    LOG.assertLog(!myIsDisposed);

    NodeStringPair key = new NodeStringPair(node, linkRole);
    if (myNodeLinkTargetsVersions.containsKey(key)) {
      return myNodeLinkTargetsVersions.get(key);
    }
    return -1;
  }

  private static class NodeStringPair {
    private final SNode myNode;
    private final String myString;

    public NodeStringPair(@NotNull SNode node, @NotNull String s) {
      myNode = node;
      myString = s;
    }

    @Override
    public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      NodeStringPair property = (NodeStringPair) o;

      if (!myNode.equals(property.myNode)) return false;
      if (!myString.equals(property.myString)) return false;

      return true;
    }

    @Override
    public int hashCode() {
      int result = myNode.hashCode();
      result = 31 * result + myString.hashCode();
      return result;
    }
  }
}
