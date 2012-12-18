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

package jetbrains.mps.ide.editorTabs.tabfactory.tabs.baseListening;

import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SNodePointer;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

class ImportantNodes extends HashMap<SModelReference, Set<SNodePointer>> {
  public void add(SNodePointer node) {
    SModelReference modelRef = node.getNode().getModel().getSModelReference();

    Set<SNodePointer> nodes = get(modelRef);
    nodes.add(node);
    put(modelRef, nodes);
  }

  public Set<SNodePointer> get(SModelReference modelRef) {
    Set<SNodePointer> nodes = super.get(modelRef);
    if (nodes != null) return nodes;
    return new HashSet<SNodePointer>();
  }
}
