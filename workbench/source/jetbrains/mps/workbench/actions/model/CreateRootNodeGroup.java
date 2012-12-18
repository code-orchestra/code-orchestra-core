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
package jetbrains.mps.workbench.actions.model;

import com.intellij.ide.FileEditorProvider;
import com.intellij.ide.SelectInContext;
import com.intellij.ide.SelectInTarget;
import com.intellij.ide.projectView.ProjectView;
import com.intellij.ide.projectView.impl.AbstractProjectViewPane;
import com.intellij.openapi.actionSystem.ActionManager;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.vfs.VirtualFile;
import jetbrains.mps.ide.IEditor;
import jetbrains.mps.ide.actions.AddLanguageImport_Action;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.ide.projectPane.ProjectPane;
import jetbrains.mps.ide.ui.smodel.PackageNode;
import jetbrains.mps.ide.ui.smodel.SModelTreeNode;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.action.NodeFactoryManager;
import jetbrains.mps.smodel.constraints.ModelConstraintsManager;
import jetbrains.mps.smodel.presentation.NodePresentationUtil;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.ToStringComparator;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.action.BaseAction;
import jetbrains.mps.workbench.action.BaseGroup;
import jetbrains.mps.workbench.editors.MPSEditorOpener;
import jetbrains.mps.workbench.nodesFs.MPSNodesVirtualFileSystem;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import javax.swing.tree.TreeNode;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * @author Kostik
 */
public class CreateRootNodeGroup extends BaseGroup implements PackageProvider {
  private String myPackage;
  private boolean myPlain = false;

  public CreateRootNodeGroup() {
    super("Create Root Node");
    setPopup(false);
  }

  public CreateRootNodeGroup(boolean plain) {
    this();
    myPlain = plain;
  }

  public void doUpdate(AnActionEvent event) {
    removeAll();

    SModelDescriptor modelDescriptor = event.getData(MPSDataKeys.CONTEXT_MODEL);
    if (modelDescriptor == null) {
      setEnabledState(event.getPresentation(), false);
      return;
    }

    IScope scope = event.getData(MPSDataKeys.SCOPE);
    IOperationContext context = event.getData(MPSDataKeys.OPERATION_CONTEXT);

    boolean isStubModel = SModelStereotype.isStubModelStereotype(modelDescriptor.getStereotype());
    if (scope == null || context == null || isStubModel) {
      setEnabledState(event.getPresentation(), false);
      return;
    }

    boolean inEditor = event.getData(MPSDataKeys.LOGICAL_VIEW_SELECTION_SIZE) == null;

    if (!inEditor) {
      Integer selectedItemsCount = event.getData(MPSDataKeys.LOGICAL_VIEW_SELECTION_SIZE);
      boolean singleItemSelected = selectedItemsCount != null && selectedItemsCount == 1;

      if (!singleItemSelected) {
        setEnabledState(event.getPresentation(), false);
        return;
      }

      TreeNode treeNode = event.getData(MPSDataKeys.LOGICAL_VIEW_NODE);

      if (!(treeNode instanceof PackageNode)) {
        myPackage = null;
      } else {
        final PackageNode node = (PackageNode) treeNode;
        myPackage = node.getPackage();
      }
    } else{
      SNode node = event.getData(MPSDataKeys.NODE);
      myPackage = null;
      if (node!=null){
        SNode root = node.getContainingRoot();
        if (root!=null){
          myPackage = root.getProperty(SNodeUtil.property_BaseConcept_virtualPackage);
        }
      }
    }

    setEnabledState(event.getPresentation(), true);

    List<Language> modelLanguages = SModelOperations.getLanguages(modelDescriptor.getSModel(), scope);
    if (modelLanguages.size() == 0) {
      add(ActionManager.getInstance().getAction(AddLanguageImport_Action.class.getName()));
    }

    LanguageAspect aspect = Language.getModelAspect(modelDescriptor);
    if (aspect != null) {
      ModuleReference ref = aspect.getMainLanguage();
      Language lang = scope.getLanguage(ref);
      modelLanguages.remove(lang);

      for (SNode conceptDeclaration : lang.getConceptDeclarations()) {
        if (ModelConstraintsManager.canBeRoot(context, NameUtil.nodeFQName(conceptDeclaration), modelDescriptor.getSModel())) {
          add(new NewRootNodeAction(new SNodePointer(conceptDeclaration), modelDescriptor, this));
        }
      }

      addSeparator();
    }

    Collections.sort(modelLanguages, new ToStringComparator());

    List<Language> languagesWithRoots = new ArrayList<Language>();
    for (final Language language : modelLanguages) {
      for (SNode conceptDeclaration : language.getConceptDeclarations()) {
        if (ModelConstraintsManager.canBeRoot(context, NameUtil.nodeFQName(conceptDeclaration), modelDescriptor.getSModel())) {
          languagesWithRoots.add(language);
          break;
        }
      }
    }

    boolean plain = myPlain || (languagesWithRoots.size() == 1 && aspect == null);

    for (final Language language : languagesWithRoots) {
      String name = language.getModuleFqName();
      Icon icon = IconManager.getIconForNamespace(language.getModuleFqName());
      BaseGroup langRootsGroup;

      if (!plain) {
        langRootsGroup = new BaseGroup(name, name, icon);
        langRootsGroup.setPopup(true);
      } else {
        langRootsGroup = this;
      }

      for (SNode conceptDeclaration : language.getConceptDeclarations()) {
        if (ModelConstraintsManager.getInstance().canBeRoot(context, NameUtil.nodeFQName(conceptDeclaration), modelDescriptor.getSModel())) {
          langRootsGroup.add(new NewRootNodeAction(new SNodePointer(conceptDeclaration), modelDescriptor, this));
        }
      }
      if (!plain) {
        this.add(langRootsGroup);
      } else {
        this.addSeparator();
      }
    }
  }

  public String getPackage() {
    return myPackage;
  }

}
