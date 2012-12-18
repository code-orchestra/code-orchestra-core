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
package jetbrains.mps.nodeEditor;

import com.intellij.ide.DataManager;
import com.intellij.ide.IdeBundle;
import com.intellij.openapi.actionSystem.ActionGroup;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.DataContext;
import com.intellij.openapi.ui.popup.JBPopupFactory;
import com.intellij.openapi.ui.popup.ListPopup;
import com.intellij.openapi.util.Computable;
import com.intellij.ui.awt.RelativePoint;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Error;
import jetbrains.mps.nodeEditor.cells.EditorCell_Label;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.action.NodeFactoryManager;
import jetbrains.mps.smodel.presentation.NodePresentationUtil;
import jetbrains.mps.util.Condition;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.Setter;
import jetbrains.mps.util.ToStringComparator;
import jetbrains.mps.workbench.action.BaseAction;
import jetbrains.mps.workbench.action.BaseGroup;

import javax.swing.Icon;
import java.awt.Point;
import java.util.Collections;
import java.util.List;
import java.util.Map;

public final class CreateFromUsageUtil {

  private CreateFromUsageUtil() {
  }

  public static boolean isApplicable(EditorContext editorContext) {
    boolean applicable = false;
    EditorCell selectedCell = editorContext.getSelectedCell();
    if (selectedCell instanceof EditorCell_Error) {
      EditorCell_Label editorCell_Label = (EditorCell_Label) selectedCell;
      applicable = editorCell_Label.getText().length() > 0;
    }
    return applicable;
  }

  public static String getText(EditorContext editorContext) {
    EditorCell cell = editorContext.getSelectedCell();
    if (cell instanceof EditorCell_Label) {
      return ((EditorCell_Label) cell).getText();
    }
    return null;
  }


  public static void showCreateNewRootMenu(final EditorContext editorContext, final Condition<SNode> conceptsFilter, final Setter<SNode> newRootHandler) {
    final EditorCell selectedCell = editorContext.getSelectedCell();
    int x = selectedCell.getX();
    int y = selectedCell.getY();
    if (selectedCell instanceof EditorCell_Label) {
      y += ((EditorCell_Label) selectedCell).getHeight();
    }
    final DataContext dataContext = DataManager.getInstance().getDataContext(editorContext.getNodeEditorComponent(), x, y);
    ListPopup popup = ModelAccess.instance().runReadAction(new Computable<ListPopup>() {
      public ListPopup compute() {
        ActionGroup group = getQuickCreateGroup(selectedCell.getSNode().getModel(), editorContext.getScope(), conceptsFilter, newRootHandler);
        ListPopup popup = null;
        if (group != null) {
          popup = JBPopupFactory.getInstance()
            .createActionGroupPopup(IdeBundle.message("title.popup.new.element"),
              group,
              dataContext,
              JBPopupFactory.ActionSelectionAid.SPEEDSEARCH,
              false);
        }
        return popup;
      }
    });
//    popup.showInBestPositionFor(dataContext);
    popup.show(new RelativePoint(editorContext.getNodeEditorComponent(), new Point(x, y)));
  }

  private static BaseGroup getQuickCreateGroup(final SModel model, final IScope scope, Condition<SNode> conceptsFilter, final Setter<SNode> newRootHandler) {
    BaseGroup group = new BaseGroup("");

    List<Language> modelLanguages = SModelOperations.getLanguages(model, scope);
    Collections.sort(modelLanguages, new ToStringComparator());
    for (final Language language : modelLanguages) {
      boolean hasChildren = false;
      for (final SNode concept : language.getConceptDeclarations()) {
        if (SNodeUtil.getConceptDeclaration_IsRootable(concept) && (conceptsFilter == null || conceptsFilter.met(concept))) {
          BaseAction action = new BaseAction(NodePresentationUtil.matchingText(concept)) {
            protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
              ModelAccess.instance().runWriteActionInCommand(new Runnable() {
                public void run() {
                  SNode result = NodeFactoryManager.createNode(concept, null, null, model, scope);
                  model.addRoot(result);
                  if (newRootHandler != null) {
                    newRootHandler.set(result);
                  }
                }
              });
            }
          };
          Icon icon = IconManager.getIconForConceptFQName(NameUtil.nodeFQName(concept));
          action.getTemplatePresentation().setIcon(icon);
          action.setExecuteOutsideCommand(true);

          group.add(action);
          hasChildren = true;
        }
      }

      if (hasChildren) {
        group.addSeparator();
      }
    }

    return group;
  }
}
