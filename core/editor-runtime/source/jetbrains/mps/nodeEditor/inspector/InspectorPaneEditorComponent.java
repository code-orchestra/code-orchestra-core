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
package jetbrains.mps.nodeEditor.inspector;

import com.intellij.ui.ScrollPaneFactory;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;

import javax.swing.JComponent;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import java.awt.GridLayout;
import java.util.ArrayList;
import java.util.List;

final class InspectorPaneEditorComponent extends JComponent {

  private final List<InspectorEditorComponent> myInspectorEditorComponents = new ArrayList<InspectorEditorComponent>();
  private final JScrollPane myScrollPane = ScrollPaneFactory.createScrollPane();
  private final JComponent myPanel = new JPanel(new GridLayout(0, 1));

  InspectorPaneEditorComponent() {
    myScrollPane.setViewportView(myPanel);
  }

  public JComponent getExternalComponent() {
    return myScrollPane;
  }

  public EditorCell findNodeCell(SNode currentTargetNode) {
    throw new UnsupportedOperationException();
  }

  public EditorCell getRootCell() {
    throw new UnsupportedOperationException();
  }

  public void rebuildEditorContent() {
    throw new UnsupportedOperationException();
  }

  public void changeSelection(EditorCell cellInInspector) {
    throw new UnsupportedOperationException();
  }

  public void inspectNode(SNode node, IOperationContext context) {
    myInspectorEditorComponents.clear();
    myPanel.removeAll();
    InspectorEditorComponent inspectorEditorComponent = new InspectorEditorComponent();
    inspectorEditorComponent.inspectNode(node, context);
    myInspectorEditorComponents.add(inspectorEditorComponent);
    myPanel.add(inspectorEditorComponent);
  }

  private InspectorEditorComponent getInspectorEditorComponent() {
    return myInspectorEditorComponents.get(0);
  }

  public EditorComponent getEditorComponent() {
    return getInspectorEditorComponent();
  }

}
