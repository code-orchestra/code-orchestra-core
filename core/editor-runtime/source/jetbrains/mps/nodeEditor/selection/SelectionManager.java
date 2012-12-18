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
package jetbrains.mps.nodeEditor.selection;

import codeOrchestra.editor.ScrollHelper;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.EditorSettings;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Label;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;

import java.awt.Point;
import java.awt.Rectangle;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Stack;

/**
 * Created by IntelliJ IDEA.
 * User: Alexander Shatalin
 * Date: 1/13/11
 * Time: 6:21 PM
 * To change this template use File | Settings | File Templates.
 */
public class SelectionManager {
  private static final Logger LOG = Logger.getLogger(SelectionManager.class);

  private EditorComponent myEditorComponent;
  private Stack<Selection> mySelectionStack = new Stack<Selection>();
  private List<SelectionListener> mySelectionListeners = new LinkedList<SelectionListener>();

  @CodeOrchestraPatch
  public SelectionManager(EditorComponent editorComponent) {
    myEditorComponent = editorComponent;

    // RE-3962
    mySelectionListeners.add(new SelectionListener() {
      @Override
      public void selectionChanged(EditorComponent editorComponent, Selection oldSelection, Selection newSelection) {
        if (EditorSettings.getInstance().isAutoScrollEnabled()) {
          ScrollHelper.centerTheSelection(editorComponent, newSelection);
        }
      }
    });
  }

  public void clearSelection() {
    if (mySelectionStack.isEmpty()) {
      return;
    }
    Selection oldSelection = mySelectionStack.peek();
    mySelectionStack.clear();
    doChangeSelection(oldSelection, null);
  }

  public Selection getSelection() {
    return isSelectionStackEmpty() ? null : mySelectionStack.peek();
  }

  public Selection getDeepestSelection() {
    return isSelectionStackEmpty() ? null : mySelectionStack.firstElement();
  }

  public Selection createSelection(EditorCell editorCell) {
    Selection selection;
    if (editorCell instanceof EditorCell_Label) {
      selection = new EditorCellLabelSelection((EditorCell_Label) editorCell);
    } else if (editorCell != null) {
      selection = new EditorCellSelection(editorCell);
    } else {
      selection = null;
    }
    return selection;
  }

  public Selection createRangeSelection(SNode firstNode, SNode lastNode) {
    return new NodeRangeSelection(myEditorComponent, firstNode, lastNode);
  }

  public void setSelection(EditorCell editorCell) {
    setSelection(createSelection(editorCell));
  }

  public void setSelection(EditorCell_Label label, int caretPosition) {
    label.setCaretPosition(caretPosition);
    setSelection(new EditorCellLabelSelection(label));
  }

  public void setSelection(EditorCell_Label label, int caretPosition, int selectionStart, int selectionEnd) {
    label.setCaretPosition(caretPosition);
    label.setSelectionStart(selectionStart);
    label.setSelectionEnd(selectionEnd);
    setSelection(new EditorCellLabelSelection(label));
  }

  public void setSelection(Selection selection) {
    Selection oldSelection = getSelection();
    if (!mySelectionStack.isEmpty()) {
      mySelectionStack.clear();
    }
    if (selection != null) {
      mySelectionStack.push(selection);
    }
    doChangeSelection(oldSelection, selection);
  }

  public void pushSelection(@NotNull Selection selection) {
    doChangeSelection(getSelection(), mySelectionStack.push(selection));
  }

  public Selection popSelection() {
    if (mySelectionStack.isEmpty()) {
      return null;
    }
    Selection oldSelection = mySelectionStack.pop();
    doChangeSelection(oldSelection, getSelection());
    return oldSelection;
  }

  public Iterable<Selection> getSelectionStackIterable() {
    return new ArrayList<Selection>(mySelectionStack);
  }

  public Stack<SelectionInfo> getSelectionInfoStack() {
    Stack<SelectionInfo> result = new Stack<SelectionInfo>();
    try {
      for (Selection nextSelection : mySelectionStack) {
        result.push(nextSelection.getSelectionInfo());
      }
    } catch (SelectionStoreException e) {
      LOG.error(e);
      // unable to store selection - cleaning selection stack
      result.clear();
    }
    return result;
  }

  public void setSelectionInfoStack(@NotNull Stack<SelectionInfo> selectionStack) {
    Stack<Selection> newSelectionStack = new Stack<Selection>();
    for (SelectionInfo nextSelectionInfo : selectionStack) {
      Selection selection = nextSelectionInfo.createSelection(myEditorComponent);
      if (selection == null) {
        // unable to instantiate selection - cleaning selection stack
        newSelectionStack.clear();
        break;
      }
      newSelectionStack.push(selection);
    }
    if (isSameSelectionStack(newSelectionStack)) {
      return;
    }

    Selection oldSelection = getSelection();
    mySelectionStack.clear();
    for (Selection nextSelection : newSelectionStack) {
      mySelectionStack.push(nextSelection);
    }
    doChangeSelection(oldSelection, getSelection());
  }

  private boolean isSameSelectionStack(Stack<Selection> newSelectionStack) {
    if (newSelectionStack.size() != mySelectionStack.size()) {
      return false;
    }
    for (int i = 0; i < mySelectionStack.size(); i++) {
      Selection oldSelection = mySelectionStack.get(i);
      Selection newSelection = newSelectionStack.get(i);
      if (!oldSelection.isSame(newSelection)) {
        return false;
      }
    }
    return true;
  }

  public int getSelectionStackSize() {
    return mySelectionStack.size();
  }

  public boolean isSelectionStackEmpty() {
    return mySelectionStack.isEmpty();
  }

  public void addSelectionListener(@NotNull SelectionListener listener) {
    assert !mySelectionListeners.contains(listener);
    mySelectionListeners.add(listener);
  }

  public void removeSelectionListener(@NotNull SelectionListener listener) {
    mySelectionListeners.remove(listener);
  }

  private void doChangeSelection(Selection oldSelection, Selection newSelection) {
    if (oldSelection != null) {
      oldSelection.deactivate();
    }
    if (newSelection != null) {
      newSelection.activate();
    }
    for (SelectionListener nextListener : mySelectionListeners) {
      try {
        nextListener.selectionChanged(myEditorComponent, oldSelection, newSelection);
      } catch (Exception e) {
        LOG.error(e);
      }
    }
  }

  public void dispose() {
    if (!mySelectionStack.isEmpty()) {
      mySelectionStack.peek().deactivate();
    }
    mySelectionStack.clear();
  }
}
