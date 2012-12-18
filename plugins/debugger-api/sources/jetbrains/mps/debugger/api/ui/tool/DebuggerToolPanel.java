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
package jetbrains.mps.debugger.api.ui.tool;

import com.intellij.execution.process.ProcessHandler;
import com.intellij.execution.ui.RunnerLayoutUi;
import com.intellij.execution.ui.layout.PlaceInGrid;
import com.intellij.ide.ui.ListCellRendererWrapper;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.fileEditor.FileEditorManager;
import com.intellij.openapi.project.Project;
import com.intellij.ui.components.JBList;
import com.intellij.ui.components.JBScrollPane;
import com.intellij.ui.content.Content;
import jetbrains.mps.debug.api.AbstractDebugSession;
import jetbrains.mps.debug.api.AbstractUiState;
import jetbrains.mps.debug.api.DebugSessionManagerComponent;
import jetbrains.mps.debug.api.SessionChangeAdapter;
import jetbrains.mps.debug.api.evaluation.IEvaluationProvider;
import jetbrains.mps.debugger.api.ui.breakpoints.EditorUtil;
import jetbrains.mps.debugger.api.ui.icons.Icons;
import jetbrains.mps.debugger.api.ui.tree.VariablesTree;
import jetbrains.mps.debug.api.programState.ILocation;
import jetbrains.mps.debug.api.programState.IStackFrame;
import jetbrains.mps.debug.api.programState.IThread;
import jetbrains.mps.debug.api.programState.NullLocation;
import jetbrains.mps.generator.traceInfo.TraceInfoUtil;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.project.ProjectOperationContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.editors.MPSEditorOpener;
import org.jetbrains.annotations.NotNull;

import javax.swing.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Component;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.List;

public class DebuggerToolPanel {
  private final AbstractDebugSession myDebugSession;
  @NotNull
  private AbstractUiState myUiState;

  private DebuggerToolPanel.ThreadsComboBoxModel myThreadsComboBoxModel;
  private StackFramesListModel myStackFramesListModel;
  private VariablesTree myVariablesTree;
  private JList myFramesList;

  @CodeOrchestraPatch
  private final MPSEditorOpener myEditorOpener;
  private Project myProject;
  private FileEditorManager myFileEditorManager;

  @CodeOrchestraPatch
  public DebuggerToolPanel(Project project, ProcessHandler processHandler, RunnerLayoutUi ui) {
    myDebugSession = DebugSessionManagerComponent.getInstance(project).getDebugSession(processHandler);
    myUiState = myDebugSession.getUiState();
    myDebugSession.addChangeListener(new MySessionChangeListener());

    // RE-2693
    myProject = project;
    myEditorOpener = project.getComponent(MPSEditorOpener.class);
    myFileEditorManager = project.getComponent(FileEditorManager.class);

    ui.getDefaults().initTabDefaults(0, "Debugger", null);

    JPanel framesPanel = new JPanel(new BorderLayout());

    framesPanel.add(createThreadsComponent(), BorderLayout.NORTH);
    framesPanel.add(createStackFrameComponent(), BorderLayout.CENTER);

    Content framesContent = ui.createContent(DebuggerToolContent.FRAMES, framesPanel, "Frames", Icons.FRAMES, null);
    framesContent.setCloseable(false);
    ui.addContent(framesContent, 0, PlaceInGrid.left, false);

    JComponent variablesPanel = createVariablesPanel(project);

    Content variablesContent = ui.createContent(DebuggerToolContent.VARIABLES, variablesPanel, "Variables", Icons.VARIABLES, null);
    variablesContent.setCloseable(false);
    ui.addContent(variablesContent, 0, PlaceInGrid.center, false);

    IEvaluationProvider evaluationProvider = myDebugSession.getEvaluationProvider();
    if (evaluationProvider != null) {
      JComponent watches = evaluationProvider.createWatchesPanel();
      if (watches != null) {
        Content watchesContent = ui.createContent(DebuggerToolContent.WATCHES, watches, "Watches", Icons.WATCHES, null);
        watchesContent.setCloseable(false);
        ui.addContent(watchesContent, 0, PlaceInGrid.right, true);
      }
    }
  }

  private JComponent createVariablesPanel(Project project) {
    myVariablesTree = new VariablesTree(project, myDebugSession.getUiState());
    return new JBScrollPane(myVariablesTree);
  }

  @CodeOrchestraPatch
  private JComponent createThreadsComponent() {
    myThreadsComboBoxModel = new ThreadsComboBoxModel();
    JComboBox threadsComboBox = new JComboBox(myThreadsComboBoxModel);
    threadsComboBox.setRenderer(new ListCellRendererWrapper<IThread>(threadsComboBox.getRenderer()) {
      @Override
      public void customize(JList list, IThread value, int index, boolean selected, boolean hasFocus) {
        if (value != null) {
          setText(value.getPresentation());
          setIcon(value.getPresentationIcon());
        }
      }
    });

    threadsComboBox.setVisible(myUiState.isMultithreaded()); // RE-2693

    return threadsComboBox;
  }

  @CodeOrchestraPatch
  private JComponent createStackFrameComponent() {
    myStackFramesListModel = new StackFramesListModel();
    myFramesList = new JBList(myStackFramesListModel);
    myFramesList.addListSelectionListener(new ListSelectionListener() {
      @Override
      public void valueChanged(final ListSelectionEvent e) {
        if (!e.getValueIsAdjusting()) {
          myStackFramesListModel.selected(myFramesList.getSelectedIndex());
        }
      }
    });

    // RE-2936
    myFramesList.addMouseListener(new MouseAdapter() {
      public void mouseClicked(MouseEvent e) {
        // RE-2969
        int frameIndex = myFramesList.locationToIndex(e.getPoint());
        if (frameIndex == -1) {
          return;
        }

        IStackFrame selectedValue = (IStackFrame) myStackFramesListModel.getElementAt(frameIndex);
        if (selectedValue != null) {
          final ILocation location = selectedValue.getLocation();
          if (location instanceof NullLocation) return;

          ApplicationManager.getApplication().invokeLater(new Runnable() {
            public void run() {
              SNode node = TraceInfoUtil.getNode(location.getUnitName(), location.getFileName(), location.getLineNumber());
              if (node != null) {
                EditorComponent currentEditorComponent = myEditorOpener.openNode(node, ProjectOperationContext.get(myProject), true, false).getCurrentEditorComponent();
                currentEditorComponent.selectNode(node);
              }
            }
          });
        }
      }
    });
    myFramesList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    myFramesList.setCellRenderer(new DefaultListCellRenderer() {
      @Override
      public Component getListCellRendererComponent(JList list, Object value, int index, boolean isSelected, boolean cellHasFocus) {
        Component defaultComponent = super.getListCellRendererComponent(list, value, index, isSelected, cellHasFocus);
        if (value != null) {
          IStackFrame frame = (IStackFrame) value;
          ILocation location = frame.getLocation();
          String framePresentation;
          if (location instanceof NullLocation) {
            framePresentation = "null";
          } else {
            String typename = location.getUnitName();
            int lastDot = typename.lastIndexOf(".");
            String className = typename.substring(lastDot + 1);
            String pckgName = lastDot > 0 ? typename.substring(0, lastDot) : "";
            framePresentation = location.getRoutineName() + "():"
              + location.getLineNumber() /* + " " + className + "(" + pckgName + ")" */ ; // RE-2693
          }
          setText(framePresentation);
          if (!myDebugSession.getDebuggableFramesSelector().isDebuggableFrame(frame)) {
            setForeground(Color.gray);
          }
        }
        return defaultComponent;
      }
    });
    return new JBScrollPane(myFramesList);
  }

  private void updateUi() {
    ApplicationManager.getApplication().invokeLater(new Runnable() {
      @Override
      public void run() {
        myUiState = myDebugSession.getUiState();
        myThreadsComboBoxModel.updateThreads();
        myStackFramesListModel.updateFrames();
        myFramesList.setSelectedValue(myUiState.getStackFrame(), true); // TODO not good
        myVariablesTree.setUiState(myUiState);
        myVariablesTree.rebuildNow();
      }
    });
  }

  private class MySessionChangeListener extends SessionChangeAdapter {
    @Override
    public void stateChanged(AbstractDebugSession session) {
      if (myDebugSession != session) return;
      updateUi();
    }

    @Override
    public void paused(AbstractDebugSession session) {
      if (myDebugSession != session) return;
      updateUi();
    }

    @Override
    public void resumed(AbstractDebugSession session) {
      if (myDebugSession != session) return;
      updateUi();
    }
  }

  private class ThreadsComboBoxModel extends AbstractListModel implements ComboBoxModel {
    @Override
    public void setSelectedItem(Object anItem) {
      myUiState.selectThread((IThread) anItem);
    }

    @Override
    public Object getSelectedItem() {
      return myUiState.getThread();
    }

    @Override
    public int getSize() {
      return getThreads().size();
    }

    @Override
    public Object getElementAt(int index) {
      List<IThread> threads = getThreads();
      if (index >= threads.size()) return null;
      return threads.get(index);
    }

    public void updateThreads() {
      fireContentsChanged(DebuggerToolPanel.this, -1, getSize());
    }

    private List<IThread> getThreads() {
      return myUiState.getThreads();
    }
  }

  private class StackFramesListModel extends AbstractListModel {
    @Override
    public int getSize() {
      return myUiState.getStackFramesCount();
    }

    @Override
    public Object getElementAt(int index) {
      return myUiState.getStackFrame(index);
    }

    public void updateFrames() {
      fireContentsChanged(DebuggerToolPanel.this, -1, getSize());
    }

    public void selected(int selectedIndex) {
      myUiState.selectFrame(selectedIndex);
    }
  }
}
