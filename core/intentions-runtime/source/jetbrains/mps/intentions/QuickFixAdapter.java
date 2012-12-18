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
package jetbrains.mps.intentions;

import jetbrains.mps.errors.QuickFix_Runtime;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Label;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.Pair;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * Date: 26.10.2010
 * Time: 16:33:41
 * To change this template use File | Settings | File Templates.
 */
public class QuickFixAdapter extends BaseIntention  {
  private QuickFix_Runtime myQuickFix;
  private boolean myIsError;
  public QuickFixAdapter(QuickFix_Runtime quickFix, boolean isError) {
    myQuickFix = quickFix;
    myIsError = isError;
  }

  public String getConcept() {
    return null;
  }

  public boolean isParameterized() {
    return false;
  }

  public String getDescription(SNode node, EditorContext editorContext) {
    return myQuickFix.getDescription();
  }

  public boolean isApplicable(SNode node, EditorContext editorContext) {
    return false;
  }

  public boolean isAvailableInChildNodes() {
    return true;
  }

  public List parameter(SNode node, EditorContext editorContext) {
    return null;
  }

  public void execute(SNode node, EditorContext editorContext) {
    EditorCell selectedCell = editorContext.getSelectedCell();
    int caretX = -1;
    int caretY = -1;
    boolean restoreCaretPosition = false;
    if (selectedCell != null && selectedCell.getSNode().getAncestors(true).contains(node)) {
      caretX = selectedCell.getCaretX();
      caretY = selectedCell.getBaseline();
      restoreCaretPosition= true;
    }
    myQuickFix.execute(node);
    if (restoreCaretPosition) {
      editorContext.flushEvents();
      EditorCell rootCell = editorContext.getNodeEditorComponent().getRootCell();
      EditorCell leaf = rootCell.findLeaf(caretX, caretY);
      if (leaf != null) {
        editorContext.getNodeEditorComponent().changeSelection(leaf);
        leaf.setCaretX(caretX);
      }
    }
  }

  public IntentionType getType() {
    return myIsError ? IntentionType.ERROR : IntentionType.NORMAL;
    //return IntentionType.QUICKFIX;
  }

  public String getLocationString() {
    return null;  //todo?
  }

  //if generated returns source, if not returns null
  public SNode getNodeByIntention() {
    String classFQName = myQuickFix.getClass().getName();
    SModelReference reference = SModelReference.fromString(NameUtil.namespaceFromLongName(classFQName));
    SModelDescriptor sModelDescriptor = GlobalScope.getInstance().getModelDescriptor(reference);
    if (sModelDescriptor != null) {
      SModel model = sModelDescriptor.getSModel();
      if (model != null) {
        String shortName = NameUtil.shortNameFromLongName(classFQName);
        String rootName = shortName.substring(0, shortName.length() - "_QuickFix".length());
        return SModelOperations.getRootByName(model,rootName);
      }
    }
    return null;
  }

  public List<Intention> getParameterizedInstances(SNode node, EditorContext editorContext) {
    List<Intention> list = new ArrayList<Intention>();
    list.add(this);
    return list;
  }
}
