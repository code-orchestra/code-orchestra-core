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
package jetbrains.mps.ide.ui.smodel;

import com.intellij.openapi.actionSystem.ActionGroup;
import com.intellij.openapi.actionSystem.ActionManager;
import jetbrains.mps.ide.actions.ReferenceNodeActions_ActionGroup;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SReference;
import jetbrains.mps.workbench.editors.MPSEditorOpener;

public class ReferenceTreeNode extends TextTreeNode {
  private final SReference myRef;

  public ReferenceTreeNode(IOperationContext context, SReference ref) {
    super(ref.getRole() + ": " + ref.getTargetNode(), context);
    myRef = ref;
    setIcon(Icons.DEFAULT_ICON);
  }

  public void doubleClick() {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        SNode target = myRef.getTargetNode();
        if (target == null) return;

        getOperationContext().getComponent(MPSEditorOpener.class).openNode(target);
      }
    });
  }

  public SReference getRef() {
    return myRef;
  }

  @Override
  public ActionGroup getActionGroup() {
    return ((ActionGroup) ActionManager.getInstance().getAction(ReferenceNodeActions_ActionGroup.class.getName()));
  }

  public boolean isLeaf() {
    return true;
  }
}
