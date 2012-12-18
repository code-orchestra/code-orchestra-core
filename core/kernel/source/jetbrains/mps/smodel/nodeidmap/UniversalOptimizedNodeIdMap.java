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
package jetbrains.mps.smodel.nodeidmap;

import gnu.trove.THashMap;
import gnu.trove.TLongObjectHashMap;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodeId;
import jetbrains.mps.smodel.SNodeId.Regular;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class UniversalOptimizedNodeIdMap implements INodeIdToNodeMap {
  private final TLongObjectHashMap<SNode> myRegularMap = new TLongObjectHashMap<SNode>();
  private final THashMap<SNodeId, SNode> myOtherMap = new THashMap<SNodeId, SNode>();

  public int size() {
    return myOtherMap.size() + myRegularMap.size();
  }

  public SNode get(SNodeId key) {
    if (key instanceof Regular) {
      return myRegularMap.get(((Regular) key).getId());
    }
    return myOtherMap.get(key);
  }

  public SNode put(SNodeId key, SNode value) {
    if (key instanceof Regular) {
      return myRegularMap.put(((Regular) key).getId(), value);
    }
    return myOtherMap.put(key, value);
  }

  public boolean containsKey(SNodeId key) {
    if (key instanceof Regular) {
      return myRegularMap.containsKey(((Regular) key).getId());
    }

    return myOtherMap.containsKey(key);
  }

  public SNode remove(SNodeId key) {
    if (key instanceof Regular) {
      return myRegularMap.remove(((Regular) key).getId());
    }

    return myOtherMap.remove(key);
  }

  public Iterable<SNode> values() {
    List<SNode> res = new ArrayList<SNode>();
    res.addAll(myOtherMap.values());
    res.addAll(((List) Arrays.asList(myRegularMap.getValues())));
    return res;
  }
}
