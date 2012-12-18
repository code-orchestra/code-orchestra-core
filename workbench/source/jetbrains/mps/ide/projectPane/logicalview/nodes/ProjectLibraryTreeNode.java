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
package jetbrains.mps.ide.projectPane.logicalview.nodes;

import com.intellij.openapi.actionSystem.ActionGroup;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.ide.projectPane.ProjectPaneActionGroups;
import jetbrains.mps.ide.projectPane.SModelsSubtree;
import jetbrains.mps.project.AbstractModule;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.ModuleContext;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.workbench.action.ActionUtils;

public class ProjectLibraryTreeNode extends ProjectModuleTreeNode {
  private AbstractModule myLibrary;
  private boolean myShortNameOnly;

  private boolean myInitialized;

  protected ProjectLibraryTreeNode(AbstractModule library, MPSProject project, boolean shortNameOnly) {
    super(new ModuleContext(library, project));
    myShortNameOnly = shortNameOnly;
    myLibrary = library;

    IFile descriptorFile = myLibrary.getDescriptorFile();
    String id = descriptorFile == null ? myLibrary.getModuleFqName() : descriptorFile.getPath();
    setNodeIdentifier(id);
    setIcon(Icons.ACCESSORY_MODEL_ICON);
  }

  public Object getUserObject() {
    return myLibrary;
  }

  public IModule getModule() {
    return myLibrary;
  }

  public ActionGroup getQuickCreateGroup(boolean plain) {
    return null;
  }

  public ActionGroup getActionGroup() {
    return ActionUtils.getGroup(ProjectPaneActionGroups.PROJECT_PANE_LIB_ACTIONS);
  }

  protected String getModulePresentation() {
    String name = myLibrary.getModuleFqName();

    if (myShortNameOnly) {
      name = NameUtil.shortNameFromLongName(name);
    }

    if (name != null) {
      return name;
    }
    return "solution";
  }

  public boolean isInitialized() {
    return myInitialized;
  }

  public void init() {
    populate();
    myInitialized = true;
  }

  private void populate() {
    SModelsSubtree.create(this, getOperationContext(), myLibrary.getOwnModelDescriptors(), true);
  }
}
