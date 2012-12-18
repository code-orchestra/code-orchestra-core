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
package jetbrains.mps.ide.projectPane.logicalview.highlighting.listeners;

import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectModuleTreeNode;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectTreeNode;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.smodel.SModelTreeNode;

public class ListenersFactory {
  public static NodeListeners createListenersFor(MPSTreeNode node) {
    if (node instanceof SModelTreeNode) {
      SModelTreeNode modelNode = (SModelTreeNode) node;
      if (modelNode.getSModelDescriptor() == null) return null;
      return new SModelNodeListeners(modelNode);
    } else if (node instanceof ProjectModuleTreeNode){
      return new ModuleNodeListeners(((ProjectModuleTreeNode) node));
    }

    return null;
  }

  public interface NodeListeners {
    public void startListening();

    public void stopListening();
  }
}
