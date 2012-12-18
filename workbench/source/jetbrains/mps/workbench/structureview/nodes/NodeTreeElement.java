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
package jetbrains.mps.workbench.structureview.nodes;

import com.intellij.ide.DataManager;
import com.intellij.ide.structureView.StructureViewTreeElement;
import com.intellij.navigation.ItemPresentation;
import com.intellij.openapi.actionSystem.DataContext;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.AsyncResult.Handler;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.ide.editorTabs.EditorTabDescriptor;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.ModuleContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.choose.nodes.NodePresentation;
import jetbrains.mps.workbench.editors.MPSEditorOpener;

public abstract class NodeTreeElement implements StructureViewTreeElement {
  protected SNodePointer myNode;

  public NodeTreeElement(SNodePointer node) {
    myNode = node;
  }

  public SNodePointer getValue() {
    return myNode;
  }

  public ItemPresentation getPresentation() {
    //todo use SNodePointer here, get rid of read action
    return ModelAccess.instance().runReadAction(new Computable<ItemPresentation>() {
      public ItemPresentation compute() {
        return new NodeTreeElementPresentation();
      }
    });
  }

  public boolean canNavigate() {
    return true;
  }

  public boolean canNavigateToSource() {
    return true;
  }

  public void navigate(boolean b) {
    DataManager.getInstance().getDataContextFromFocus().doWhenDone(new Handler<DataContext>() {
      public void run(final DataContext dataContext) {
        Project p = MPSDataKeys.PROJECT.getData(dataContext);
        if (p == null) return;

        IModule module = ModelAccess.instance().runReadAction(new Computable<IModule>() {
          public IModule compute() {
            SNode node = myNode.getNode();
            if (node == null) return null;
            SModel model = node.getModel();
            if (model == null) return null;
            return model.getModelDescriptor().getModule();
          }
        });

        //todo use SNodePointer here, get rid of read action
        SNode node = ModelAccess.instance().runReadAction(new Computable<SNode>() {
          public SNode compute() {
            return myNode.getNode();
          }
        });

        if (module == null) return;
        new MPSEditorOpener(p).editNode(node, new ModuleContext(module, p));
      }
    });
  }

  protected class NodeTreeElementPresentation extends NodePresentation {
    public NodeTreeElementPresentation() {
      super(NodeTreeElement.this.myNode.getNode());
    }

    public String doGetLocationString() {
      return null;
    }
  }
}
