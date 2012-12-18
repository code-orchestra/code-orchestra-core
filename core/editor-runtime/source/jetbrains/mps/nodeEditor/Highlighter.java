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

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.command.CommandProcessor;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.fileEditor.FileEditorManager;
import com.intellij.openapi.project.DumbService;
import com.intellij.openapi.project.IndexNotReadyException;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ProjectManager;
import com.intellij.openapi.util.Computable;
import com.intellij.util.messages.MessageBusConnection;
import jetbrains.mps.MPSCore;
import jetbrains.mps.ide.IEditor;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.ide.IdeMain.TestMode;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.make.IMakeService;
import jetbrains.mps.nodeEditor.checking.BaseEditorChecker;
import jetbrains.mps.nodeEditor.inspector.InspectorEditorComponent;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.reloading.ReloadListener;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.event.SModelCommandListener;
import jetbrains.mps.smodel.event.SModelEvent;
import jetbrains.mps.smodel.event.SModelListener;
import jetbrains.mps.typesystem.inference.TypeChecker;
import jetbrains.mps.util.Condition;
import jetbrains.mps.util.WeakSet;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.highlighter.EditorComponentCreateListener;
import jetbrains.mps.workbench.highlighter.EditorsHelper;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import javax.swing.SwingUtilities;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

public class Highlighter implements EditorMessageOwner, ProjectComponent {
  private static final Logger LOG = Logger.getLogger(Highlighter.class);
  private static final Object EVENTS_LOCK = new Object();
  private static final Object CHECKERS_LOCK = new Object();

  public static final Object UPDATE_EDITOR_LOCK = new Object();
  private static final Object ADD_EDITORS_LOCK = new Object();

  private static final Object PENDING_LOCK = new Object();

  private volatile boolean myStopThread = false;
  private FileEditorManager myFileEditorManager;
  private GlobalSModelEventsManager myGlobalSModelEventsManager;
  private ClassLoaderManager myClassLoaderManager;
  protected Thread myThread;
  private Set<BaseEditorChecker> myCheckers = new LinkedHashSet<BaseEditorChecker>(3);
  private Set<BaseEditorChecker> myCheckersToRemove = new LinkedHashSet<BaseEditorChecker>();
  private volatile boolean myForceUpdateInPowerSaveModeFlag = false;
  private List<SModelEvent> myLastEvents = new ArrayList<SModelEvent>();
  private Set<EditorComponent> myCheckedOnceEditors = new WeakSet<EditorComponent>();
  private boolean myInspectorMessagesCreated = false;
  private InspectorTool myInspectorTool;
  private List<Runnable> myPendingActions = new ArrayList<Runnable>();

  @CodeOrchestraPatch
  private volatile boolean disposed = false; // RE-1962
  private static boolean updateEditorLocked = false; // RE-3343

  private volatile long myLastCommandTime = 0;

  private MessageBusConnection myMessageBusConnection;
  private List<IEditor> myAdditionalEditors = new ArrayList<IEditor>();

  private ReloadListener myReloadListener = new ReloadAdapter() {
    public void unload() {
      addPendingAction(new Runnable() {
        public void run() {
          myCheckedOnceEditors.clear();
          myInspectorMessagesCreated = false;
          clearAdditionalEditors();
        }
      });
    }
  };
  private SModelCommandListener myModelCommandListener = new SModelCommandListener() {
    public void eventsHappenedInCommand(List<SModelEvent> events) {
      if (IdeMain.getTestMode() != TestMode.NO_TEST) return;
      synchronized (EVENTS_LOCK) {
        myLastEvents.addAll(events);
      }
    }
  };
  private SModelListener myModelReloadListener = new SModelAdapter() {
    public void modelReplaced(SModelDescriptor sm) {
      for (EditorComponent editorComponent : new ArrayList<EditorComponent>(myCheckedOnceEditors)) {
        SNode sNode = editorComponent.getEditedNode();
        if (sNode != null && !sNode.isDisposed() && sNode.getModel().getModelDescriptor() == sm) {
          myCheckedOnceEditors.remove(editorComponent);
        }
      }
    }
  };

  private Project myProject;
  private ModelAccessListener myCommandListener = new ModelAccessAdapter() {
    public void commandFinished() {
      myLastCommandTime = System.currentTimeMillis();
    }
  };

  /*
   * MPSProject was used as a parameter of this constructor because corresponding component should be initialised after
   * MPSProject and un-initialized before it.
   */
  public Highlighter(MPSProject mpsProject, Project project, ProjectManager projectManager, FileEditorManager fileEditorManager, GlobalSModelEventsManager eventsManager, ClassLoaderManager classLoaderManager, InspectorTool inspector) {
    myProject = project;
    myFileEditorManager = fileEditorManager;
    myGlobalSModelEventsManager = eventsManager;
    myClassLoaderManager = classLoaderManager;
    myInspectorTool = inspector;
  }

  public void projectOpened() {
    if (myThread != null && myThread.isAlive()) {
      LOG.error("trying to initialize a Highlighter being already initialized");
      return;
    }
    myClassLoaderManager.addReloadHandler(myReloadListener);
    myGlobalSModelEventsManager.addGlobalCommandListener(myModelCommandListener);
    myGlobalSModelEventsManager.addGlobalModelListener(myModelReloadListener);

    myInspectorTool = myProject.getComponent(InspectorTool.class);
    myMessageBusConnection = myProject.getMessageBus().connect();
    myMessageBusConnection.subscribe(EditorComponentCreateListener.EDITOR_COMPONENT_CREATION, new EditorComponentCreateListener() {
      @Override
      public void editorComponentCreated(@NotNull EditorComponent editorComponent) {
      }

      @Override
      public void editorComponentDisposed(@NotNull final EditorComponent editorComponent) {
        if (editorComponent == myInspectorTool.getInspector()) {
          addPendingAction(new Runnable() {
            @Override
            public void run() {
              myInspectorMessagesCreated = false;
            }
          });
        }
      }
    });
    ModelAccess.instance().addCommandListener(myCommandListener);
    myThread = new HighlighterThread();
    myThread.start();
  }

  public void projectClosed() {
    stopUpdater();
    ModelAccess.instance().removeCommandListener(myCommandListener);
    myGlobalSModelEventsManager.removeGlobalCommandListener(myModelCommandListener);
    myGlobalSModelEventsManager.removeGlobalModelListener(myModelReloadListener);
    myClassLoaderManager.removeReloadHandler(myReloadListener);
    myMessageBusConnection.disconnect();
    myInspectorTool = null;
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "MPS Higlighter";
  }

  public void initComponent() {

  }

  public void disposeComponent() {
    disposed = true; // RE-1962
  }

  private void addPendingAction(Runnable r) {
    synchronized (PENDING_LOCK) {
      myPendingActions.add(r);
    }
  }

  private void processPendingActions() {
    synchronized (PENDING_LOCK) {
      for (Runnable r : myPendingActions) {
        r.run();
      }
      myPendingActions.clear();
    }
  }

  public void addChecker(BaseEditorChecker checker) {
    if (MPSCore.getInstance().isTestMode()) return;

    if (checker != null) {
      synchronized (CHECKERS_LOCK) {
        myCheckers.add(checker);
      }
      addPendingAction(new Runnable() {
        public void run() {
          myCheckedOnceEditors.clear();
          myInspectorMessagesCreated = false;
        }
      });
    }
  }

  @CodeOrchestraPatch
  public Set<BaseEditorChecker> getCheckers(@NotNull Condition<BaseEditorChecker> condition) {
    synchronized (CHECKERS_LOCK) {
      Set<BaseEditorChecker> result = new HashSet<BaseEditorChecker>();

      for (BaseEditorChecker checker : myCheckers) {
        if (condition.met(checker)) {
          result.add(checker);
        }
      }

      return result;
    }
  }

  public void removeChecker(BaseEditorChecker checker) {
    if (MPSCore.getInstance().isTestMode()) return;

    if (checker != null) {
      synchronized (CHECKERS_LOCK) {
        myCheckers.remove(checker);
        myCheckersToRemove.add(checker);
      }
    }
  }

  public void addAdditionalEditor(IEditor additionalEditor) {
    synchronized (ADD_EDITORS_LOCK) {
      myAdditionalEditors.add(additionalEditor);
    }
  }

  public void removeAdditionalEditor(IEditor additionalEditor) {
    synchronized (ADD_EDITORS_LOCK) {
      myAdditionalEditors.remove(additionalEditor);
    }
  }

  public void clearAdditionalEditors() {
    synchronized (ADD_EDITORS_LOCK) {
      myAdditionalEditors.clear();
    }
  }

  public void stopUpdater() {
    myStopThread = true;
    try {
      /**
       * This method will be called inside write action, so by a chance there can be a deadlock
       * (Highligher is trying to call read actions from time to time), so we are limiting waiting time
       * to some reasonable value here and adding "if (myStopThread)" checks as a first statement into
       * all read actions executed by Highligher.
       */
      int attemptCounter = 10;
      while (myThread.isAlive() && attemptCounter > 0) {
        Thread.sleep(10);
        attemptCounter--;
      }
    } catch (InterruptedException e) {
      LOG.error(e);
    }
  }

  protected void doUpdate() {
    if (ApplicationManager.getApplication().isDisposed()) {
      return;
    }
    if (IMakeService.INSTANCE.get().isSessionActive()) {
      return;
    }
    // SwingUtilities.invokeLater(new Runnable() {
    //   public void run() {

    List<SModelEvent> events = new ArrayList<SModelEvent>();
    synchronized (EVENTS_LOCK) {
      events.addAll(myLastEvents);
      myLastEvents.clear();
    }

    Set<BaseEditorChecker> checkers = new LinkedHashSet<BaseEditorChecker>();
    Set<BaseEditorChecker> checkersToRemove = new LinkedHashSet<BaseEditorChecker>();
    // to avoid inconsistency between checkers, we collect them from fields here
    // in the synchronized block and then do not read the fields in this iteration anymore
    synchronized (CHECKERS_LOCK) {
      if (!EditorSettings.getInstance().isPowerSaveMode() || myForceUpdateInPowerSaveModeFlag) {
        // calling checkers only if we are not in powerSafeMode or updateEditorFlag was set by
        // explicit update action (available in powerSafeMode only)
        checkers.addAll(myCheckers);
        myForceUpdateInPowerSaveModeFlag = false;
      }
      checkersToRemove.addAll(myCheckersToRemove);
      myCheckersToRemove.clear();
    }

    final List<EditorComponent> allEditorComponents = getAllEditorComponents();
    runUpdateMessagesAction(new Runnable() {
      @Override
      public void run() {
        if (EditorSettings.getInstance().isPowerSaveMode()) {
          // if we are in powerSaveMode then next editor checkers execution should
          // recheck all editors completely
          myCheckedOnceEditors.clear();
          myInspectorMessagesCreated = false;
        } else {
          cleanupCheckedOnce(allEditorComponents);
        }
      }
    });
    if (checkers.isEmpty() && checkersToRemove.isEmpty()) {
      return;
    }

    boolean isUpdated = false;
    boolean inspectorIsUpdated = false;
    EditorComponent inspector = null;
    try {
      TypeChecker.getInstance().enableGlobalSubtypingCache();
      for (EditorComponent editorComponent : allEditorComponents) {
        if (myStopThread) {
          return;
        }
        if (updateEditorComponent(editorComponent, events, checkers, checkersToRemove, false)) {
          isUpdated = true;
        }
      }

      if (myStopThread) {
        return;
      }
      if (myInspectorTool != null && myInspectorTool.getInspector() != null) {
        inspector = myInspectorTool.getInspector();
        if (updateEditorComponent(inspector, events, checkers, checkersToRemove, isUpdated)) {
          inspectorIsUpdated = true;
        }
      }
    } finally {
      TypeChecker.getInstance().clearGlobalSubtypingCache();
    }
    if (myStopThread) {
      return;
    }

    if (isUpdated) {
      for (EditorComponent editorComponent : allEditorComponents) {
        editorComponent.repaint();
        editorComponent.getMessagesGutter().repaint();
      }
    }
    if (inspectorIsUpdated) {
      inspector.repaint();
      inspector.getMessagesGutter().repaint();
    }
  }

  private List<EditorComponent> getAllEditorComponents() {
    // RE-1962
    if (disposed || myStopThread) {
      return new ArrayList<EditorComponent>();
    }

    final List<IEditor> list;
    synchronized (ADD_EDITORS_LOCK) {
      list = EditorsHelper.getSelectedEditors(myFileEditorManager);
      if (!myAdditionalEditors.isEmpty()) {
        list.addAll(myAdditionalEditors);
      }
    }
    final List<EditorComponent> editorComponents = new ArrayList();
    try {
      SwingUtilities.invokeAndWait(new Runnable() {
        public void run() {
          for (IEditor editor : list) {
            EditorComponent editorComponent = editor.getCurrentEditorComponent();
            if (editorComponent != null) {
              editorComponents.add(editorComponent);
            }
          }
        }
      });
    } catch (InterruptedException e) {
      e.printStackTrace();
    } catch (InvocationTargetException e) {
      e.printStackTrace();
    }
    return editorComponents;
  }

  @CodeOrchestraPatch
  public static void runUpdateMessagesAction(Runnable updateAction) {
    try {
      updateEditorLocked = true;
      synchronized (UPDATE_EDITOR_LOCK) {
        updateAction.run();
      }
    } finally {
      updateEditorLocked = false;
    }
  }

  @CodeOrchestraPatch
  public static <C> C runUpdateMessagesAction(Computable<C> updateAction) {
    C c;
    try {
      updateEditorLocked = true;
      synchronized (UPDATE_EDITOR_LOCK) {
        c = updateAction.compute();
      }
    } finally {
      updateEditorLocked = false;
    }
    return c;
  }

  public static boolean isUpdateEditorLocked() {
    return updateEditorLocked;
  }

  private boolean updateEditorComponent(final EditorComponent component, final List<SModelEvent> events, final Set<BaseEditorChecker> checkers, final Set<BaseEditorChecker> checkersToRemove, final boolean mainEditorMessagesChanged) {
    return runUpdateMessagesAction(new Computable<Boolean>() {
      public Boolean compute() {
        final SNode editedNode = component.getEditedNode();
        if (editedNode != null && !editedNode.isDisposed()) {
          final Set<BaseEditorChecker> checkersToRecheck = new LinkedHashSet<BaseEditorChecker>();
          boolean rootWasCheckedOnce = wasCheckedOnce(component);
          if (!rootWasCheckedOnce) {
            checkersToRecheck.addAll(checkers);
          } else {
            ModelAccess.instance().runReadAction(new Runnable() {
              public void run() {
                if (myStopThread) {
                  return;
                }
                for (BaseEditorChecker checker : checkers) {
                  if (checker.hasDramaticalEventProtected(events)) {
                    checkersToRecheck.add(checker);
                  }
                }
              }
            });
          }

          if ((checkersToRecheck.isEmpty() && checkersToRemove.isEmpty()) || myStopThread) {
            return false;
          }
          List<BaseEditorChecker> checkersToRecheckList = new ArrayList<BaseEditorChecker>(checkersToRecheck);
          Collections.sort(checkersToRecheckList, new PriorityComparator());

          boolean recreateInspectorMessages = mainEditorMessagesChanged || !myInspectorMessagesCreated;
          if (component instanceof InspectorEditorComponent) {
            myInspectorMessagesCreated = true;
          } else {
            myCheckedOnceEditors.add(component);
          }


          if (updateEditor(component, events, rootWasCheckedOnce, checkersToRecheckList, checkersToRemove, recreateInspectorMessages)) {
            return true;
          }
        }
        return false;
      }
    });
  }

  /*
   * Only currently visible (active) editor remains in myCheckedOnceEditors forcing all Checkers
   * to createMessages() on next visible (active) editor change
   */
  private void cleanupCheckedOnce(List<EditorComponent> allEditorComponents) {
    myCheckedOnceEditors.retainAll(allEditorComponents);
  }

  private boolean wasCheckedOnce(EditorComponent editorComponent) {
    if (editorComponent instanceof InspectorEditorComponent) return true;
    return myCheckedOnceEditors.contains(editorComponent);
  }

  public void resetCheckedState(final EditorComponent editorComponent) {
    runUpdateMessagesAction(new Runnable() {
      public void run() {
        myForceUpdateInPowerSaveModeFlag = true;
        if (editorComponent instanceof InspectorEditorComponent) {
          myInspectorMessagesCreated = false;
          return;
        }
        myCheckedOnceEditors.remove(editorComponent);
      }
    });
  }

  private boolean updateEditor(final EditorComponent editor, final List<SModelEvent> events, final boolean wasCheckedOnce, List<BaseEditorChecker> checkersToRecheck, Set<BaseEditorChecker> checkersToRemove, boolean recreateInspectorMessages) {
    if (editor == null || editor.getRootCell() == null) return false;

    final NodeHighlightManager highlightManager = editor.getHighlightManager();
    boolean anyMessageChanged = false;
    for (final BaseEditorChecker checker : checkersToRecheck) {
      final LinkedHashSet<EditorMessage> messages = new LinkedHashSet<EditorMessage>();
      boolean changed = runLoPrioRead(new Computable<Boolean>() {
        public Boolean compute() {
          if (myStopThread) return false;

          SNode node = editor.getEditedNode();
          if (node == null || node.isDisposed()) return false;
          if (node.getModel().getModelDescriptor() == null) {
            // asking runLoPrioRead() implementation to re-execute this task later:
            // editor was not updated in accordance with last modelReload event yet.
            return null;
          }

          EditorContext editorContext = editor.getEditorContext();
          if (editorContext != null) {
            IOperationContext operationContext = editor.getOperationContext();
            if (operationContext.isValid()) {
              try {
                messages.addAll(checker.createMessagesProtected(node, events, wasCheckedOnce, editorContext));
                return checker.areMessagesChangedProtected();
              } catch (IndexNotReadyException ex) {
                highlightManager.clearForOwner(checker, true);
                checker.clearProtected(node, editor);
                throw ex;
              }
            }
          }

          return false;
        }
      });
      if (myStopThread) return false;

      if (editor instanceof InspectorEditorComponent && recreateInspectorMessages) {
        changed = true;
      }

      if (changed) {
        anyMessageChanged = true;
        highlightManager.clearForOwner(checker, false);
        for (EditorMessage message : messages) {
          highlightManager.mark(message);
        }
      }
    }
    for (final BaseEditorChecker checker : checkersToRemove) {
      EditorMessageOwner owner = ModelAccess.instance().runReadAction(new Computable<EditorMessageOwner>() {
        public EditorMessageOwner compute() {
          if (myStopThread) return null;
          SNode node = editor.getEditedNode();
          if (node == null) return null;
          return checker;
        }
      });
      if (myStopThread) return false;

      highlightManager.clearForOwner(owner, false);
      anyMessageChanged = true;
    }
    if (myStopThread) return false;

    if (anyMessageChanged) {
      highlightManager.repaintAndRebuildEditorMessages();
      editor.updateStatusBarMessage();
    }

    return anyMessageChanged;
  }

  private static <T> T runLoPrioRead(final Computable<T> computable) {
    T result;
    do {
      while (IMakeService.INSTANCE.get().isSessionActive()) {
        try {
          Thread.sleep(600);
        } catch (InterruptedException e) {
        }
      }
      result = ModelAccess.instance().runReadAction(new Computable<T>() {
        @Override
        public T compute() {
          if (IMakeService.INSTANCE.get().isSessionActive() || ModelAccess.instance().hasScheduledWrites()) return null;
          return computable.compute();
        }
      });
    } while (result == null);

    return result;
  }

  private class HighlighterThread extends Thread {
    public HighlighterThread() {
      super("Highlighter");
      setDaemon(true);
    }

    public void run() {
      if (IdeMain.getTestMode() != TestMode.NO_TEST) return;
      DumbService dumbService = DumbService.getInstance(myProject);
      CommandProcessor commandProcessor = CommandProcessor.getInstance();
      while (true) {
        try {
          while (true) {
            while (commandProcessor.getCurrentCommand() != null) {
              if (myStopThread) {
                return;
              }
              Thread.sleep(200);
            }
            while (dumbService.isDumb()) {
              if (myStopThread) return;
              Thread.sleep(600);
            }
            long current = System.currentTimeMillis();
            long commandTime = myLastCommandTime;
            long millisSinceLastCommand = current - commandTime;
            if (millisSinceLastCommand < 200) {
              long millis = 200 - millisSinceLastCommand;
              Thread.sleep(millis);
            } else break;
          }
          if (myStopThread) return;

          try {
            doUpdate();
          } catch (IndexNotReadyException ex) {
            myCheckedOnceEditors.clear();
            myInspectorMessagesCreated = false;
          }
          processPendingActions();
          if (myStopThread) {
            return;
          }
          Thread.sleep(300);
        } catch (Throwable t) {
          LOG.error(t);
        }
      }
    }
  }
}
