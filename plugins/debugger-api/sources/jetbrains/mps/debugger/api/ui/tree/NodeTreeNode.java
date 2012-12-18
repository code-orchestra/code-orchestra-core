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
package jetbrains.mps.debugger.api.ui.tree;

import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.NotNull;

public class NodeTreeNode extends AbstractWatchableNode {
  public NodeTreeNode(@NotNull SNode node) {
    this(null, node);
  }

  public NodeTreeNode(IOperationContext context, @NotNull SNode node) {
    super(context, node);

    setNodeIdentifier(myNode.toString());
    setIcon(jetbrains.mps.ide.projectPane.Icons.DEFAULT_ICON);
  }
}
