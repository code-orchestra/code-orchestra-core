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

import jetbrains.mps.ide.projectPane.logicalview.highlighting.listeners.ListenersFactory.NodeListeners;
import jetbrains.mps.ide.projectPane.logicalview.highlighting.visitor.ProjectPaneTreeErrorChecker;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectModuleTreeNode;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;

public class ModuleNodeListeners implements NodeListeners {
  private ProjectModuleTreeNode myNode;

  private ProjectPaneTreeErrorChecker myChecker = new ProjectPaneTreeErrorChecker();
  private MyReloadAdapter myHandler = new MyReloadAdapter();

  public ModuleNodeListeners(ProjectModuleTreeNode node) {
    myNode = node;
  }

  public void startListening() {
    myChecker.visitNode(myNode);
    ClassLoaderManager.getInstance().addReloadHandler(myHandler);
  }

  public void stopListening() {
    ClassLoaderManager.getInstance().removeReloadHandler(myHandler);
  }

  private class MyReloadAdapter extends ReloadAdapter {
    public void onAfterReload() {
      myChecker.visitNode(myNode);
    }
  }
}
