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
package jetbrains.mps.debug.api;

import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.project.Project;
import jetbrains.mps.debug.api.breakpoints.IBreakpoint;
import jetbrains.mps.debug.api.breakpoints.ILocationBreakpoint;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.util.annotation.ToRemove;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.*;

@State(
  name = "BreakpointManager",
  storages = {
    @Storage(
      id = "other",
      file = "$WORKSPACE_FILE$"
    )
  }
)
public class BreakpointManagerComponent implements ProjectComponent, PersistentStateComponent<Element> {
  private static final Logger LOG = Logger.getLogger(BreakpointManagerComponent.class);
  private static final String BREAKPOINTS_LIST_ELEMENT = "breakpointsList";
  private static final DummyIO DUMMY_IO = new DummyIO();

  private final Map<SNodePointer, Set<ILocationBreakpoint>> myRootsToBreakpointsMap = new HashMap<SNodePointer, Set<ILocationBreakpoint>>();
  private final Set<IBreakpoint> myBreakpoints = new HashSet<IBreakpoint>();
  private final List<Element> myUnreadBreakpoints = new ArrayList<Element>();
  private IBreakpointsIO myBreakpointsIO = DUMMY_IO;

  private final List<IBreakpointManagerListener> myListeners = new ArrayList<IBreakpointManagerListener>();

  public static BreakpointManagerComponent getInstance(@NotNull Project project) {
    return project.getComponent(BreakpointManagerComponent.class);
  }

  public BreakpointManagerComponent() {
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "Breakpoint Manager";
  }

  @Override
  public void projectOpened() {
  }

  @Override
  public void projectClosed() {
  }

  @Override
  public void initComponent() {
  }

  @Override
  public void disposeComponent() {
    myBreakpointsIO = null; // dispose
  }

  public void setBreakpointsIO(IBreakpointsIO io) {
    myBreakpointsIO = io;
    synchronized (myBreakpoints) {  // todo this is a hack
      loadState(getState());
    }
  }

  public void addBreakpoint(@NotNull IBreakpoint breakpoint) {
    synchronized (myBreakpoints) {
      if (breakpoint instanceof ILocationBreakpoint) {
        addLocationBreakpoint((ILocationBreakpoint) breakpoint);
      }
      breakpoint.setCreationTime(System.currentTimeMillis());
      myBreakpoints.add(breakpoint);
      breakpoint.addToRunningSessions();
    }
    fireBreakpointAdded(breakpoint);
  }

  private void addLocationBreakpoint(ILocationBreakpoint breakpoint) {
    SNode node = breakpoint.getLocation().getSNode();
    if (node != null) {
      SNode root = node.getContainingRoot();
      if (root != null) {
        SNodePointer rootPointer = new SNodePointer(root);
        Set<ILocationBreakpoint> breakpointsForRoot = myRootsToBreakpointsMap.get(rootPointer);
        if (breakpointsForRoot == null) {
          breakpointsForRoot = new HashSet<ILocationBreakpoint>();
          myRootsToBreakpointsMap.put(rootPointer, breakpointsForRoot);
        }
        breakpointsForRoot.add(breakpoint);
      }
    }
  }

  public void removeBreakpoint(@NotNull final IBreakpoint breakpoint) {
    ModelAccess.instance().runReadAction(new Runnable() {
      @Override
      public void run() {
        synchronized (myBreakpoints) {
          if (breakpoint instanceof ILocationBreakpoint) {
            removeLocationBreakpoint((ILocationBreakpoint) breakpoint);
          }
          myBreakpoints.remove(breakpoint);
          breakpoint.removeFromRunningSessions();
        }
      }
    });
    fireBreakpointRemoved(breakpoint);
  }

  private void removeLocationBreakpoint(ILocationBreakpoint breakpoint) {
    SNode node = breakpoint.getLocation().getSNode();
    if (node != null) {
      SNode root = node.getContainingRoot();
      if (root != null) {
        SNodePointer rootPointer = new SNodePointer(root);
        Set<ILocationBreakpoint> breakpointsForRoot = myRootsToBreakpointsMap.get(rootPointer);
        if (breakpointsForRoot != null) {
          breakpointsForRoot.remove(breakpoint);
        }
      }
    }
  }

  private void clear() {
    synchronized (myBreakpoints) {
      myRootsToBreakpointsMap.clear();
      myBreakpoints.clear();
      myUnreadBreakpoints.clear();
    }
  }

  public void loadState(Element state) {
    synchronized (myBreakpoints) {
      clear();
      List breakpointsElement = state.getChildren();
      for (ListIterator it = breakpointsElement.listIterator(); it.hasNext();) {
        Element breakpointElement = (Element) it.next();

        try {
          IBreakpoint breakpoint = myBreakpointsIO.readBreakpoint(breakpointElement);
          if (breakpoint != null) {
            myBreakpoints.add(breakpoint);
          } else {
            myUnreadBreakpoints.add(breakpointElement);
          }
        } catch (Throwable t) {
          LOG.error("Error while loading breakpoint from " + breakpointElement, t);
        }
      }
    }
    ModelAccess.instance().runReadAction(new Runnable() {
      @Override
      public void run() {
        synchronized (myBreakpoints) {
          for (IBreakpoint breakpoint : myBreakpoints) {
            if (breakpoint instanceof ILocationBreakpoint) {
              addLocationBreakpoint((ILocationBreakpoint) breakpoint);
            }
          }
        }
      }
    });
  }

  public Element getState() {
    Element rootElement = new Element(BREAKPOINTS_LIST_ELEMENT);
    synchronized (myBreakpoints) {
      for (IBreakpoint breakpoint : myBreakpoints) {
        try {
          Element element = myBreakpointsIO.writeBreakpoint(breakpoint);
          if (element != null) {
            rootElement.addContent(element);
          }
        } catch (Throwable t) {
          LOG.error("Error while saving breakpoint " + breakpoint.getPresentation(), t);
        }
      }
    }
    for (Element el : myUnreadBreakpoints) {
      rootElement.addContent((Element) el.clone());
    }
    return rootElement;
  }

  public void reReadState(){
    loadState(getState());
  }

  //this is called when a breakpoint is hit

  public void processBreakpointHit(IBreakpoint breakpoint) {
    //todo do something later if necessary (like highlihgting a line, etc)
  }

  public Set<IBreakpoint> getAllIBreakpoints() {
    synchronized (myBreakpoints) {
      return new HashSet<IBreakpoint>(myBreakpoints);
    }
  }

  @CodeOrchestraPatch
  public Set<IBreakpoint> getValidIBreakpoints() {
    synchronized (myBreakpoints) {
      HashSet<IBreakpoint> validBreakpoints = new HashSet<IBreakpoint>();
      for (IBreakpoint breakpoint : myBreakpoints) {
        if (breakpoint.isValid()) {
          validBreakpoints.add(breakpoint);
        }
      }
      return validBreakpoints;
    }
  }

  // TODO legacy method so the users code would compile -- remove after MPS2.0
  @Deprecated
  @ToRemove(version = 2.0)
  public static void notifyDebuggableConceptsAdded() {
  }

  @Deprecated
  @ToRemove(version = 2.0)
  public Set<AbstractMPSBreakpoint> getAllBreakpoints() {
    Set<AbstractMPSBreakpoint> result = new HashSet<AbstractMPSBreakpoint>();
    Set<IBreakpoint> allIBreakpoints = getAllIBreakpoints();
    for (IBreakpoint bp : allIBreakpoints) {
      if (bp instanceof AbstractMPSBreakpoint) {
        result.add((AbstractMPSBreakpoint) bp);
      }
    }
    return result;
  }

  public void addChangeListener(IBreakpointManagerListener listener) {
    synchronized (myListeners) {
      myListeners.add(listener);
    }
  }

  public void removeChangeListener(IBreakpointManagerListener listener) {
    synchronized (myListeners) {
      myListeners.remove(listener);
    }
  }

  private List<IBreakpointManagerListener> getListeners() {
    synchronized (myListeners) {
      return new ArrayList<IBreakpointManagerListener>(myListeners);
    }
  }

  private void fireBreakpointRemoved(IBreakpoint breakpoint) {
    List<IBreakpointManagerListener> listeners = getListeners();
    for (IBreakpointManagerListener listener : listeners) {
      listener.breakpointRemoved(breakpoint);
    }
  }

  private void fireBreakpointAdded(IBreakpoint breakpoint) {
    List<IBreakpointManagerListener> listeners = getListeners();
    for (IBreakpointManagerListener listener : listeners) {
      listener.breakpointAdded(breakpoint);
    }
  }

  public Set<ILocationBreakpoint> getBreakpoints(SNodePointer rootPointer) {
    return myRootsToBreakpointsMap.get(rootPointer);
  }

  public interface IBreakpointManagerListener {
    void breakpointAdded(@NotNull IBreakpoint breakpoint);

    void breakpointRemoved(@NotNull IBreakpoint breakpoint);
  }

  public abstract static class BreakpointManagerListener implements IBreakpointManagerListener {
    @Override
    public void breakpointAdded(@NotNull IBreakpoint breakpoints) {
      breakpointsChanged();
    }

    @Override
    public void breakpointRemoved(@NotNull IBreakpoint breakpoint) {
      breakpointsChanged();
    }

    public abstract void breakpointsChanged();
  }

  public interface IBreakpointsIO {
    @Nullable
    IBreakpoint readBreakpoint(@NotNull Element element);

    @Nullable
    Element writeBreakpoint(@NotNull IBreakpoint breakpoint);
  }

  public static class DummyIO implements IBreakpointsIO {

    @Override
    public IBreakpoint readBreakpoint(@NotNull Element element) {
      return null;
    }

    @Override
    public Element writeBreakpoint(@NotNull IBreakpoint breakpoint) {
      return null;
    }
  }
}
