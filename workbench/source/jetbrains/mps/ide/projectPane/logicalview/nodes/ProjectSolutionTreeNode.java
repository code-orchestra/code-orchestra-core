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
import jetbrains.mps.project.*;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.workbench.action.ActionUtils;

public class ProjectSolutionTreeNode extends jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectModuleTreeNode {
  private AbstractModule mySolution;
  private boolean myShortNameOnly;

  private boolean myInitialized;

  protected ProjectSolutionTreeNode(AbstractModule solution, MPSProject project, boolean shortNameOnly) {
    super(new ModuleContext(solution, project));
    myShortNameOnly = shortNameOnly;
    mySolution = solution;

    IFile descriptorFile = mySolution.getDescriptorFile();
    String id = descriptorFile == null ? mySolution.getModuleFqName() : descriptorFile.getPath();
    setNodeIdentifier(id);
    setIcon(Icons.SOLUTION_ICON);
  }

  public Object getUserObject() {
    return mySolution;
  }

  public IModule getModule() {
    return mySolution;
  }

  public ActionGroup getQuickCreateGroup(boolean plain) {
    return ActionUtils.getGroup(ProjectPaneActionGroups.SOLUTION_NEW_ACTIONS);
  }

  public ActionGroup getActionGroup() {
    return ActionUtils.getGroup(ProjectPaneActionGroups.PROJECT_PANE_SOLUTION_ACTIONS);
  }

  protected String getModulePresentation() {
    String name = mySolution.getModuleFqName();

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
    SModelsSubtree.create(this, getOperationContext());
  }
}
