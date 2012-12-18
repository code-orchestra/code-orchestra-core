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

import javax.swing.Icon;
import javax.swing.ImageIcon;

public class Icons {

  public static final Icon DEFAULT_ICON = new ImageIcon(Icons.class.getResource("nodes/default.png"));
  public static final Icon DEFAULT_ROOT_ICON = new ImageIcon(Icons.class.getResource("nodes/defaultRootNode.png"));
  public static final Icon UNKNOWN_ICON = new ImageIcon(Icons.class.getResource("nodes/unknown.png"));
  public static final Icon DEFAULT_NODE_ICON = new ImageIcon(Icons.class.getResource("nodes/defaultNode.png"));
  public static final Icon MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/model.png"));
  public static final Icon LANGUAGE_ICON = new ImageIcon(Icons.class.getResource("nodes/language.png"));
  public static final Icon PROJECT_LANGUAGE_ICON = new ImageIcon(Icons.class.getResource("nodes/projectLanguage.png"));
  public static final Icon JAVA_ICON = new ImageIcon(Icons.class.getResource("nodes/java.png"));
  public static final Icon TEXT_ICON = new ImageIcon(Icons.class.getResource("nodes/text.png"));
  public static final Icon LIB_ICON = new ImageIcon(Icons.class.getResource("nodes/ppLib.png"));
  public static final Icon PROJECT_ICON = new ImageIcon(Icons.class.getResource("nodes/project.png"));
  public static final Icon LOGICAL_VIEW_ICON = new ImageIcon(Icons.class.getResource("other/logical_view.png"));
  public static final Icon PROJECT_LANGUAGES_ICON = new ImageIcon(Icons.class.getResource("nodes/projectLanguages.png"));
  public static final Icon PROJECT_MODELS_ICON = new ImageIcon(Icons.class.getResource("nodes/projectModels.png"));
  public static final Icon PROJECT_MODELS_EXPANDED_ICON = new ImageIcon(Icons.class.getResource("nodes/projectModelsExpanded.png"));
  public static final Icon LANGUAGES_ICON = new ImageIcon(Icons.class.getResource("nodes/languages.png"));
  public static final Icon EDITORS_ICON = new ImageIcon(Icons.class.getResource("nodes/editors.png"));
  public static final Icon GENERATORS_ICON = new ImageIcon(Icons.class.getResource("nodes/generators.png"));
  public static final Icon GENERATOR_ICON = new ImageIcon(Icons.class.getResource("nodes/generator.png"));
  public static final Icon MODULE_DEPENDENCIES_ICON = new ImageIcon(Icons.class.getResource("nodes/moduleDependencies.png"));
  public static final Icon TRANSIENT_MODELS_ICON = new ImageIcon(Icons.class.getResource("nodes/transientModels.png"));

  public static final Icon PROPERTIES_ICON = new ImageIcon(Icons.class.getResource("nodes/properties.png"));

  public static final Icon SVN_PROPERTIES_ICON = new ImageIcon(Icons.class.getResource("nodes/svn.png"));

  public static final Icon DELETE_MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/deleteModel.png"));
  public static final Icon CREATE_NODE_ICON = new ImageIcon(Icons.class.getResource("nodes/createNode.png"));
  public static final Icon DELETE_NODE_ICON = new ImageIcon(Icons.class.getResource("nodes/deleteNode.png"));

  public static final Icon OUTPUT_VIEW_ICON = new ImageIcon(Icons.class.getResource("nodes/outputView.png"));
  public static final Icon MESSAGE_VIEW_ICON = new ImageIcon(Icons.class.getResource("nodes/messageView.png"));
  public static final Icon HISTORY_VIEW_ICON = new ImageIcon(Icons.class.getResource("nodes/historyView.png"));

  public static final Icon STRUCTURE_MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/structureModel.png"));
  public static final Icon EDITOR_MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/editorModel.png"));
  public static final Icon ACTIONS_MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/actionsModel.png"));
  public static final Icon TEMPLATES_MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/templatesModel.png"));
  public static final Icon TYPESYSTEM_MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/typesystemModel.png"));
  public static final Icon INTENTIONS_MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/intentionsModel.png"));
  public static final Icon FIND_USAGES_MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/findUsagesModel.png"));
  public static final Icon PLUGIN_MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/pluginModel.png"));
  public static final Icon BEHAVIOR_MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/behaviorModel.png"));
  public static final Icon CONSTRAINTS_MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/constraintsModel.png"));
  public static final Icon DATA_FLOW_MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/dataFlowModel.png"));
  public static final Icon TEST_MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/testModel.png"));
  public static final Icon REFACTORINGS_MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/refactoringsModel.png"));
  public static final Icon STUBS_MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/stubsModel.png"));
  public static final Icon TEXT_GEN_MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/textGenModel.png"));
  public static final Icon ACCESSORY_MODEL_ICON = new ImageIcon(Icons.class.getResource("nodes/accessoryModel.png"));

  public static final Icon OPENED_FOLDER = new ImageIcon(Icons.class.getResource("fileSystem/icons/TreeOpened.png"));
  public static final Icon CLOSED_FOLDER = new ImageIcon(Icons.class.getResource("fileSystem/icons/TreeClosed.png"));
  public static final Icon OPENED_FOLDER_GOTHIC = new ImageIcon(Icons.class.getResource("other/openedFolder_gothic.png"));
  public static final Icon CLOSED_FOLDER_GOTHIC = new ImageIcon(Icons.class.getResource("other/closedFolder_gothic.png"));

  public static final Icon MODIFIED_ICON = new ImageIcon(Icons.class.getResource("nodes/modified.png"));

  @Deprecated
  public static final Icon USAGES_ICON = new ImageIcon(Icons.class.getResource("nodes/usages.png"));
  public static final Icon CELL_EXPLORER_ICON = new ImageIcon(Icons.class.getResource("nodes/cellExplorer.png"));
  public static final Icon CELLS_ICON = new ImageIcon(Icons.class.getResource("nodes/cells.png"));
  public static final Icon CELL_CONSTANT_ICON = new ImageIcon(Icons.class.getResource("nodes/cellConst.png"));
  public static final Icon CELL_DEFAULT_ICON = new ImageIcon(Icons.class.getResource("nodes/cellDefault.png"));
  public static final Icon CELL_COMPONENT_ICON = new ImageIcon(Icons.class.getResource("nodes/cellComponent.png"));
  public static final Icon CELL_ERROR_ICON = new ImageIcon(Icons.class.getResource("nodes/cellError.png"));
  public static final Icon CELL_PROPERTY_ICON = new ImageIcon(Icons.class.getResource("nodes/cellProperty.png"));
  public static final Icon CELL_KEY_MAP_ICON = new ImageIcon(Icons.class.getResource("nodes/cellKeyMap.png"));
  public static final Icon CELL_ACTION_KEY_ICON = new ImageIcon(Icons.class.getResource("nodes/cellActionKey.png"));
  public static final Icon CELL_TREE_ICON = new ImageIcon(Icons.class.getResource("nodes/cellTree.png"));

  public static final Icon DERIVATION_NODE_ICON = new ImageIcon(Icons.class.getResource("nodes/gadget.png"));
  public static final Icon INFER_FOUND_ICON = new ImageIcon(Icons.class.getResource("nodes/inferFound.png"));
  public static final Icon INFER_FAILED_ICON = new ImageIcon(Icons.class.getResource("nodes/inferFailed.png"));
  public static final Icon INFER_QUESTION_ICON = new ImageIcon(Icons.class.getResource("nodes/inferQuestion.png"));

  public static final Icon INSPECTOR_ICON = new ImageIcon(Icons.class.getResource("nodes/inspector.png"));

  public static final Icon DELETE_ICON = new ImageIcon(Icons.class.getResource("other/cancel.png"));
  public static final Icon FIND_ICON = new ImageIcon(Icons.class.getResource("other/find.png"));

  public static final Icon HIERARCHY_ICON = new ImageIcon(Icons.class.getResource("nodes/hierarchyView.png"));

  public static final Icon DISCARD_ALL_ICON = new ImageIcon(Icons.class.getResource("nodes/discardAll.png"));
  public static final Icon SELECT_ALL_ICON = new ImageIcon(Icons.class.getResource("nodes/selectAll.png"));

  public static final Icon SOLUTION_ICON = new ImageIcon(Icons.class.getResource("nodes/solution.png"));

  public static final Icon DEVKIT_ICON = new ImageIcon(Icons.class.getResource("nodes/devkit.png"));

  public static final Icon CFG_END_ICON = new ImageIcon(Icons.class.getResource("nodes/cfgEnd.png"));

  public static final Icon JDK_OPENED_FOLDER = new ImageIcon(Icons.class.getResource("nodes/ppJdkOpen.png"));
  public static final Icon JDK_CLOSED_FOLDER = new ImageIcon(Icons.class.getResource("nodes/ppJdkClosed.png"));

  public static final Icon MINIMIZE_ICON = new ImageIcon(Icons.class.getResource("nodes/minimize.png"));
  public static final Icon CLOSE_ICON = new ImageIcon(Icons.class.getResource("nodes/close.png"));
  public static final Icon MINIMIZE_DISABLED_ICON = new ImageIcon(Icons.class.getResource("nodes/minimizeDis.png"));
  public static final Icon CLOSE_DISABLED_ICON = new ImageIcon(Icons.class.getResource("nodes/closeDis.png"));

  public static final Icon PROPERTY_ICON = new ImageIcon(Icons.class.getResource("nodes/property.png"));
  public static final Icon REFERENCE_ICON = new ImageIcon(Icons.class.getResource("nodes/reference.png"));
  public static final Icon PROP_AND_REF = new ImageIcon(Icons.class.getResource("nodes/propAndRef.png"));
  public static final Icon AUTOSCROLL_TO_SOURCE = new ImageIcon(Icons.class.getResource("nodes/autoscrollToSource.png"));
  public static final Icon AUTOSCROLL_FROM_SOURCE = new ImageIcon(Icons.class.getResource("nodes/autoscrollFromSource.png"));

  public static final Icon STRONG_SUBTYPE_ICON = new ImageIcon(Icons.class.getResource("nodes/strongSubtype.png"));

  public static final Icon MODULE_GROUP_CLOSED = new ImageIcon(Icons.class.getResource("nodes/moduleGroupClosed.png"));
  public static final Icon MODULE_GROUP_OPENED = new ImageIcon(Icons.class.getResource("nodes/moduleGroupOpen.png"));

  public static final Icon BOOKMARK_0 = new ImageIcon(Icons.class.getResource("other/bookmark0.png"));
  public static final Icon BOOKMARK_1 = new ImageIcon(Icons.class.getResource("other/bookmark1.png"));
  public static final Icon BOOKMARK_2 = new ImageIcon(Icons.class.getResource("other/bookmark2.png"));
  public static final Icon BOOKMARK_3 = new ImageIcon(Icons.class.getResource("other/bookmark3.png"));
  public static final Icon BOOKMARK_4 = new ImageIcon(Icons.class.getResource("other/bookmark4.png"));
  public static final Icon BOOKMARK_5 = new ImageIcon(Icons.class.getResource("other/bookmark5.png"));
  public static final Icon BOOKMARK_6 = new ImageIcon(Icons.class.getResource("other/bookmark6.png"));
  public static final Icon BOOKMARK_7 = new ImageIcon(Icons.class.getResource("other/bookmark7.png"));
  public static final Icon BOOKMARK_8 = new ImageIcon(Icons.class.getResource("other/bookmark8.png"));
  public static final Icon BOOKMARK_9 = new ImageIcon(Icons.class.getResource("other/bookmark9.png"));
  public static final Icon BOOKMARK_UNNUMBERED = new ImageIcon(Icons.class.getResource("other/check.png"));

  public static final Icon REVERT = new ImageIcon(Icons.class.getResource("vc/revert.png"));
  public static final Icon ROLLBACK = new ImageIcon(Icons.class.getResource("vc/rollback.png"));
  public static final Icon APPLY = new ImageIcon(Icons.class.getResource("vc/apply.png"));
  public static final Icon EXCLUDE = new ImageIcon(Icons.class.getResource("vc/exclude.png"));
}
