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
package jetbrains.mps.debugger.java;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ProjectManager;
import com.intellij.openapi.project.ProjectManagerAdapter;
import com.intellij.openapi.wm.WindowManager;
import com.intellij.util.xmlb.XmlSerializer;
import com.sun.jdi.request.EventRequest;
import jetbrains.mps.debug.api.AbstractDebugSession;
import jetbrains.mps.debug.api.BreakpointManagerComponent;
import jetbrains.mps.debug.api.BreakpointManagerComponent.BreakpointManagerListener;
import jetbrains.mps.debug.api.BreakpointManagerComponent.IBreakpointManagerListener;
import jetbrains.mps.debug.api.breakpoints.*;
import jetbrains.mps.debugger.api.ui.icons.Icons;
import jetbrains.mps.debug.breakpoints.*;
import jetbrains.mps.debugger.java.breakpoints.ExceptionBreakpoint.ExceptionBreakpointInfo;
import jetbrains.mps.debugger.java.breakpoints.ExceptionBreakpoint;
import jetbrains.mps.debugger.java.breakpoints.FieldBreakpoint;
import jetbrains.mps.debugger.java.ui.breakpoints.ExceptionChooserDialog;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JavaBreakpointsProvider implements IBreakpointsProvider<JavaBreakpoint, JavaBreakpointKind> {
  private final Map<IBreakpoint, Icon> myBreakpointsIconsCache = new HashMap<IBreakpoint, Icon>();
  private final IBreakpointListener myBreakpointListener = new IBreakpointListener() {
    @Override
    public void breakpointEnabledStateToggled(IBreakpoint breakpoint, boolean enabled) {
      myBreakpointsIconsCache.remove(breakpoint); //todo centralize all listeners
    }
  };
  private final IBreakpointManagerListener myBreakpointsManagerListener = new IBreakpointManagerListener() {
    @Override
    public void breakpointAdded(@NotNull IBreakpoint breakpoint) {
      breakpoint.addBreakpointListener(myBreakpointListener);
    }

    @Override
    public void breakpointRemoved(@NotNull IBreakpoint breakpoint) {
      breakpoint.removeBreakpointListener(myBreakpointListener);
      myBreakpointsIconsCache.remove(breakpoint);
    }
  };
  private final ProjectManagerAdapter myProjectListener = new ProjectManagerAdapter() {
    @Override
    public void projectOpened(Project project) {
      BreakpointManagerComponent.getInstance(project).addChangeListener(myBreakpointsManagerListener);
    }

    @Override
    public void projectClosed(Project project) {
    }

    @Override
    public void projectClosing(Project project) {
      BreakpointManagerComponent.getInstance(project).removeChangeListener(myBreakpointsManagerListener);
    }
  };

  @NotNull
  @Override
  public List<JavaBreakpointKind> getAllKinds() {
    return Arrays.asList(JavaBreakpointKind.values());
  }

  @Override
  public boolean canCreateFromUi(@NotNull JavaBreakpointKind kind) {
    return kind.equals(JavaBreakpointKind.EXCEPTION_BREAKPOINT);
  }

  @Override
  public boolean canCreateFromNode(@NotNull JavaBreakpointKind kind) {
    return kind.equals(JavaBreakpointKind.LINE_BREAKPOINT) || kind.equals(JavaBreakpointKind.FIELD_BREAKPOINT);
  }

  @Override
  public JavaBreakpoint createFromUi(@NotNull JavaBreakpointKind kind, Project project) {
    switch (kind) {
      case EXCEPTION_BREAKPOINT:
        ExceptionChooserDialog dialog = new ExceptionChooserDialog(WindowManager.getInstance().getFrame(project), "Choose Exception Class");
        dialog.showDialog();
        String chosenException = dialog.getSelected();
        if (chosenException == null) {
          return null;
        }
        return new ExceptionBreakpoint(chosenException, project);
      default:
        throw new IllegalArgumentException("Cannot create breakpoint for " + kind);
    }
  }

  @Override
  public ILocationBreakpoint createFromNode(@NotNull SNode node, @NotNull JavaBreakpointKind kind, Project project) {
    switch (kind){
      case LINE_BREAKPOINT:
        return new LineBreakpoint(node, project);
      case FIELD_BREAKPOINT:
        return new FieldBreakpoint(node, project);
      default:
        throw new IllegalArgumentException("Cannot create breakpoint for " + kind);
    }
  }

  @Override
  public IBreakpointPropertiesUi<JavaBreakpoint> createPropertiesEditor(@NotNull final JavaBreakpointKind kind) {
    return new MyIBreakpointPropertiesUi();
  }

  @Override
  @Nullable
  public JavaBreakpoint loadFromState(Element state, JavaBreakpointKind kind, final Project project) {
    final JavaBreakpoint javaBreakpoint = loadFromStateInternal(state, kind, project);
    javaBreakpoint.addBreakpointListener(myBreakpointListener);
    return javaBreakpoint;
  }

  private JavaBreakpoint loadFromStateInternal(Element state, JavaBreakpointKind kind, Project project) {
    switch (kind) {
      case LINE_BREAKPOINT: {
        final JavaBreakpointInfo breakpointInfo = XmlSerializer.deserialize(state, JavaBreakpointInfo.class);
        if (!breakpointInfo.isValid()) return null;
        SNodePointer pointer = new SNodePointer(breakpointInfo.myModelReference, breakpointInfo.myNodeId);
        LineBreakpoint breakpoint = new LineBreakpoint(pointer, project);
        breakpointInfo.initBreakpoint(breakpoint);
        return breakpoint;
      }
      case EXCEPTION_BREAKPOINT: {
        ExceptionBreakpointInfo exceptionBreakpointInfo = XmlSerializer.deserialize(state, ExceptionBreakpointInfo.class);
        ExceptionBreakpoint exceptionBreakpoint = new ExceptionBreakpoint(exceptionBreakpointInfo.myExceptionName, project);
        exceptionBreakpointInfo.initBreakpoint(exceptionBreakpoint);
        return exceptionBreakpoint;
      }
      case METHOD_BREAKPOINT: {
        // I am going to replace method breakpoints with a new ones, so I temporary read old method breakpoints into line breakpoints
        // todo new method breakpoints
        final JavaBreakpointInfo lineBreakpointInfo = XmlSerializer.deserialize(state, JavaBreakpointInfo.class);
        if (!lineBreakpointInfo.isValid()) return null;
        SNodePointer pointer = new SNodePointer(lineBreakpointInfo.myModelReference, lineBreakpointInfo.myNodeId);
        LineBreakpoint lineBreakpoint = new LineBreakpoint(pointer, project);
        lineBreakpointInfo.initBreakpoint(lineBreakpoint);
        return lineBreakpoint;
      }
      case FIELD_BREAKPOINT: {
        final JavaBreakpointInfo fieldBreakpointInfo = XmlSerializer.deserialize(state, JavaBreakpointInfo.class);
        if (!fieldBreakpointInfo.isValid()) return null;
        SNodePointer pointer = new SNodePointer(fieldBreakpointInfo.myModelReference, fieldBreakpointInfo.myNodeId);
        FieldBreakpoint fieldBreakpoint = new FieldBreakpoint(pointer, project);
        fieldBreakpointInfo.initBreakpoint(fieldBreakpoint);
        return fieldBreakpoint;
      }
    }
    return null;
  }

  @Override
  @Nullable
  public Element saveToState(@NotNull JavaBreakpoint breakpoint) {
    // MPS-11065 exception while saving breakpoints
    if (breakpoint instanceof ILocationBreakpoint) {
      ILocationBreakpoint locationBreakpoint = (ILocationBreakpoint) breakpoint;
      BreakpointLocation location = locationBreakpoint.getLocation();
      if (location.getNodePointer().getNodeId() == null || location.getModelReference() == null) {
        return null;
      }
    }
    switch (breakpoint.getKind()) {
      case EXCEPTION_BREAKPOINT:
        return XmlSerializer.serialize(new ExceptionBreakpointInfo((ExceptionBreakpoint) breakpoint));
      case LINE_BREAKPOINT:
        return XmlSerializer.serialize(new JavaBreakpointInfo(breakpoint, ((ILocationBreakpoint) breakpoint).getLocation()));
      case METHOD_BREAKPOINT:
        return XmlSerializer.serialize(new JavaBreakpointInfo(breakpoint, ((ILocationBreakpoint) breakpoint).getLocation()));
      case FIELD_BREAKPOINT:
        return XmlSerializer.serialize(new JavaBreakpointInfo(breakpoint, ((ILocationBreakpoint) breakpoint).getLocation()));
    }
    return null;
  }

  @Override
  public Icon getIcon(@NotNull JavaBreakpoint breakpoint, @Nullable AbstractDebugSession session) {
    if (session != null && session.isMute()) {
      return Icons.MUTED_BREAKPOINT;
    }
    Icon icon = myBreakpointsIconsCache.get(breakpoint);
    if (icon == null) {
      icon = getIconInternal(breakpoint);
      myBreakpointsIconsCache.put(breakpoint, icon);
    }
    return icon;
  }

  private Icon getIconInternal(JavaBreakpoint breakpoint) {
    switch (breakpoint.getKind()) {
      case EXCEPTION_BREAKPOINT:
        return breakpoint.isEnabled() ? jetbrains.mps.debug.integration.ui.icons.Icons.EXCEPTION_BREAKPOINT : jetbrains.mps.debug.integration.ui.icons.Icons.DISABLED_EXCEPTION_BREAKPOINT;
      case LINE_BREAKPOINT:
        return breakpoint.isValid() ? (breakpoint.isEnabled() ? Icons.BREAKPOINT : Icons.DISABLED_BREAKPOINT) : Icons.INV_BREAKPOINT;
      case METHOD_BREAKPOINT:
        return breakpoint.isValid() ? (breakpoint.isEnabled() ? jetbrains.mps.debug.integration.ui.icons.Icons.METHOD_BREAKPOINT : jetbrains.mps.debug.integration.ui.icons.Icons.DISABLED_METHOD_BREAKPOINT) : Icons.INV_BREAKPOINT;
      case FIELD_BREAKPOINT:
        return breakpoint.isValid() ? (breakpoint.isEnabled() ? jetbrains.mps.debug.integration.ui.icons.Icons.FIELD_BREAKPOINT : jetbrains.mps.debug.integration.ui.icons.Icons.DISABLED_FIELD_BREAKPOINT) : Icons.INV_BREAKPOINT;
    }
    return null;
  }

  public void init() {
    ProjectManager.getInstance().addProjectManagerListener(myProjectListener);
  }

  public void dispose() {
    ProjectManager.getInstance().removeProjectManagerListener(myProjectListener);
  }

  private static class MyIBreakpointPropertiesUi implements IBreakpointPropertiesUi<JavaBreakpoint> {
    private JavaBreakpoint myBreakpoint;
    private final JPanel myMainPanel;
    private final JCheckBox myLogMessageButton;
    private final JRadioButton[] myButtons = new JRadioButton[SuspendPolicy.values().length];

    public MyIBreakpointPropertiesUi() {
      JPanel suspendPanel = new JPanel(new FlowLayout(FlowLayout.LEADING));
      suspendPanel.setBorder(new TitledBorder("Suspend policy"));

      ButtonGroup group = new ButtonGroup();
      for (SuspendPolicy policy : SuspendPolicy.values()) {
        JRadioButton button = new JRadioButton(policy.getName());
        myButtons[policy.ordinal()] = button;
        button.setActionCommand(policy.name());
        button.addActionListener(new ActionListener() {
          @Override
          public void actionPerformed(ActionEvent e) {
            SuspendPolicy suspendPolicy = SuspendPolicy.valueOf(e.getActionCommand());
            if (suspendPolicy != null) {
              myBreakpoint.setSuspendPolicy(suspendPolicy.myValue);
            }
          }
        });
        group.add(button);
        suspendPanel.add(button);
      }

      JPanel actionPanel = new JPanel(new FlowLayout(FlowLayout.LEADING));
      actionPanel.setBorder(new TitledBorder("Actions"));
      myLogMessageButton = new JCheckBox("Log message to console");
      myLogMessageButton.addActionListener(new ActionListener() {
        @Override
        public void actionPerformed(ActionEvent e) {
          myBreakpoint.setLogMessage(myLogMessageButton.isSelected());
        }
      });
      actionPanel.add(myLogMessageButton);

      myMainPanel = new JPanel(new FlowLayout(FlowLayout.LEADING));
      myMainPanel.add(suspendPanel);
      myMainPanel.add(actionPanel);
    }

    @Override
    public void setBreakpoint(JavaBreakpoint breakpoint) {
      myBreakpoint = breakpoint;
      int suspendPolicy = breakpoint.getSuspendPolicy();
      for (SuspendPolicy policy : SuspendPolicy.values()) {
        if (policy.myValue == suspendPolicy) {
          myButtons[policy.ordinal()].setSelected(true);
        }
      }
      myLogMessageButton.setSelected(myBreakpoint.isLogMessage());
    }

    @Override
    public JComponent getMainComponent() {
      return myMainPanel;
    }

    private static enum SuspendPolicy {
      ALL(EventRequest.SUSPEND_ALL),
      NONE(EventRequest.SUSPEND_NONE),
      THREAD(EventRequest.SUSPEND_EVENT_THREAD);

      private final int myValue;

      SuspendPolicy(int value) {
        myValue = value;
      }

      public String getName() {
        return this.name().substring(0, 1) + this.name().toLowerCase().substring(1);
      }
    }
  }
}
