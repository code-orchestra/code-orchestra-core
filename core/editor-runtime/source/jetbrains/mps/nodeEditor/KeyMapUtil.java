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

import com.intellij.openapi.util.Computable;
import jetbrains.mps.editor.runtime.impl.LanguagesKeymapManager;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.EditorCellKeyMap.ActionKey;
import jetbrains.mps.nodeEditor.cells.CellFinders;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Label;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.Pair;

import javax.swing.JMenuItem;
import javax.swing.JPopupMenu;
import javax.swing.JViewport;
import javax.swing.KeyStroke;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.util.*;

/**
 * author: Igor Alshannikov
 * Sep 28, 2006
 */
public class KeyMapUtil {
  private static final Logger LOG = Logger.getLogger(KeyMapUtil.class);

  /**
   * @return list of pairs: keymapAction/actionCell
   */
  static List<Pair<EditorCellKeyMapAction, EditorCell>> getKeyMapActionsForEvent(final EditorCell selectedCell, final KeyEvent keyEvent, final EditorContext editorContext) {
    return ModelAccess.instance().runReadAction(new Computable<List<Pair<EditorCellKeyMapAction, EditorCell>>>() {
      public List<Pair<EditorCellKeyMapAction, EditorCell>> compute() {
        if (keyEvent.getID() != KeyEvent.KEY_PRESSED && keyEvent.getID() != KeyEvent.KEY_TYPED) return Collections.emptyList();

        int keyCode = keyEvent.getKeyCode();
        if (keyCode == KeyEvent.VK_CONTROL || keyCode == KeyEvent.VK_ALT || keyCode == KeyEvent.VK_SHIFT ||
          keyCode == KeyEvent.VK_PAGE_UP || keyCode == KeyEvent.VK_PAGE_DOWN) {
          return Collections.emptyList();
        }

        /*
        if ((keyEvent.getModifiers() & (KeyEvent.CTRL_MASK | KeyEvent.ALT_MASK | KeyEvent.SHIFT_MASK)) == 0) {
          char keyChar = keyEvent.getKeyChar();
          if (Character.isLetterOrDigit(keyChar) || keyChar == '\n') {
            return Collections.emptyList(); //TODO why?!
          }
        }
        */

        // collect all keymaps available
        List<Pair<EditorCellKeyMap, EditorCell>> keymapsAndCells = getRegisteredKeymaps(selectedCell, editorContext);
        if (keymapsAndCells.isEmpty()) {
          return Collections.emptyList();
        }

        return selectActionsFromKeymaps(selectedCell, keyEvent, editorContext, keymapsAndCells);
      }
    });
  }

  /**
   * @return List of pairs keymap/ownerCell
   */
  private static List<Pair<EditorCellKeyMap, EditorCell>> getRegisteredKeymaps(EditorCell selectedCell, EditorContext editorContext) {
    Set<Class> addedKeymaps = new HashSet<Class>(); // don't duplicate keymaps
    List<Pair<EditorCellKeyMap, EditorCell>> keyMapsAndCells = new ArrayList<Pair<EditorCellKeyMap, EditorCell>>();

    EditorCell keymapOwnerCell = selectedCell;
    while (keymapOwnerCell != null) {
      EditorCellKeyMap keymap = keymapOwnerCell.getKeyMap();
      if (keymap != null && !addedKeymaps.contains(keymap.getClass())) {
        keyMapsAndCells.add(new Pair<EditorCellKeyMap, EditorCell>(keymap, keymapOwnerCell));
        addedKeymaps.add(keymap.getClass());
      }
      keymapOwnerCell = keymapOwnerCell.getParent();
    }
    SNode node = editorContext.getNodeEditorComponent().getEditedNode();
    if (node != null) {
      SModel model = node.getModel();

      Set<ModuleReference> importedAndExtendedLanguages = new HashSet<ModuleReference>();
      for (ModuleReference langRef : SModelOperations.getAllImportedLanguages(model)) {
        importedAndExtendedLanguages.add(langRef);
        Language l = MPSModuleRepository.getInstance().getLanguage(langRef);
        if (l != null) {
          for (Language le : l.getAllExtendedLanguages()) {
            importedAndExtendedLanguages.add(le.getModuleReference());
          }
        }
      }

      for (ModuleReference ref : importedAndExtendedLanguages) {
        Language language = editorContext.getScope().getLanguage(ref);
        if (language == null) {
          continue;
        }
        List<EditorCellKeyMap> keyMapsForNamespace = LanguagesKeymapManager.getInstance().getKeyMapsForLanguage(language);
        if (keyMapsForNamespace != null) {
          for (EditorCellKeyMap keymap : keyMapsForNamespace) {
            if (!addedKeymaps.contains(keymap.getClass())) {
              keyMapsAndCells.add(new Pair<EditorCellKeyMap, EditorCell>(keymap, selectedCell));
              addedKeymaps.add(keymap.getClass());
            }
          }
        }
      }
    }

    return keyMapsAndCells;
  }

  public static Set<EditorCellKeyMapAction> getRegisteredActions(EditorCell selectedCell, EditorContext context) {
    Set<EditorCellKeyMapAction> result = new HashSet<EditorCellKeyMapAction>();
    for (Pair<EditorCellKeyMap, EditorCell> pair : getRegisteredKeymaps(selectedCell, context)) {
      result.addAll(pair.o1.getActions(null));
    }
    return result;
  }

  /**
   * @param keyEvent        !!! can be null
   * @param keymapsAndCells - List of pairs keymap/ownerCell
   * @return List of pairs keymapAction/actionCell
   */
  private static List<Pair<EditorCellKeyMapAction, EditorCell>> selectActionsFromKeymaps(EditorCell selectedCell,
                                                                                         KeyEvent keyEvent,
                                                                                         EditorContext editorContext,
                                                                                         List<Pair<EditorCellKeyMap, EditorCell>> keymapsAndCells) {
    // choose appropriate actions from keymaps

    List<Pair<EditorCellKeyMapAction, EditorCell>> actionsAndCells = new LinkedList<Pair<EditorCellKeyMapAction, EditorCell>>();
    for (Pair<EditorCellKeyMap, EditorCell> keymapAndCell : keymapsAndCells) {
      EditorCellKeyMap keymap = keymapAndCell.o1;
      EditorCell keymapOwnerCell = keymapAndCell.o2;

      int caretPosition = getCaretPositionCode(selectedCell, keymapOwnerCell);

      List<EditorCellKeyMapAction> actions = keymap.getActions(keyEvent);
      for (EditorCellKeyMapAction action : actions) {
        EditorCell actionCell = selectActionCell(action, keymapOwnerCell, selectedCell, caretPosition, keyEvent, editorContext);
        if (actionCell != null) {
          actionsAndCells.add(new Pair<EditorCellKeyMapAction, EditorCell>(action, actionCell));
        }
      }
    }

    return actionsAndCells;
  }

  @Deprecated
  private static int getCaretPositionCode(EditorCell selectedCell) {
    int actualCaretPosition = EditorCellKeyMapAction.CARET_AT_ANY_POSITION;
    if (selectedCell instanceof EditorCell_Label) {
      EditorCell_Label label = (EditorCell_Label) selectedCell;
      if (isStrictlyFirstCaretPosition(label)) {
        actualCaretPosition = EditorCellKeyMapAction.CARET_AT_FIRST_POSITION;
      } else if (isStrictlyLastCaretPosition(label)) {
        actualCaretPosition = EditorCellKeyMapAction.CARET_AT_LAST_POSITION;
      } else {
        actualCaretPosition = EditorCellKeyMapAction.CARET_AT_INTERMEDIATE_POSITION;
      }
    }
    return actualCaretPosition;
  }

  private static int getCaretPositionCode(EditorCell selectedCell, EditorCell keyMapCell) {
    int actualCaretPosition = EditorCellKeyMapAction.CARET_AT_ANY_POSITION;
    if (selectedCell instanceof EditorCell_Label) {
      EditorCell_Label label = (EditorCell_Label) selectedCell;
      if (isStrictlyFirstCaretPosition(label) && keyMapCell.getFirstLeaf() == selectedCell) {
        actualCaretPosition = EditorCellKeyMapAction.CARET_AT_FIRST_POSITION;
      } else if (isStrictlyLastCaretPosition(label) && keyMapCell.getLastLeaf() == selectedCell) {
        actualCaretPosition = EditorCellKeyMapAction.CARET_AT_LAST_POSITION;
      } else {
        actualCaretPosition = EditorCellKeyMapAction.CARET_AT_INTERMEDIATE_POSITION;
      }
    }
    return actualCaretPosition;
  }

  /**
   * @param keyEvent !!! can be null !!!
   */
  private static EditorCell selectActionCell(EditorCellKeyMapAction action, EditorCell keymapOwnerCell, EditorCell selectedCell, int actualCaretPosition, KeyEvent keyEvent, EditorContext editorContext) {
    // choose 'context cell' (between 'selected cell' and 'keymap owner cell' inclusive)
    EditorCell actionCell = selectedCell;
    while (actionCell != null) {
      boolean conditionSatisfied = false;
      if (action.getCaretPolicy() == EditorCellKeyMapAction.CARET_AT_ANY_POSITION) {
        conditionSatisfied = true;
      } else if (action.getCaretPolicy() == actualCaretPosition) {
        if (action.getCaretPolicy() == EditorCellKeyMapAction.CARET_AT_FIRST_POSITION) {
          conditionSatisfied = (actionCell.findChild(CellFinders.FIRST_SELECTABLE_LEAF, true) == selectedCell) && isStrictlyFirstCaretPosition(selectedCell);
        } else if (action.getCaretPolicy() == EditorCellKeyMapAction.CARET_AT_LAST_POSITION) {
          conditionSatisfied = (actionCell.findChild(CellFinders.LAST_SELECTABLE_LEAF, true) == selectedCell) && isStrictlyLastCaretPosition(selectedCell);
        } else {
          conditionSatisfied = true;
        }
      }

      try {
        if (conditionSatisfied && canExecuteKeyMapAction(action, keyEvent, actionCell, editorContext)) {
          return actionCell;
        }
      } catch (Exception e) {
        LOG.error(e);
        return null;
      }
      if (actionCell == keymapOwnerCell) {
        return null;
      }
      actionCell = actionCell.getParent();
    }
    return null;
  }

  private static boolean isStrictlyFirstCaretPosition(EditorCell cell) {
    if (!(cell instanceof EditorCell_Label)) return false;
    EditorCell_Label label = (EditorCell_Label) cell;
    return label.isFirstCaretPosition() && label.isFirstPositionAllowed() && cell.getContainingBigCell().getFirstLeaf() == cell;
  }

  private static boolean isStrictlyLastCaretPosition(EditorCell cell) {
    if (!(cell instanceof EditorCell_Label)) return false;
    EditorCell_Label label = (EditorCell_Label) cell;
    return label.isLastCaretPosition() && label.isLastPositionAllowed() && cell.getContainingBigCell().getLastLeaf() == cell;
  }

  public static List<Pair<EditorCellKeyMapAction, ActionKey>> getAllApplicableActionsAndKeys(EditorCell selectedCell, EditorContext editorContext) {
    // collect all keymaps available
    List<Pair<EditorCellKeyMap, EditorCell>> keymapsAndCells = getRegisteredKeymaps(selectedCell, editorContext);
    if (keymapsAndCells.isEmpty()) {
      return Collections.emptyList();
    }

    // choose appropriate actions from keymaps
    List<Pair<EditorCellKeyMapAction, ActionKey>> result = new LinkedList<Pair<EditorCellKeyMapAction, ActionKey>>();
    for (Pair<EditorCellKeyMap, EditorCell> keymapAndCell : keymapsAndCells) {
      EditorCellKeyMap keymap = keymapAndCell.o1;
      EditorCell keymapOwnerCell = keymapAndCell.o2;

      int caretPosition = getCaretPositionCode(selectedCell, keymapOwnerCell);

      List<Pair<EditorCellKeyMapAction, ActionKey>> actionsAndKeys = keymap.getAllActionsAndKeys();
      for (Pair<EditorCellKeyMapAction, ActionKey> actionAndKey : actionsAndKeys) {
        EditorCellKeyMapAction action = actionAndKey.o1;
        EditorCell actionCell = selectActionCell(action, keymapOwnerCell, selectedCell, caretPosition, null, editorContext);
        if (actionCell != null) {
          result.add(actionAndKey);
        }
      }
    }
    return result;
  }


  public static boolean canExecuteKeyMapAction(final EditorCellKeyMapAction action, final KeyEvent keyEvent, EditorCell contextCell, final EditorContext editorContext) {
    return editorContext.runWithContextCell(contextCell, new Computable<Boolean>() {
      public Boolean compute() {
        return action.canExecute(keyEvent, editorContext);
      }
    });
  }

  public static void executeKeyMapAction(final EditorCellKeyMapAction action, final KeyEvent keyEvent, EditorCell contextCell, final EditorContext editorContext) {
    editorContext.runWithContextCell(contextCell, new Runnable() {
      public void run() {
        editorContext.executeCommand(new Runnable() {
          public void run() {
            action.execute(keyEvent, editorContext);
          }
        });
      }
    });
  }

  static void showActionsMenu(List<Pair<EditorCellKeyMapAction, EditorCell>> actionsInfo, final KeyEvent keyEvent, final EditorContext editorContext, EditorCell selectedCell) {
    JPopupMenu menu = new JPopupMenu();
    int index = 1;
    for (Pair<EditorCellKeyMapAction, EditorCell> actionAndContextCell : actionsInfo) {
      final EditorCellKeyMapAction action = actionAndContextCell.o1;
      final EditorCell contextCell = actionAndContextCell.o2;
      char acc = 0;
      if (1 <= index && index <= 9) {
        acc = (char) ('0' + index);
      } else if (index == 10) {
        acc = '0';
      } else if (10 < index && index - 11 < ('Z' - 'A')) {
        acc = (char) ('A' + index - 11);
      }
      JMenuItem menuItem = new JMenuItem(action.getDescriptionText());
      if (acc != 0) {
        menuItem.setAccelerator(KeyStroke.getKeyStroke(acc));
      }
      ActionListener actionListener = new ActionListener() {
        public void actionPerformed(ActionEvent e) {
          ModelAccess.instance().runWriteActionInCommand(new Runnable() {
            public void run() {
              executeKeyMapAction(action, keyEvent, contextCell, editorContext);
            }
          });
        }
      };
      menuItem.addActionListener(actionListener);
      menu.add(menuItem);
      index++;
    }
    EditorComponent component = editorContext.getNodeEditorComponent();
    int x = selectedCell.getX();
    int y = selectedCell.getY() + selectedCell.getHeight();
    if (component.getParent() instanceof JViewport) {
      JViewport viewport = (JViewport) component.getParent();
      Rectangle vr = viewport.getViewRect();
      x = Math.max(vr.x, x);
      y = Math.max(vr.y, y);
    }
    menu.show(component, x, y);
  }
}
