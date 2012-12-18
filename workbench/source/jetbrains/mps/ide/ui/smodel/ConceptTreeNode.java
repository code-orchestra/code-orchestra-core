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

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.ide.ui.MPSTreeNodeEx;
import jetbrains.mps.project.ModuleContext;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.workbench.editors.MPSEditorOpener;

class ConceptTreeNode extends MPSTreeNodeEx {
  private SNode myNode;
  private boolean myInitialized;

  public ConceptTreeNode(IOperationContext operationContext, SNode node) {
    super(operationContext);
    myNode = node;

    SNode concept = getSNode();
    if (concept != null) {
      setIcon(IconManager.getIconFor(concept));
      setNodeIdentifier(concept.getName());
    } else {
      setNodeIdentifier(myNode.getConceptFqName());
    }
  }

  public SNode getSNode() {
    return myNode.getConceptDeclarationNode();
  }

  public boolean isInitialized() {
    return myInitialized;
  }

  protected void doInit() {
    super.doInit();
    myInitialized = true;
  }

  protected void doUpdate() {
    super.doUpdate();
    myInitialized = false;
  }

  public void doubleClick() {
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        SNode concept = getSNode();
        if (concept == null) return;
        Project project = getOperationContext().getProject();
        new MPSEditorOpener(project).editNode(concept, ModuleContext.create(concept, project));
      }
    });
  }
}
