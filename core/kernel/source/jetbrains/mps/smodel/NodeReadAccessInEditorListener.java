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

import jetbrains.mps.logging.Logger;
import jetbrains.mps.util.Pair;

import java.util.HashSet;
import java.util.Set;

public class NodeReadAccessInEditorListener implements INodesReadListener {
  protected HashSet<SNode> myNodesToDependOn = new HashSet<SNode>();
  protected HashSet<SNodePointer> myReferentTargetsToDependOn = new HashSet<SNodePointer>();
  protected HashSet<Pair<SNodePointer, String>> myDirtilyReadAccessedProperties = new HashSet<Pair<SNodePointer, String>>();
  protected HashSet<Pair<SNodePointer, String>> myExistenceReadAccessProperties = new HashSet<Pair<SNodePointer, String>>();

  private Set<Pair<SNodePointer, String>> myCleanlyReadAccessedProperties = new HashSet<Pair<SNodePointer, String>>();

  private static final Logger LOG = Logger.getLogger(NodeReadAccessInEditorListener.class);

  public Set<SNode> getNodesToDependOn() {
    return myNodesToDependOn;
  }

  public Set<SNodePointer> getRefTargetsToDependOn() {
    return myReferentTargetsToDependOn;
  }

  public HashSet<Pair<SNodePointer, String>> getDirtilyReadAccessedProperties() {
    return myDirtilyReadAccessedProperties;
  }

  public HashSet<Pair<SNodePointer, String>> getExistenceReadAccessProperties() {
    return myExistenceReadAccessProperties;
  }

  public Set<Pair<SNodePointer, String>> popCleanlyReadAccessedProperties() {
    Set<Pair<SNodePointer, String>> result = myCleanlyReadAccessedProperties;
    myCleanlyReadAccessedProperties = new HashSet<Pair<SNodePointer, String>>();
    return result;
  }

  public void addNodesToDependOn(Set<SNode> nodes) {
    if (nodes == null) {
      LOG.error("passing null nodes collection to depend on");
      return;
    }
    myNodesToDependOn.addAll(nodes);
  }

  public void addRefTargetsToDependOn(Set<SNodePointer> targets) {
    myReferentTargetsToDependOn.addAll(targets);
  }

  public void propertyDirtyReadAccess(SNode node, String propertyName) {
    myDirtilyReadAccessedProperties.add(new Pair<SNodePointer, String>(new SNodePointer(node), propertyName));
    //refactored here from calling after unique usage
    nodeUnclassifiedReadAccess(node);
  }

  public void propertyCleanReadAccess(SNode node, String propertyName) {
    myCleanlyReadAccessedProperties.add(new Pair<SNodePointer, String>(new SNodePointer(node), propertyName));
  }

  public void nodeUnclassifiedReadAccess(SNode node) {
    myNodesToDependOn.add(node);
  }

  @Override
  public void modelNodesReadAccess(SModel model) {
    /* ignored */
  }

  public void nodeReferentReadAccess(SNode node, String referentRole, SNode referent) {
     addRefTargetToDependOn(new SNodePointer(referent));
  }

  public void addRefTargetToDependOn(SNodePointer target) {
    myReferentTargetsToDependOn.add(target);
  }

  public void propertyExistenceAccess(SNode node, String propertyName) {
    myExistenceReadAccessProperties.add(new Pair<SNodePointer, String>(new SNodePointer(node), propertyName));
    //refactored here from from calling after unique usage
    nodeUnclassifiedReadAccess(node);
  }

  public void clearCleanlyReadAccessProperties() {
    myCleanlyReadAccessedProperties = new HashSet<Pair<SNodePointer, String>>();
  }

  public void nodeChildReadAccess(SNode node, String childRole, SNode child) {
    nodeUnclassifiedReadAccess(node);
  }

  public void nodePropertyReadAccess(SNode node, String propertyName, String value) {
    // todo remove when refactoring completed
  }
}
