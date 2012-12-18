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
package jetbrains.mps.nodeEditor.cellExplorer;

import jetbrains.mps.util.NameUtil;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Label;

public class CellProperties {

  private EditorCell myCell;
  private SNode mySNode;
  private String myCellSNode;
  private String myCellNumber;
  private String myCellID;
  private String myCellRole;
  private String myRootCell;
  private String myCellEffectiveWidth;
  private String myCellHeight;
  private String myCellWidth;
  private String myCellKind;
  private String myCellText;

  public CellProperties(EditorCell cell) {
    myCell = cell;
    myCellText = null;
    if (myCell instanceof EditorCell_Label) {
      myCellText = ((EditorCell_Label) myCell).getText();
      if (myCellText == null || myCellText.length() == 0) myCellText = ((EditorCell_Label) myCell).getNullText();
    }
    myCellKind = NameUtil.shortNameFromLongName(myCell.getClass().getName());
    myCellWidth = myCell.getWidth() + "";
    myCellHeight = myCell.getHeight() + "";
    myCellEffectiveWidth = myCell.getEffectiveWidth() + "";
    myRootCell = (myCell.getEditorContext().getNodeEditorComponent().getRootCell() == myCell) ? "Yes" : "No";
    myCellID = (String) (myCell.getCellId());
    myCellRole = "" + (myCell.getCellRole());

    mySNode = myCell.getSNode();
    String name = mySNode.getName();
    name = name != null ? name : "<no name>";
    myCellSNode = mySNode == null ? "no node" : name + " (" + mySNode.getConceptShortName() + ") [" + mySNode.getId() + "]";
  }


  public EditorCell getCell() {
    return myCell;
  }

  public SNode getSNode() {
    return mySNode;
  }

  public String getCellSNode() {
    return myCellSNode;
  }

  public String getCellNumber() {
    return myCellNumber;
  }

  public String getCellID() {
    return myCellID;
  }

  public String getCellRole() {
    return myCellRole;
  }

  public String getRootCell() {
    return myRootCell;
  }

  public String getCellEffectiveWidth() {
    return myCellEffectiveWidth;
  }

  public String getCellHeight() {
    return myCellHeight;
  }

  public String getCellWidth() {
    return myCellWidth;
  }

  public String getCellKind() {
    return myCellKind;
  }

  public String getCellText() {
    return myCellText;
  }
}
