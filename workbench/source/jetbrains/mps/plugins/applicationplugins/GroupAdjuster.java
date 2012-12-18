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
package jetbrains.mps.plugins.applicationplugins;

import com.intellij.ide.ui.customization.CustomActionsSchema;
import com.intellij.openapi.actionSystem.AnAction;
import com.intellij.openapi.actionSystem.DefaultActionGroup;
import com.intellij.openapi.actionSystem.IdeActions;
import com.intellij.openapi.actionSystem.ex.ActionManagerEx;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ProjectManager;
import com.intellij.openapi.wm.ex.WindowManagerEx;
import com.intellij.openapi.wm.impl.IdeFrameImpl;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.ide.IdeMain.TestMode;
import jetbrains.mps.ide.projectPane.ProjectPaneActionGroups;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.workbench.ActionPlace;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.action.BaseGroup;

import javax.swing.SwingUtilities;
import java.util.ArrayList;
import java.util.List;

public class GroupAdjuster {

  private static void addPlace(String groupId, ActionPlace place) {
    BaseGroup group = ActionUtils.getGroup(groupId);
    if (group != null)
      group.addPlace(place, null);
  }

  public static void adjustTopLevelGroups(BaseApplicationPlugin idePlugin) {
    addPlace(ProjectPaneActionGroups.PROJECT_PANE_NODE_ACTIONS, ActionPlace.PROJECT_PANE_SNODE);
    addPlace(ProjectPaneActionGroups.PROJECT_PANE_MODEL_ACTIONS, ActionPlace.PROJECT_PANE_SMODEL);
    addPlace(ProjectPaneActionGroups.PROJECT_PANE_MODULE_ACTIONS, ActionPlace.PROJECT_PANE_MODULE);
    addPlace(ProjectPaneActionGroups.PROJECT_PANE_LANGUAGE_ACTIONS, ActionPlace.PROJECT_PANE_LANGUAGE);
    addPlace(ProjectPaneActionGroups.PROJECT_PANE_DEVKIT_ACTIONS, ActionPlace.PROJECT_PANE_DEVKIT);
    addPlace(ProjectPaneActionGroups.PROJECT_PANE_PROJECT_ACTIONS, ActionPlace.PROJECT_PANE_PROJECT);
    addPlace(ProjectPaneActionGroups.PROJECT_PANE_SOLUTION_ACTIONS, ActionPlace.PROJECT_PANE_SOLUTION);
    addPlace(ProjectPaneActionGroups.PROJECT_PANE_LIB_ACTIONS, ActionPlace.PROJECT_PANE_LIBRARY);
    addPlace(ProjectPaneActionGroups.PROJECT_PANE_GENERATOR_ACTIONS, ActionPlace.PROJECT_PANE_GENERATOR);
    addPlace(ProjectPaneActionGroups.PROJECT_PANE_TRANSIENT_MODULES_ACTIONS, ActionPlace.PROJECT_PANE_TRANSIENT_MODULES);
    addPlace(ProjectPaneActionGroups.PROJECT_PANE_PACKAGE_ACTIONS, ActionPlace.PROJECT_PANE_PACKAGE);
    addPlace(ProjectPaneActionGroups.PROJECT_PANE_NAMESPACE_ACTIONS, ActionPlace.PROJECT_PANE_NAMESPACE);
    addPlace(ProjectPaneActionGroups.PROJECT_PANE_RUNTIME_FOLDER_ACTIONS, ActionPlace.PROJECT_PANE_RUNTIME_FOLDER);
    addPlace(ProjectPaneActionGroups.PROJECT_PANE_ACCESSORIES_ACTIONS, ActionPlace.PROJECT_PANE_ACCESSORIES);
    addPlace(ProjectPaneActionGroups.PROJECT_NEW_ACTIONS, ActionPlace.PROJECT_PANE_PROJECT);
    addPlace(ProjectPaneActionGroups.SOLUTION_NEW_ACTIONS, ActionPlace.PROJECT_PANE_SOLUTION);
    addPlace(ProjectPaneActionGroups.LANGUAGE_NEW_ACTIONS, ActionPlace.PROJECT_PANE_LANGUAGE);
    addPlace(ProjectPaneActionGroups.GENERATOR_NEW_ACTIONS, ActionPlace.PROJECT_PANE_GENERATOR);

    addPlace(ProjectPaneActionGroups.PROJECT_PANE_FILE_ACTIONS, ActionPlace.PROJECT_PANE_FILE);
    addPlace(ProjectPaneActionGroups.PROJECT_PANE_FOLDER_ACTIONS, ActionPlace.PROJECT_PANE_FOLDER);

    List<BaseGroup> editorGroups = new ArrayList<BaseGroup>();
    editorGroups.add(ActionUtils.getGroup(EditorComponent.EDITOR_POPUP_MENU_ACTIONS));
    for (BaseGroup group : editorGroups) {
      group.addPlace(ActionPlace.EDITOR, null);
    }

    List<BaseGroup> mainMenuGroups = new ArrayList<BaseGroup>();
    DefaultActionGroup mainMenuGroup = ActionUtils.getDefaultGroup(IdeActions.GROUP_MAIN_MENU);
    ActionManagerEx manager = ActionManagerEx.getInstanceEx();
    for (String id : manager.getActionIds("")) {
      AnAction action = manager.getAction(id);
      if (!(action instanceof BaseGroup)) continue;
      BaseGroup group = ((BaseGroup) action);
      if (ActionUtils.contains(mainMenuGroup, group)) {
        mainMenuGroups.add(group);
      }
    }

    for (BaseGroup group : mainMenuGroups) {
      group.addPlace(null, null);
    }
  }


  public static void refreshCustomizations() {
    if (!IdeMain.getTestMode().equals(TestMode.NO_TEST)) return;
    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        CustomActionsSchema schema = CustomActionsSchema.getInstance();
        schema.resetMainActionGroups();
        setCustomizationSchemaForCurrentProjects();
      }
    });
  }

  private static void setCustomizationSchemaForCurrentProjects() {
    final Project[] openProjects = ProjectManager.getInstance().getOpenProjects();
    for (Project project : openProjects) {
      final IdeFrameImpl frame = WindowManagerEx.getInstanceEx().getFrame(project);
      if (frame != null) {
        frame.updateToolbar();
        frame.updateMenuBar();
      }
    }
    final IdeFrameImpl frame = WindowManagerEx.getInstanceEx().getFrame(null);
    if (frame != null) {
      frame.updateToolbar();
      frame.updateMenuBar();
    }
  }
}
