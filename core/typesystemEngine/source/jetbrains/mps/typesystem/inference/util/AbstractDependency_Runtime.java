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
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.CollectionUtil;

import java.util.Set;

public abstract class AbstractDependency_Runtime implements IDependency_Runtime {
  public SNode getSourceNode(SNode targetNode) {
    return null;
  }

  public Set<SNode> getSourceNodes(SNode targetNode) {
    SNode node = getSourceNode(targetNode);
    if (node == null) {
      return new THashSet<SNode>();
    }
    return CollectionUtil.set(node);
  }
}
