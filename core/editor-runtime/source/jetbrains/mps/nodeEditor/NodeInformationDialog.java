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

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SReference;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.presentation.NodePresentationUtil;
import jetbrains.mps.util.NameUtil;

import java.awt.Frame;
import java.awt.Point;

import com.intellij.openapi.util.Computable;

public class NodeInformationDialog extends AbstractNodeInformationDialog {
  private EditorComponent myEditorComponent;

  public NodeInformationDialog(EditorComponent editorComponent, Frame owner, Point location, SNode node) {
    super(owner, location, node);
    myEditorComponent = editorComponent;
  }

  @Override
  public void setVisible(boolean b) {
    super.setVisible(b);
    myEditorComponent.setNodeInformationDialog( b ? this : null);
  }

  @Override
  public void dispose() {
    super.dispose();
    myEditorComponent.setNodeInformationDialog(null);
  }

  protected String createNodeInfo(final SNode node) {
    return ModelAccess.instance().runReadAction(new Computable<String>() {
      public String compute() {
        StringBuilder result = new StringBuilder();

        result.append("model = ").append(node.getModel().getSModelReference()).append("\n");
        result.append("concept = ").append(NameUtil.shortNameFromLongName(node.getConceptFqName())).append("\n");
        result.append("language = ").append(node.getLanguageNamespace()).append("\n");
        result.append("ID = ").append(node.getId()).append("\n");

        result.append("\nReferences:");
        for (SReference ref : node.getReferences()) {
          SNode target = ref.getTargetNode();

          if (ref.getTargetNode() == null) {
            result.append("Bad Reference\n");

          } else {
            result.append("Model = ").append(target.getModel().getSModelReference()).append("\n");
            result.append("Node = ").append(NodePresentationUtil.getPathToRoot(target)).append("\n");
            result.append("ID = ").append(target.getId()).append("\n");
          }

          result.append("\n");
        }

        return result.toString();
      }
    });
  }

}
