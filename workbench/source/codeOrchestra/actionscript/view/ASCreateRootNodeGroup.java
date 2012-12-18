/*
 * Copyright 2003-2010 JetBrains s.r.o.
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
package codeOrchestra.actionscript.view;

import com.intellij.openapi.actionSystem.ActionManager;
import com.intellij.openapi.actionSystem.AnActionEvent;
import codeOrchestra.actionscript.view.utils.Languages;
import jetbrains.mps.ide.actions.AddLanguageImport_Action;
import jetbrains.mps.ide.ui.smodel.PackageNode;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.constraints.ModelConstraintsManager;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.ToStringComparator;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.action.BaseGroup;
import jetbrains.mps.workbench.actions.model.NewRootNodeAction;
import jetbrains.mps.workbench.actions.model.PackageProvider;

import javax.swing.tree.TreeNode;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ASCreateRootNodeGroup extends BaseGroup implements PackageProvider {
  private String myPackage;

  public ASCreateRootNodeGroup() {
    super("Create Root Node");
    setPopup(false);
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
    Integer selectedItemsCount = event.getData(MPSDataKeys.LOGICAL_VIEW_SELECTION_SIZE);
    TreeNode treeNode = event.getData(MPSDataKeys.LOGICAL_VIEW_NODE);

    boolean isStubModel = SModelStereotype.isStubModelStereotype(modelDescriptor.getStereotype());
    boolean singleItemSelected = selectedItemsCount != null && selectedItemsCount == 1;
    if (scope == null || context == null || isStubModel || !singleItemSelected) {
      setEnabledState(event.getPresentation(), false);
      return;
    }

    setEnabledState(event.getPresentation(), true);

    if (!(treeNode instanceof PackageNode)) {
      myPackage = null;
    } else {
      final PackageNode node = (PackageNode) treeNode;
      myPackage = node.getPackage();
    }

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
        if (ModelConstraintsManager.getInstance().canBeRoot(context, NameUtil.nodeFQName(conceptDeclaration), modelDescriptor.getSModel())) {
          add(new NewRootNodeAction(new SNodePointer(conceptDeclaration), modelDescriptor, this)); // RE-1121
        }
      }

      addSeparator(); // TODO: do we need this?
    }

    Collections.sort(modelLanguages, new ToStringComparator());

    List<Language> languagesWithRoots = new ArrayList<Language>();
    for (final Language language : modelLanguages) {
      // RE-2617
      if (Languages.ACTION_SCRIPT_ASSETS.equals(language.getModuleFqName())) {
        continue;
      }
      // RE-2123
      if (Languages.ACTION_SCRIPT_TRAITS.equals(language.getModuleFqName())) {
        continue;
      }

      for (SNode conceptDeclaration : language.getConceptDeclarations()) {
        if (ModelConstraintsManager.getInstance().canBeRoot(context, NameUtil.nodeFQName(conceptDeclaration), modelDescriptor.getSModel())) {
          languagesWithRoots.add(language);
          break;
        }
      }
    }

    for (final Language language : languagesWithRoots) {
      for (SNode conceptDeclaration : language.getConceptDeclarations()) {
        if (ModelConstraintsManager.getInstance().canBeRoot(context, NameUtil.nodeFQName(conceptDeclaration), modelDescriptor.getSModel())) {
          add(new NewRootNodeAction(new SNodePointer(conceptDeclaration), modelDescriptor, this)); // RE-1121
        }
      }

      this.addSeparator(); // TODO: do we need this?
    }
  }

  public String getPackage() {
    return myPackage;
  }

}
