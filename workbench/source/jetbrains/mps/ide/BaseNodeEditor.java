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
package jetbrains.mps.ide;

import com.intellij.openapi.actionSystem.DataProvider;
import com.intellij.openapi.fileEditor.FileEditorStateLevel;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.MementoPersistence;
import jetbrains.mps.nodeEditor.NodeEditorComponent;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.workbench.MPSDataKeys;
import org.apache.commons.lang.ObjectUtils;
import org.jdom.Element;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.JComponent;
import javax.swing.JPanel;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.LineBorder;
import java.awt.BorderLayout;
import java.awt.Color;

public abstract class BaseNodeEditor implements IEditor {
  private EditorComponent myEditorComponent;
  private JComponent myComponent = new EditorPanel();
  private IOperationContext myContext;
  private JComponent myReplace = null;

  public BaseNodeEditor(IOperationContext context) {
    myContext = context;
    showEditor();
  }

  public JComponent getComponent() {
    return myComponent;
  }

  public EditorComponent getCurrentEditorComponent() {
    return myEditorComponent;
  }

  public EditorContext getEditorContext() {
    return myEditorComponent == null ? null : myEditorComponent.getEditorContext();
  }

  @NotNull
  public IOperationContext getOperationContext() {
    return myContext;
  }

  public SNodePointer getCurrentlyEditedNode() {
    return myEditorComponent == null ? null : myEditorComponent.getEditedNodePointer();
  }

  public void dispose() {
    if (myEditorComponent != null) {
      myEditorComponent.dispose();
    }
  }

  private class EditorPanel extends JPanel implements DataProvider {
    private EditorPanel() {
      setLayout(new BorderLayout());
      setBorder(new CompoundBorder(
        new EmptyBorder(1, 1, 1, 1),
        new LineBorder(Color.LIGHT_GRAY, 1)
      ));
    }

    @Nullable
    public Object getData(@NonNls String dataId) {
      if (dataId.equals(MPSDataKeys.MPS_EDITOR.getName())) return BaseNodeEditor.this;
      if (BaseNodeEditor.this instanceof DataProvider) {
        Object data = ((DataProvider) BaseNodeEditor.this).getData(dataId);
        if (data != null) return data;
      }
      EditorComponent ec = getCurrentEditorComponent();
      return ec == null ? null : ec.getData(dataId);
    }
  }

  protected void showEditor() {
    if (myReplace != null) {
      myComponent.remove(myReplace);
      myReplace = null;
    }
    myEditorComponent = new NodeEditorComponent(myContext);
    myComponent.add(myEditorComponent.getExternalComponent(), BorderLayout.CENTER);
  }

  protected void showComponent(JComponent replace) {
    if (myEditorComponent != null) {
      myComponent.remove(myEditorComponent.getExternalComponent());
      myEditorComponent.dispose();
      myEditorComponent = null;
    }

    if (myReplace != null) {
      myComponent.remove(myReplace);
      myReplace = null;
    }

    myReplace = replace;
    myComponent.add(myReplace, BorderLayout.CENTER);
    myComponent.validate();
  }

  //---state---

  @Nullable
  public MPSEditorState saveState(@NotNull FileEditorStateLevel level) {
    BaseEditorState result = new BaseEditorState();
    EditorContext editorContext = getEditorContext();
    if (editorContext != null) {
      boolean full = level == FileEditorStateLevel.UNDO || level == FileEditorStateLevel.FULL;
      result.myMemento = editorContext.createMemento(full);
      EditorComponent editorComponent = getCurrentEditorComponent();
      if (editorComponent instanceof NodeEditorComponent) {
        NodeEditorComponent nodeEditorComponent = (NodeEditorComponent) editorComponent;
        EditorComponent inspector = nodeEditorComponent.getInspector();
        if (inspector != null) {
          EditorContext inspectorContext = inspector.getEditorContext();
          if (inspectorContext != null) {
            result.myInspectorMemento = inspectorContext.createMemento(full);
          }
        }
      }
    }
    return result;
  }

  public void loadState(@NotNull MPSEditorState state) {
    if (!(state instanceof BaseEditorState)) return;

    BaseEditorState s = (BaseEditorState) state;
    if (s.myMemento != null) {
      getEditorContext().setMemento(s.myMemento);
    }
    if (s.myInspectorMemento != null) {
      NodeEditorComponent editorComponent = (NodeEditorComponent) getCurrentEditorComponent();
      if (editorComponent != null) {
        editorComponent.getInspector().getEditorContext().setMemento(s.myInspectorMemento);
      }
    }
  }

  public static class BaseEditorState implements MPSEditorState {
    private static final String MEMENTO = "memento";
    private static final String INSPECTOR_MEMENTO = "inspectorMemento";

    private Object myMemento;
    private Object myInspectorMemento;

    public void refCopyFrom(BaseEditorState source) {
      this.myMemento = source.myMemento;
      this.myInspectorMemento = source.myInspectorMemento;
    }

    public void save(Element e) {
      if (myMemento != null) {
        Element mementoElem = new Element(MEMENTO);
        MementoPersistence.saveMemento(myMemento, mementoElem);
        e.addContent(mementoElem);
      }
      if (myInspectorMemento != null) {
        Element mementoElem = new Element(INSPECTOR_MEMENTO);
        MementoPersistence.saveMemento(myInspectorMemento, mementoElem);
        e.addContent(mementoElem);
      }
    }

    public void load(Element e) {
      Element mementoElem = e.getChild(MEMENTO);
      if (mementoElem != null) {
        myMemento = MementoPersistence.loadMemento(mementoElem);
      }
      Element inspectorMementoElem = e.getChild(MEMENTO);
      if (inspectorMementoElem != null) {
        myInspectorMemento = MementoPersistence.loadMemento(inspectorMementoElem);
      }
    }

    public int hashCode() {
      return myMemento.hashCode() + myInspectorMemento.hashCode();
    }

    public boolean equals(Object obj) {
      if (!(obj instanceof BaseEditorState)) {
        return false;
      }

      BaseEditorState state = (BaseEditorState) obj;
      return ObjectUtils.equals(state.myMemento, myMemento) && ObjectUtils.equals(state.myInspectorMemento, myInspectorMemento);
    }
  }
}
