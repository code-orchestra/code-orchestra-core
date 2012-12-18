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

import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.event.SModelListener;
import jetbrains.mps.smodel.event.SModelRootEvent;

public abstract class ModelListener {
  private SModelRepositoryListener myModelRemovedListener = new ModelRemovedAdapter();
  private SModelListener myRootRemovedListener = new RootRemovedAdapter();
  private ImportantNodes myImportantNodes = new ImportantNodes();

  //------start-stop------

  public void startListening() {
    SModelRepository.getInstance().addModelRepositoryListener(myModelRemovedListener);
  }

  public void stopListening() {
    SModelRepository.getInstance().removeModelRepositoryListener(myModelRemovedListener);

    for (SModelReference r : myImportantNodes.keySet()) {
      SModelDescriptor d = SModelRepository.getInstance().getModelDescriptor(r);
      if (d == null) continue;
      d.removeModelListener(myRootRemovedListener);
    }
    myImportantNodes.clear();
  }

  //------event&callback------

  public void clearAspects() {
    stopListening();
    startListening();
  }

  public void aspectAdded(SNode node) {
    SModelDescriptor descriptor = node.getModel().getModelDescriptor();
    if (!myImportantNodes.containsKey(descriptor.getSModelReference())) {
      descriptor.addModelListener(myRootRemovedListener);
    }
    myImportantNodes.add(new SNodePointer(node));
  }

  protected abstract void onImportantRootRemoved(SNodePointer node);

  //------listeners------

  private class RootRemovedAdapter extends SModelAdapter {
    public void rootRemoved(SModelRootEvent event) {
      SNode root = event.getRoot();
      SNodePointer nodePointer = new SNodePointer(root);
      SModelReference modelRef = root.getModel().getSModelReference();

      if (!myImportantNodes.get(modelRef).contains(nodePointer)) return;

      myImportantNodes.get(modelRef).remove(nodePointer);
      onImportantRootRemoved(nodePointer);
    }
  }

  private class ModelRemovedAdapter extends SModelRepositoryAdapter {
    public void modelDeleted(SModelDescriptor modelDescriptor) {
      SModelReference ref = modelDescriptor.getSModelReference();
      if (!myImportantNodes.containsKey(ref)) return;

      for (SNodePointer node : myImportantNodes.get(ref)) {
        onImportantRootRemoved(node);
      }
      myImportantNodes.remove(ref);
    }
  }
}
