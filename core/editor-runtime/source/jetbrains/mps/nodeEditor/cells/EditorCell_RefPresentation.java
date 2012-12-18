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
package jetbrains.mps.nodeEditor.cells;

import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.constraints.IReferencePresentation;
import jetbrains.mps.smodel.constraints.ModelConstraintsUtil;
import org.apache.commons.lang.ObjectUtils;

public class EditorCell_RefPresentation {

  public static EditorCell_Property create(EditorContext context, SNode node) {
    MyAccessor accessor = new MyAccessor();
    EditorCell_Property result = new EditorCell_Property(context, accessor, node) {
      @Override
      public boolean isInTree() {
        return super.isInTree();
      }

      @Override
      public void onAdd() {
        super.onAdd();
        synchronizeViewWithModel();
      }
    };
    accessor.myContextCell = result;
    return result;
  }

  public static EditorCell_Property create(EditorContext context, SNode node, SNode refNode, SNode linkDeclaration) {
    MyAccessor accessor = new MyAccessor(context, node, refNode, linkDeclaration);
    EditorCell_Property result = EditorCell_Property.create(context, accessor, node);
    return result;
  }

  private static class MyAccessor implements ModelAccessor {
    private EditorCell myContextCell;
    private SNode myNode;
    private SNode myRefNode;
    private SNode myLinkDeclaration;
    private EditorContext myContext;

    public MyAccessor() {
    }

    public MyAccessor(EditorContext context, SNode node, SNode refNode, SNode linkDeclaration) {
      myContext = context;
      myNode = node;
      myRefNode = refNode;
      myLinkDeclaration = linkDeclaration;
    }

    private EditorCell findCellWithLinkDeclaration() {
      EditorCell current = myContextCell;
      while (current != null && current.getLinkDeclaration() == null) {
        current = current.getParent();
      }
      if (current == null) throw new IllegalStateException();
      return current;
    }

    public String getText() {
      if (myRefNode != null) {
        SNode node = myRefNode;
        IReferencePresentation presentation = ModelConstraintsUtil.getPresentation(
          node.getParent(),
          node,
          node.getConceptDeclarationNode(),
          myLinkDeclaration,
          myContext.getOperationContext()
        );
        return presentation.getText(myNode, true, false, true);
      }
      if (myContextCell == null || myContextCell.getParent() == null) return null;

      findCellWithLinkDeclaration();

      EditorCell refNodeCell = findCellWithLinkDeclaration();
      SNode referenceTarget = refNodeCell.getSNodeWRTReference();


      SNode node = refNodeCell.getSNode();
      IReferencePresentation presentation = ModelConstraintsUtil.getPresentation(
        node.getParent(),
        node,
        node.getConceptDeclarationNode(),
        refNodeCell.getLinkDeclaration(),
        myContextCell.getEditorContext().getOperationContext()
      );

      return presentation.getText(referenceTarget, true, false, true);
    }

    public void setText(String text) {
    }

    public boolean isValidText(String text) {
      return ObjectUtils.equals(getText(), text);
    }
  }
}
