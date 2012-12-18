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
package jetbrains.mps.workbench;

import com.intellij.openapi.actionSystem.ActionGroup;
import com.intellij.openapi.actionSystem.DataKey;
import com.intellij.openapi.actionSystem.PlatformDataKeys;
import jetbrains.mps.ide.IEditor;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.Pair;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import javax.swing.tree.TreeNode;
import java.awt.Frame;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.List;

public class MPSDataKeys extends PlatformDataKeys {

  @CodeOrchestraPatch
  @Description(description = "Selected asset dirs/files absolute paths")
  public static final DataKey<List<String>> ASSET_ABSOLUTE_PATHS = DataKey.create("CodeOrchestra_AssetAbsolutePaths");

  @CodeOrchestraPatch
  @Description(description = "Selected asset dir/file absolute path")
  public static final DataKey<String> ASSET_ABSOLUTE_PATH = DataKey.create("CodeOrchestra_AssetAbsolutePath");

  @CodeOrchestraPatch
  @Description(description = "Selected asset dir/file relative path")
  public static final DataKey<String> ASSET_RELATIVE_PATH = DataKey.create("CodeOrchestra_AssetRelativePath");

  @Description(description = "current MPS project")
  public static final DataKey<MPSProject> MPS_PROJECT = DataKey.create("MPS_MPSProject");

  @Description(description = "selected node")
  public static final DataKey<SNode> NODE = DataKey.create("MPS_SNode");
  @Description(description = "selected nodes")
  public static final DataKey<List<SNode>> NODES = DataKey.create("MPS_SNode_List");

  @Description(description = "selected model")
  public static final DataKey<SModelDescriptor> MODEL = DataKey.create("MPS_SModelDescriptor");
  @Description(description = "context model")
  public static final DataKey<SModelDescriptor> CONTEXT_MODEL = DataKey.create("MPS_Context_SModelDescriptor");
  @Description(description = "selected models")
  public static final DataKey<List<SModelDescriptor>> MODELS = DataKey.create("MPS_SModelDescriptor_List");

  @Description(description = "selected module")
  public static final DataKey<IModule> MODULE = DataKey.create("MPS_IModule");
  @Description(description = "context module")
  public static final DataKey<IModule> CONTEXT_MODULE = DataKey.create("MPS_Context_IModule");
  @Description(description = "selected modules")
  public static final DataKey<List<IModule>> MODULES = DataKey.create("MPS_IModule_List");

  @Description(description = "selected package")
  public static final DataKey<String> VIRTUAL_PACKAGE = DataKey.create("MPS_VirtualPackage");
  @Description(description = "selected packages")
  public static final DataKey<List<String>> VIRTUAL_PACKAGES = DataKey.create("MPS_VirtualPackage_List");

  @Description(description = "operation context")
  public static final DataKey<IOperationContext> OPERATION_CONTEXT = DataKey.create("MPS_IOperationContext");
  @Description(description = "editor context")
  public static final DataKey<EditorContext> EDITOR_CONTEXT = DataKey.create("MPS_EditorContext");

  @Description(description = "node selected in MPS View")
  public static final DataKey<TreeNode> LOGICAL_VIEW_NODE = DataKey.create("MPS_ProjetPaneNode");
  @Description(description = "nodes selected in MPS View")
  public static final DataKey<List<TreeNode>> LOGICAL_VIEW_NODES = DataKey.create("MPS_ProjetPaneNodes");
  @Description(description = "number of selected items in MPS View")
  public static final DataKey<Integer> LOGICAL_VIEW_SELECTION_SIZE = DataKey.create("MPS_SelectedItemsNum");

  @Description(description = "rule model and id")
  public static final DataKey<Pair<String, String>> RULE_MODEL_AND_ID = DataKey.create("MPS_RuleModelAndID");

  @Description(description = "source node")
  public static final DataKey<SNode> SOURCE_NODE = DataKey.create("MPS_SourceNode");

  @Description(description = "current editor cell")
  public static final DataKey<EditorCell> EDITOR_CELL = DataKey.create("MPS_EditorCell");
  @Description(description = "editor create actions")
  public static final DataKey<ActionGroup> EDITOR_CREATE_GROUP = DataKey.create("MPS_EditorCreateGroup");
  @Description(description = "current editor")
  public static final DataKey<IEditor> MPS_EDITOR = DataKey.create("MPS_IEditor");
  @Description(description = "main window's Frame")
  public static final DataKey<Frame> FRAME = DataKey.create("MPS_Frame");
  @Description(description = "scope")
  public static final DataKey<IScope> SCOPE = DataKey.create("MPS_IScope");
  @Description(description = "current editor component")
  public static final DataKey<EditorComponent> EDITOR_COMPONENT = DataKey.create("MPS_EditorComponent");
  @Description(description = "active place")
  public static final DataKey<ActionPlace> PLACE = DataKey.create("MPS_Place");

  @Retention(RetentionPolicy.RUNTIME)
  @Target(ElementType.FIELD)
  public @interface Description {
    String description() default "";

    String longDescription() default "";
  }
}
