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
package jetbrains.mps.debugger.api.ui.breakpoints;

import com.intellij.ide.DataManager;
import com.intellij.openapi.actionSystem.AnAction;
import jetbrains.mps.debug.api.AbstractDebugSession;
import jetbrains.mps.debug.api.BreakpointManagerComponent;
import jetbrains.mps.debug.api.breakpoints.BreakpointProvidersManager;
import jetbrains.mps.debug.api.breakpoints.IBreakpoint;
import jetbrains.mps.debug.api.breakpoints.IBreakpointsProvider;
import jetbrains.mps.debug.api.breakpoints.ILocationBreakpoint;
import jetbrains.mps.debugger.api.ui.DebugActionsUtil;
import jetbrains.mps.debugger.api.ui.icons.Icons;
import jetbrains.mps.nodeEditor.EditorMessageIconRenderer;
import jetbrains.mps.nodeEditor.cells.CellFinders;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.nodeEditor.cells.EditorCell_Label;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.AbstractAction;
import javax.swing.Icon;
import javax.swing.JPopupMenu;
import javax.swing.JSeparator;
import java.awt.Component;
import java.awt.Cursor;
import java.awt.event.ActionEvent;

class BreakpointIconRenderer implements EditorMessageIconRenderer {
  public static final IconRendererType TYPE = new IconRendererType(4);
  private final ILocationBreakpoint myBreakpoint;
  private final Component myComponent;

  public static EditorCell getBreakpointIconAnchorCell(EditorCell bigCell) {
    if (bigCell instanceof EditorCell_Collection) {
      EditorCell_Collection collection = (EditorCell_Collection) bigCell;
      return collection.findChild(CellFinders.byClass(EditorCell_Label.class, true));
    }
    return bigCell;
  }

  public static Icon getIconFor(@NotNull IBreakpoint breakpoint) {
    return getIconFor(breakpoint, null);
  }

  private static Icon getIconFor(@NotNull IBreakpoint breakpoint, @Nullable AbstractDebugSession session) {
    if (session != null && session.isMute()) {
      return Icons.MUTED_BREAKPOINT;
    }
    IBreakpointsProvider provider = BreakpointProvidersManager.getInstance().getProvider(breakpoint.getKind());
    if (provider != null) {
      Icon icon = provider.getIcon(breakpoint, null);
      if (icon != null) {
        return icon;
      }
    }
    return breakpoint.isValid() ? (breakpoint.isEnabled() ? Icons.BREAKPOINT : Icons.DISABLED_BREAKPOINT) : Icons.INV_BREAKPOINT;
  }

  public BreakpointIconRenderer(ILocationBreakpoint breakpoint, Component component) {
    myBreakpoint = breakpoint;
    myComponent = component;
  }

  @Override
  public Icon getIcon() {
    return getIconFor(myBreakpoint, DebugActionsUtil.getDebugSession(DataManager.getInstance().getDataContext(myComponent)));
  }

  @Override
  public String getTooltipText() {
    return null;
  }

  @Override
  public SNode getNode() {
    return myBreakpoint.getLocation().getSNode();
  }

  @Override
  public IconRendererType getType() {
    return TYPE;
  }

  @Override
  public EditorCell getAnchorCell(EditorCell bigCell) {
    return getBreakpointIconAnchorCell(bigCell);
  }

  @Override
  public Cursor getMouseOverCursor() {
    return null;
  }

  @Override
  public AnAction getClickAction() {
    return null;
  }

  @Override
  public JPopupMenu getPopupMenu() {
    if (!myBreakpoint.isValid()) {
      return null;
    }
    if (!myBreakpoint.getKind().supportsDisable()) {
      return null;
    }
    JPopupMenu menu = new JPopupMenu();
    menu.add(new AbstractAction(myBreakpoint.isEnabled() ? "Disable" : "Enable") {
      @Override
      public void actionPerformed(ActionEvent e) {
        myBreakpoint.setEnabled(!myBreakpoint.isEnabled());
      }
    });
    menu.add(new AbstractAction("Remove") {
      @Override
      public void actionPerformed(ActionEvent e) {
        BreakpointManagerComponent.getInstance(myBreakpoint.getProject()).removeBreakpoint(myBreakpoint);
      }
    });
    menu.add(new JSeparator());
    menu.add(new AbstractAction("Properties") {
      @Override
      public void actionPerformed(ActionEvent e) {
        BreakpointsUiComponent.getInstance(myBreakpoint.getProject()).editBreakpointProperties(myBreakpoint);
      }
    });
    return menu;
  }
}
