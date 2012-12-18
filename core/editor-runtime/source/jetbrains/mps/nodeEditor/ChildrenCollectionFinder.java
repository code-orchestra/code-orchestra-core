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
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodeUtil;
import org.jetbrains.annotations.NotNull;

public class ChildrenCollectionFinder {
  @NotNull
  private EditorCell myCurrent;
  private boolean myForward;

  public ChildrenCollectionFinder(@NotNull EditorCell current, boolean forward) {
    myCurrent = current;
    myForward = forward;
  }

  public EditorCell find() {
    return ModelAccess.instance().runReadAction(new Computable<EditorCell>() {
      public EditorCell compute() {
        DfsTraverser traverser = new DfsTraverser(myCurrent, myForward);

        SNode selectedNode = myCurrent.getSNode();
        while (traverser.getCurrent() != null) {
          EditorCell current = traverser.getCurrent();
          SNode currentNode = current.getSNode();

          if (!selectedNode.isAncestorOf(currentNode)) {
            return null;
          }

          if (current.getRole() != null) {
            String role = current.getRole();
            SNode linkDeclaration = currentNode.getLinkDeclaration(role);
            if (linkDeclaration != null &&
              !SNodeUtil.getLinkDeclaration_IsReference(linkDeclaration) &&
              SModelUtil.isMultipleLinkDeclaration(linkDeclaration)) {
              return current;
            } else if (myCurrent != current) {
              return new ChildrenCollectionFinder(current, true).find();
            }
          }

          traverser.next();
        }
        return null;
      }
    });
  }
}
