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
package jetbrains.mps.debug.api.breakpoints;

import com.intellij.openapi.project.Project;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;

public abstract class AbstractBreakpoint implements IBreakpoint {
  protected final Project myProject;
  protected boolean myIsEnabled = true;
  protected long myCreationTime = -1;
  private final List<IBreakpointListener> myListeners = new ArrayList<IBreakpointListener>();

  protected AbstractBreakpoint(Project project) {
    myProject = project;
  }

  public boolean isEnabled() {
    return myIsEnabled;
  }

  public void toggleEnabled() {
    setEnabled(!myIsEnabled);
  }

  public void setCreationTime(long time) {
    myCreationTime = time;
  }

  @Override
  public void addBreakpointListener(@NotNull IBreakpointListener listener) {
    myListeners.add(listener);
  }

  @Override
  public void removeBreakpointListener(IBreakpointListener listener) {
    myListeners.remove(listener);
  }

  public long getCreationTime() {
    return myCreationTime;
  }

  public void setEnabled(final boolean enabled) {
    boolean toggled = setEnabledInternal(enabled);
    if (toggled) {
      fireBreakpointEnabledStateToggled(enabled);
    }
  }

  private boolean setEnabledInternal(boolean enabled) {
    if (getKind().supportsDisable()) {
      if (myIsEnabled != enabled) {
        myIsEnabled = enabled;
        if (myIsEnabled) {
          enableInRunningSessions();
        } else {
          disableInRunningSessions();
        }
        return true;
      }
    }
    return false;
  }

  public Project getProject() {
    return myProject;
  }

  protected void disableInRunningSessions() {
    removeFromRunningSessions();
  }

  protected void enableInRunningSessions() {
    addToRunningSessions();
  }

  // todo come up with better name
  protected void fireBreakpointEnabledStateToggled(boolean enabled) {
    for (IBreakpointListener listener : myListeners) {
      listener.breakpointEnabledStateToggled(this, enabled);
    }
  }

  @Override
  public boolean isValid() {
    return true;
  }
}
