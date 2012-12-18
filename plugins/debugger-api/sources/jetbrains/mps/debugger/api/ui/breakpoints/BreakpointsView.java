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

import com.intellij.openapi.actionSystem.DataKey;
import com.intellij.openapi.actionSystem.DataProvider;
import jetbrains.mps.debug.api.BreakpointManagerComponent;
import jetbrains.mps.debug.api.BreakpointManagerComponent.BreakpointManagerListener;
import jetbrains.mps.debug.api.BreakpointManagerComponent.IBreakpointManagerListener;
import jetbrains.mps.debug.api.breakpoints.IBreakpoint;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.JComponent;
import java.util.*;

abstract class BreakpointsView implements DataProvider {
  public static DataKey<IBreakpoint> MPS_BREAKPOINT = DataKey.create("MPS_Breakpoint");
  private List<IBreakpoint> myBreakpointsList;
  protected final BreakpointManagerComponent myBreakpointsManager;
  private final List<BreakpointSelectionListener> mySelectionListeners = new ArrayList<BreakpointSelectionListener>();

  public BreakpointsView(BreakpointManagerComponent breakpointsManager) {
    myBreakpointsManager = breakpointsManager;
    updateBreakpoints();
  }

  public void dispose() {
  }

  protected final void updateBreakpoints() {
    myBreakpointsList = loadBreakpoints();
  }

  protected List<IBreakpoint> getBreakpointsList() {
    return myBreakpointsList;
  }

  @CodeOrchestraPatch
  protected List<IBreakpoint> loadBreakpoints() {
    Set<IBreakpoint> mpsBreakpoints = myBreakpointsManager.getValidIBreakpoints(); // RE-2837
    final List<IBreakpoint> bpList = new ArrayList<IBreakpoint>(mpsBreakpoints);

    Collections.sort(bpList, new Comparator<IBreakpoint>() {
      @Override
      public int compare(IBreakpoint o1, IBreakpoint o2) {
        return (int) (o1.getCreationTime() - o2.getCreationTime());
      }
    });
    return bpList;
  }

  public void addBreakpointSelectionListener(@NotNull BreakpointSelectionListener l){
    mySelectionListeners.add(l);
  }

  public void removeBreakpointSelectionListener(@NotNull BreakpointSelectionListener l){
    mySelectionListeners.remove(l);
  }

  protected void fireBreakpointSelected(@Nullable IBreakpoint breakpoint) {
    for (BreakpointSelectionListener l : mySelectionListeners) {
      l.breakpointSelected(breakpoint);
    }
  }

  public void saveState() {
  }

  public abstract String getTitle();

  public abstract void update();

  public abstract JComponent getMainComponent();

  @Nullable
  public abstract IBreakpoint getSelectedBreakpoint();

  public abstract void selectBreakpoint(@Nullable IBreakpoint breakpoint);

  public static interface BreakpointSelectionListener {
    public void breakpointSelected(@Nullable IBreakpoint breakpoint);
  }
}
