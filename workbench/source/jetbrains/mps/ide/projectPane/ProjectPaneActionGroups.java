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
package jetbrains.mps.ide.projectPane;

import jetbrains.mps.ide.actions.*;

public class ProjectPaneActionGroups {
  public static final String PROJECT_PANE_NODE_ACTIONS = NodeActions_ActionGroup.ID;
  public static final String PROJECT_PANE_MODEL_ACTIONS = ModelActions_ActionGroup.ID;
  public static final String PROJECT_PANE_MODULE_ACTIONS = ModuleActions_ActionGroup.ID;
  public static final String PROJECT_PANE_LANGUAGE_ACTIONS = LanguageActions_ActionGroup.ID;
  public static final String PROJECT_PANE_DEVKIT_ACTIONS = DevkitActions_ActionGroup.ID;
  public static final String PROJECT_PANE_PROJECT_ACTIONS = ProjectActions_ActionGroup.ID;
  public static final String PROJECT_PANE_SOLUTION_ACTIONS = SolutionActions_ActionGroup.ID;
  public static final String PROJECT_PANE_LIB_ACTIONS = LibraryActions_ActionGroup.ID;
  public static final String PROJECT_PANE_GENERATOR_ACTIONS = GeneratorActions_ActionGroup.ID;
  public static final String PROJECT_PANE_TRANSIENT_MODULES_ACTIONS = TransientModulesActions_ActionGroup.ID;
  public static final String PROJECT_PANE_PACKAGE_ACTIONS = PackageActions_ActionGroup.ID;
  public static final String PROJECT_PANE_NAMESPACE_ACTIONS = NamespaceActions_ActionGroup.ID;
  public static final String PROJECT_PANE_RUNTIME_FOLDER_ACTIONS = RuntimeFolderActions_ActionGroup.ID;

  // FIXME hardcoded action ID
  public static final String PROJECT_PANE_ACCESSORIES_ACTIONS = "jetbrains.mps.ide.devkit.actions.AccessoriesGroupActions_ActionGroup";

  public static final String PROJECT_PANE_FILE_ACTIONS = FileActions_ActionGroup.ID;
  public static final String PROJECT_PANE_FOLDER_ACTIONS = FolderActions_ActionGroup.ID;

  public static final String PROJECT_NEW_ACTIONS = ProjectNewActions_ActionGroup.ID;
  public static final String SOLUTION_NEW_ACTIONS = SolutionNewActions_ActionGroup.ID;

  // FIXME hardcoded action ID
  public static final String LANGUAGE_NEW_ACTIONS = "jetbrains.mps.ide.devkit.actions.LanguageNewActions_ActionGroup";
  // FIXME hardcoded action ID
  public static final String GENERATOR_NEW_ACTIONS = "jetbrains.mps.ide.devkit.actions.GeneratorNewActions_ActionGroup";
}
