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
package jetbrains.mps.ide.ui;

import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;

public class SimpleSNodeTreeNode extends MPSTreeNodeEx {
  private SNode myNode;

  public SimpleSNodeTreeNode(SNode node, IOperationContext operationContext) {
    super(operationContext);
    myNode = node;
    setIcon(IconManager.getIconFor(myNode));
    setText(node.getPresentation());
  }

  @Override
  public SNode getSNode() {
    return myNode;
  }
}
