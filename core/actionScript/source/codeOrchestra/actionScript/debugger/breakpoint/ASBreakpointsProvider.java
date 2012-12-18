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
package codeOrchestra.actionScript.debugger.breakpoint;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ProjectManager;
import com.intellij.openapi.project.ProjectManagerAdapter;
import com.intellij.openapi.util.Computable;
import com.intellij.util.xmlb.XmlSerializer;
import codeOrchestra.actionScript.Concepts;
import codeOrchestra.actionScript.debugger.icons.Icons;
import codeOrchestra.actionScript.debugger.ui.ASLocation;
import codeOrchestra.debugger.breakpoint.ICodeOrchestraDebugLocation;
import jetbrains.mps.debug.api.AbstractDebugSession;
import jetbrains.mps.debug.api.BreakpointManagerComponent;
import jetbrains.mps.debug.api.BreakpointManagerComponent.IBreakpointManagerListener;
import jetbrains.mps.debug.api.breakpoints.*;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.annotation.Hack;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import javax.swing.JCheckBox;
import javax.swing.JComponent;
import javax.swing.JPanel;
import javax.swing.border.TitledBorder;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class ASBreakpointsProvider implements IBreakpointsProvider<ASBreakpoint, ASBreakpointKind>, ApplicationComponent {

  public static final String IFUNCTION_CONCEPT = "codeOrchestra.actionScript.structure.IFunctionConcept";
  public static final String CLASS_CONCEPT = "codeOrchestra.actionScript.structure.ClassConcept";

  public static ASBreakpointsProvider getInstance() {
    return ApplicationManager.getApplication().getComponent(ASBreakpointsProvider.class);
  }

  /**
   * @deprecated use ASBreakpointsProvider#getInstance instead
   */
  @Deprecated
  public ASBreakpointsProvider() {
  }

  public static boolean isOnFunctionDeclaration(final ICodeOrchestraDebugLocation locationFromFrame) {
    SNode node = locationFromFrame.getNode();
    if (node == null) {
      return false;
    }
    return node.isInstanceOfConcept(IFUNCTION_CONCEPT);
  }

  public static boolean isOnClassDeclaration(final ICodeOrchestraDebugLocation locationFromFrame) {
    SNode node = locationFromFrame.getNode();
    if (node == null) {
      return false;
    }
    return node.isInstanceOfConcept(CLASS_CONCEPT);
  }

  @Hack
  public static boolean isDebuggableFromStep(final ICodeOrchestraDebugLocation locationFromFrame) {
    final SNode node = locationFromFrame.getNode();
    if (node == null) {
      return false;
    }
    if (node.isInstanceOfConcept(Concepts.STATEMENTS_LIST)) {
      return true;
    }
    if (!node.isInstanceOfConcept(Concepts.STATEMENT)) {
      return false;
    }
    if (ModelAccess.instance().runReadAction(new Computable<Boolean>(){
      public Boolean compute() {
        return SConceptOperations.isExactly(SNodeOperations.getConceptDeclaration(node), Concepts.STATEMENT);
      }
    })) {
      return false;
    }
    return true;
  }

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

  @Override
  public void initComponent() {
    ProjectManager.getInstance().addProjectManagerListener(myProjectListener);
  }

  @Override
  public void disposeComponent() {
    ProjectManager.getInstance().removeProjectManagerListener(myProjectListener);
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "ActionScript Breakpoints Provider";
  }

  @NotNull
  @Override
  public List<ASBreakpointKind> getAllKinds() {
    return Arrays.asList(ASBreakpointKind.values());
  }

  @Override
  public boolean canCreateFromUi(@NotNull ASBreakpointKind kind) {
    return false;
  }

  @Override
  public boolean canCreateFromNode(@NotNull ASBreakpointKind kind) {
    return kind.equals(ASBreakpointKind.LINE_BREAKPOINT);
  }

  @Override
  public ASBreakpoint createFromUi(@NotNull ASBreakpointKind kind, Project project) {
    throw new IllegalArgumentException("Cannot create breakpoint for " + kind);
  }

  @Override
  public ILocationBreakpoint createFromNode(@NotNull SNode node, @NotNull ASBreakpointKind kind, Project project) {
    switch (kind){
      case LINE_BREAKPOINT:
        return new ASLineBreakpoint(node, project);
      default:
        throw new IllegalArgumentException("Cannot create breakpoint for " + kind);
    }
  }

  @Override
  public IBreakpointPropertiesUi<ASBreakpoint> createPropertiesEditor(@NotNull final ASBreakpointKind kind) {
    return new MyIBreakpointPropertiesUi();
  }

  @Override
  @Nullable
  public ASBreakpoint loadFromState(Element state, ASBreakpointKind kind, final Project project) {
    final ASBreakpoint asBreakpoint = loadFromStateInternal(state, kind, project);
    asBreakpoint.addBreakpointListener(myBreakpointListener);
    return asBreakpoint;
  }

  private ASBreakpoint loadFromStateInternal(Element state, ASBreakpointKind kind, Project project) {
    switch (kind) {
      case LINE_BREAKPOINT: {
        final ASBreakpointInfo breakpointInfo = XmlSerializer.deserialize(state, ASBreakpointInfo.class);
        if (!breakpointInfo.isValid()) return null;
        SNodePointer pointer = new SNodePointer(breakpointInfo.myModelReference, breakpointInfo.myNodeId);
        ASLineBreakpoint breakpoint = new ASLineBreakpoint(pointer, project);
        breakpointInfo.initBreakpoint(breakpoint);
        return breakpoint;
      }      
    }
    return null;
  }

  @Override
  @Nullable
  public Element saveToState(@NotNull ASBreakpoint breakpoint) {
    // MPS-11065 exception while saving breakpoints
    if (breakpoint instanceof ILocationBreakpoint) {
      ILocationBreakpoint locationBreakpoint = (ILocationBreakpoint) breakpoint;
      BreakpointLocation location = locationBreakpoint.getLocation();
      if (location.getNodePointer().getNodeId() == null || location.getModelReference() == null) {
        return null;
      }
    }
    switch (breakpoint.getKind()) {
      case LINE_BREAKPOINT:
        return XmlSerializer.serialize(new ASBreakpointInfo(breakpoint, ((ILocationBreakpoint) breakpoint).getLocation()));
    }
    return null;
  }

  public void removeFromCache(ASBreakpoint breakpoint) {
    myBreakpointsIconsCache.remove(breakpoint);
  }

  @Override
  public Icon getIcon(@NotNull ASBreakpoint breakpoint, @Nullable AbstractDebugSession session) {
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

  private Icon getIconInternal(ASBreakpoint breakpoint) {
    switch (breakpoint.getKind()) {
      case LINE_BREAKPOINT:
        return breakpoint.isValid() ? (breakpoint.isEnabled() ? Icons.BREAKPOINT : Icons.DISABLED_BREAKPOINT) : Icons.INV_BREAKPOINT;
    }
    return null;
  }

  private static class MyIBreakpointPropertiesUi implements IBreakpointPropertiesUi<ASBreakpoint> {
    private ASBreakpoint myBreakpoint;
    private final JPanel myMainPanel;
    private final JCheckBox myLogMessageButton;

    public MyIBreakpointPropertiesUi() {
      JPanel actionPanel = new JPanel(new FlowLayout(FlowLayout.LEADING));
      actionPanel.setBorder(new TitledBorder("Actions"));
      myLogMessageButton = new JCheckBox("Log message to console");
      myLogMessageButton.addActionListener(new ActionListener() {
        @Override
        public void actionPerformed(ActionEvent e) {
          myBreakpoint.setLogMessage(myLogMessageButton.isSelected());
        }
      });

      myLogMessageButton.setEnabled(false); // Disabled for now

      actionPanel.add(myLogMessageButton);

      myMainPanel = new JPanel(new FlowLayout(FlowLayout.LEADING));
      myMainPanel.add(actionPanel);
    }

    @Override
    public void setBreakpoint(ASBreakpoint breakpoint) {
      myBreakpoint = breakpoint;
      myLogMessageButton.setSelected(myBreakpoint.isLogMessage());
    }

    @Override
    public JComponent getMainComponent() {
      return myMainPanel;
    }

  }
}
