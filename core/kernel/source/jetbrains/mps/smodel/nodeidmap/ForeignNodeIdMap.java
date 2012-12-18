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
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodeId;
import jetbrains.mps.smodel.SNodeId.Foreign;

import java.util.ArrayList;
import java.util.List;

//todo leave only Foreigns here
public class ForeignNodeIdMap implements INodeIdToNodeMap {
  private final THashMap<String,SNode> myForeignMap = new THashMap<String, SNode>();
  private final THashMap<SNodeId, SNode> myOtherMap = new THashMap<SNodeId, SNode>();

  public int size() {
    return myOtherMap.size() + myForeignMap.size();
  }

  public SNode get(SNodeId key) {
    if (key instanceof Foreign) {
      return myForeignMap.get(((Foreign) key).getId());
    }
    return myOtherMap.get(key);
  }

  public SNode put(SNodeId key, SNode value) {
    if (key instanceof Foreign) {
      return myForeignMap.put(((Foreign) key).getId(), value);
    }
    return myOtherMap.put(key, value);
  }

  public boolean containsKey(SNodeId key) {
    if (key instanceof Foreign) {
      return myForeignMap.containsKey(((Foreign) key).getId());
    }

    return myOtherMap.containsKey(key);
  }

  public SNode remove(SNodeId key) {
    if (key instanceof Foreign) {
      return myForeignMap.remove(((Foreign) key).getId());
    }

    return myOtherMap.remove(key);
  }

  public Iterable<SNode> values() {
    List<SNode> res = new ArrayList<SNode>();
    res.addAll(myOtherMap.values());
    res.addAll(myForeignMap.values());
    return res;
  }
}
