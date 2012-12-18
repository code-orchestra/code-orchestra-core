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
package jetbrains.mps.typesystem.inference.util;

import gnu.trove.THashSet;
import jetbrains.mps.lang.pattern.util.IMatchModifier;
import jetbrains.mps.lang.pattern.util.MatchingUtil;
import jetbrains.mps.smodel.SNode;

import java.util.*;

public class StructuralNodeSet<T> implements Set<SNode> {
  private Set<SNodeWrapper> myWrappers = new HashSet<SNodeWrapper>();

  public StructuralNodeSet() {
  }

  public StructuralNodeSet(StructuralNodeSet<T> set) {
    myWrappers.addAll(set.myWrappers);
  }

  public StructuralNodeSet(Collection<? extends SNode> collection) {
    addAll(collection);
  }

  public boolean containsStructurally(SNode ourNode) {
    return myWrappers.contains(new SNodeWrapper(ourNode));
  }

  public boolean removeStructurally(SNode ourNode) {
    return myWrappers.remove(new SNodeWrapper(ourNode));
  }

  public boolean addStructurally(SNode ourNode) {
    return myWrappers.add(new SNodeWrapper(ourNode));
  }

  public boolean addCollectionStructurally(Collection<? extends SNode> ourNodes) {
    boolean result = false;
    if (ourNodes == null) return false;
    for (SNode ourNode : ourNodes) {
      boolean someResult = addStructurally(ourNode);
      result = result || someResult;
    }
    return result;
  }

  public boolean addAllStructurally(StructuralNodeSet ourNodes) {
    return myWrappers.addAll(ourNodes.myWrappers);
  }

  public void putAllStructurally(StructuralNodeSet<T> ourNodes) {
    for (SNodeWrapper w : ourNodes.myWrappers) {
      if (!myWrappers.contains(w)) {
        myWrappers.add(w);
      }
    }
  }

  public int size() {
    return myWrappers.size();
  }

  public boolean isEmpty() {
    return myWrappers.isEmpty();
  }

  public void clear() {
    myWrappers.clear();
  }

  public boolean contains(Object o) {
    if (!(o instanceof SNode)) return false;
    return containsStructurally((SNode) o);
  }

  public Iterator<SNode> iterator() {
    return getNodes().iterator();
  }

  private List<SNode> getNodes() {
    List<SNode> nodes = new ArrayList<SNode>();
    for (SNodeWrapper w : myWrappers) {
      nodes.add(w.myNode);
    }
    return nodes;
  }

  public boolean add(SNode o) {
    return addStructurally(o);
  }

  public boolean addAll(Collection<? extends SNode> c) {
    return addCollectionStructurally(c);
  }


  public boolean remove(Object o) {
    if (!(o instanceof SNode)) return false;
    return removeStructurally((SNode) o);
  }


  public Object[] toArray() {
    return getNodes().toArray();
  }

  public <T> T[] toArray(T[] a) {
    return getNodes().toArray(a);
  }

  public boolean containsAll(Collection<?> c) {
    throw new UnsupportedOperationException();
  }

  public boolean retainAll(Collection<?> c) {
    throw new UnsupportedOperationException();
  }

  public boolean removeAll(Collection<?> c) {
    throw new UnsupportedOperationException();
  }

  public void addAndRewrite(SNode node) {
    if (!containsStructurally(node)) {
      myWrappers.add(new SNodeWrapper(node));
    } else {
      SNodeWrapper wrapper = new SNodeWrapper(node);
      myWrappers.remove(wrapper);
      myWrappers.add(wrapper);
    }
  }

  private static class SNodeWrapper {
    private SNode myNode;
    private int myHashCode;


    private SNodeWrapper(SNode node) {
      myNode = node;
      myHashCode = StructuralCollectionUtil.hashCode(myNode);
    }

    @Override
    public int hashCode() {
      return myHashCode;
    }

    @Override
    public boolean equals(Object obj) {
      if (!(obj instanceof SNodeWrapper)) return false;
      SNodeWrapper wrapper = (SNodeWrapper) obj;
      return MatchingUtil.matchNodes(wrapper.myNode, myNode, IMatchModifier.DEFAULT, false);
    }
  }
}
