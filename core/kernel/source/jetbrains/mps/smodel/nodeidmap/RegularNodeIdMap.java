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

import gnu.trove.TLongObjectHashMap;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodeId;
import jetbrains.mps.smodel.SNodeId.Regular;

import java.util.Arrays;

public class RegularNodeIdMap implements INodeIdToNodeMap {
  private final TLongObjectHashMap<SNode> myRegularMap = new TLongObjectHashMap<SNode>();

  public int size() {
    return myRegularMap.size();
  }

  public SNode get(SNodeId key) {
    return myRegularMap.get(((Regular) key).getId());
  }

  public SNode put(SNodeId key, SNode value) {
    return myRegularMap.put(((Regular) key).getId(), value);
  }

  public boolean containsKey(SNodeId key) {
    return myRegularMap.containsKey(((Regular) key).getId());
  }

  public SNode remove(SNodeId key) {
    return myRegularMap.remove(((Regular) key).getId());
  }

  public Iterable<SNode> values() {
    return ((Iterable) Arrays.asList((myRegularMap.getValues())));
  }
}
