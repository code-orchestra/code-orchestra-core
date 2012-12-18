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

import jetbrains.mps.nodeEditor.cells.*;
import jetbrains.mps.nodeEditor.selection.SelectionInfo;
import jetbrains.mps.smodel.SNode;
import org.apache.commons.lang.ObjectUtils;
import org.jdom.Element;

import java.awt.Point;
import java.util.*;
import java.util.Map.Entry;

class Memento {
  private Stack<SelectionInfo> mySelectionStack = new Stack<SelectionInfo>();
  private List<CellInfo> myCollectionsWithEnabledBraces = new ArrayList<CellInfo>();
  private Set<CellInfo> myFolded = new HashSet<CellInfo>();

  private Map<CellInfo, String> myErrorTexts = new HashMap<CellInfo, String>();
  private Point myViewPosition;

  private Memento() {}

  Memento(EditorContext context, boolean full) {
    EditorComponent nodeEditor = context.getNodeEditorComponent();
    SNode editedNode = nodeEditor.getEditedNode();
    if (editedNode == null || (!editedNode.isDisposed() && editedNode.getModel() != null && !editedNode.getModel().isDisposed())) {
      mySelectionStack = nodeEditor.getSelectionManager().getSelectionInfoStack();

      for (EditorCell foldedCell : nodeEditor.getFoldedCells()) {
        myFolded.add(foldedCell.getCellInfo());
      }
      for (EditorCell bracesEnabledCell : nodeEditor.getBracesEnabledCells()) {
        myCollectionsWithEnabledBraces.add(bracesEnabledCell.getCellInfo());
      }
    }

    if (full) {
      collectErrors(nodeEditor);
    }
    myViewPosition = nodeEditor.getViewport().getViewPosition();
  }

  private void collectErrors(EditorComponent editor) {
    for (EditorCell cell : editor.getCellTracker().getErrorCells()) {
      if (cell instanceof EditorCell_Label) {
        EditorCell_Label label = (EditorCell_Label) cell;
        if (!"".equals(label.getText())) {
          myErrorTexts.put(label.getCellInfo(), label.getText());
        }
      }
    }
  }

  void restore(EditorComponent editor) {
    editor.clearFoldedCells();
    editor.clearBracesEnabledCells();

    editor.flushEvents();

    // TODO: remove this variable and simply mark editor as "needsRelayout" from the top editor cell + relayout it on .. next paint?
    boolean needsRelayout = restoreErrors(editor);
    editor.getSelectionManager().setSelectionInfoStack(mySelectionStack);
    for (CellInfo collectionInfo : myCollectionsWithEnabledBraces) {
      EditorCell collection = collectionInfo.findCell(editor);
      if (!(collection instanceof EditorCell_Collection)) continue;
      if (((EditorCell_Collection)collection).usesBraces()) {
        ((EditorCell_Collection)collection).enableBraces();
      }
    }
    for (CellInfo collectionInfo : myFolded) {
      needsRelayout = true;
      EditorCell collection = collectionInfo.findCell(editor);
      if (!(collection instanceof EditorCell_Collection)) continue;
      ((EditorCell_Collection)collection).fold(true);      
    }

    if (needsRelayout) {
      editor.relayout();
    }
    if (myViewPosition != null) {
      editor.getViewport().setViewPosition(myViewPosition);
    }
  }

  private boolean restoreErrors(EditorComponent editor) {
    boolean needsRelayout = false;
    for (Entry<CellInfo, String> entry : myErrorTexts.entrySet()) {
      EditorCell_Label cell = (EditorCell_Label) entry.getKey().findCell(editor);
      if (cell != null) {
        String text = cell.getText();
        String oldText = entry.getValue();
        if (!ObjectUtils.equals(text, oldText)) {
          cell.changeText(entry.getValue(), null);
          needsRelayout = true;
        }
      }
    }
    return needsRelayout;
  }

  public boolean equals(Object object) {
    if (object == this) return true;
    if (object instanceof Memento) {
      Memento m = (Memento) object;
      if (ObjectUtils.equals(mySelectionStack, m.mySelectionStack) &&
        ObjectUtils.equals(myCollectionsWithEnabledBraces, m.myCollectionsWithEnabledBraces) &&
        ObjectUtils.equals(myFolded, m.myFolded)) {

        return true;
      }
    }
    return false;
  }

  public int hashCode() {
    return (mySelectionStack != null ? mySelectionStack.hashCode() : 0);
  }

  public String toString() {
    return "Editor Memento[\n" +
      "  selectedStack = " + mySelectionStack + "\n" +
      "  collectionsWithBraces = " + myCollectionsWithEnabledBraces + "\n" +
      "  foldedCells = " + myFolded + "\n" +
      "]\n";
  }

  private static final String SELECTION_STACK = "selectionStack";
  private static final String STACK_ELEMENT = "stackElement";
  private static final String FOLDED = "folded";
  private static final String FOLDED_ELEMENT = "foldedElement";
  private static final String VIEW_POSITION_X = "viewPositionX";
  private static final String VIEW_POSITION_Y = "viewPositionY";

  public void save(Element e) {
    Element selectionStack = new Element(SELECTION_STACK);
    e.addContent(selectionStack);
    for (SelectionInfo selectionInfo : mySelectionStack) {
      Element stackElement = new Element(STACK_ELEMENT);
      selectionInfo.persistToXML(stackElement);
      selectionStack.addContent(stackElement);
    }

    boolean success = true;
    Element folded = new Element(FOLDED);
    for (CellInfo cellInfo : myFolded) {
      if (cellInfo instanceof DefaultCellInfo) {
        Element foldedElement = new Element(FOLDED_ELEMENT);
        ((DefaultCellInfo)cellInfo).saveTo(foldedElement);
        folded.addContent(foldedElement);
      } else {
        success = false;
        break;
      }
    }
    if (success) {
      e.addContent(folded);
    }
    e.setAttribute(VIEW_POSITION_X, String.valueOf(myViewPosition.x));
    e.setAttribute(VIEW_POSITION_Y, String.valueOf(myViewPosition.y));
  }

  public static Memento load(Element e) {
    Memento memento = new Memento();
    Element selectionStack = e.getChild(SELECTION_STACK);
    if (selectionStack != null) {
      List children = selectionStack.getChildren(STACK_ELEMENT);
      for (Object o : children) {
        memento.mySelectionStack.push(new SelectionInfo((Element) o)) ;
      }
    }
    Element folded = e.getChild(FOLDED);
    if (folded != null) {
      List children = folded.getChildren(FOLDED_ELEMENT);
      for (Object o : children) {
        memento.myFolded.add(DefaultCellInfo.loadFrom((Element) o));
      }
    }
    try {
      int viewPositionX = Integer.valueOf(e.getAttributeValue(VIEW_POSITION_X));
      int viewPositionY = Integer.valueOf(e.getAttributeValue(VIEW_POSITION_Y));
      memento.myViewPosition = new Point(viewPositionX, viewPositionY);
    } catch (NumberFormatException nfe) {
    }
    return memento;
  }
}
