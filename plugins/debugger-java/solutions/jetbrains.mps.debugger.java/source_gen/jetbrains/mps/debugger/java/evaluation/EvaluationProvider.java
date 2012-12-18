package jetbrains.mps.debugger.java.evaluation;

/*Generated by MPS */

import jetbrains.mps.debug.api.evaluation.IEvaluationProvider;
import jetbrains.mps.debug.runtime.DebugSession;
import jetbrains.mps.debug.evaluation.ui.EvaluationAuxModule;
import java.util.List;
import jetbrains.mps.debugger.java.evaluation.model.AbstractEvaluationModel;
import java.util.ArrayList;
import jetbrains.mps.debug.api.DebugSessionManagerComponent;
import jetbrains.mps.debug.api.AbstractDebugSession;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.IOperationContext;
import com.intellij.openapi.application.ApplicationManager;
import jetbrains.mps.debug.runtime.JavaUiState;
import jetbrains.mps.debugger.java.ui.evaluation.EvaluationDialog;
import jetbrains.mps.debugger.java.ui.evaluation.EditWatchDialog;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JComponent;
import jetbrains.mps.debugger.java.ui.evaluation.WatchesPanel;
import jetbrains.mps.project.ProjectOperationContext;
import jetbrains.mps.baseLanguage.closures.runtime._FunctionTypes;
import jetbrains.mps.debugger.java.evaluation.model.LowLevelEvaluationModel;
import org.jetbrains.annotations.NotNull;

public class EvaluationProvider implements IEvaluationProvider {
  private final DebugSession myDebugSession;
  private EvaluationAuxModule myAuxModule;
  private final List<AbstractEvaluationModel> myWatches = new ArrayList<AbstractEvaluationModel>();
  private final List<EvaluationProvider.IWatchListener> myWatchListeners = new ArrayList<EvaluationProvider.IWatchListener>();

  public EvaluationProvider(DebugSession debugSession) {
    myDebugSession = debugSession;
    DebugSessionManagerComponent.getInstance(myDebugSession.getProject()).addDebugSessionListener(new DebugSessionManagerComponent.DebugSessionAdapter() {
      @Override
      public void registered(AbstractDebugSession session) {
        init();
      }

      @Override
      public void detached(AbstractDebugSession session) {
        dispose();
        DebugSessionManagerComponent.getInstance(myDebugSession.getProject()).removeDebugSessionListener(this);
      }
    });
  }

  private void init() {
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        myAuxModule = new EvaluationAuxModule(myDebugSession.getProject());
      }
    });
  }

  private void dispose() {
    myAuxModule.dispose();
    myAuxModule = null;
  }

  @Override
  public boolean canEvaluate() {
    return myDebugSession.isStepEnabled();
  }

  @Override
  public void showEvaluationDialog(final IOperationContext context) {
    ApplicationManager.getApplication().executeOnPooledThread(new Runnable() {
      @Override
      public void run() {
        JavaUiState state = myDebugSession.getUiState();
        if (state.isPausedOnBreakpoint()) {
          final AbstractEvaluationModel model = createLowLevelEvaluationModel(false);
          ApplicationManager.getApplication().invokeLater(new Runnable() {
            @Override
            public void run() {
              EvaluationDialog evaluationDialog = new EvaluationDialog(context, EvaluationProvider.this, model);
              evaluationDialog.showDialog();
            }
          });
        }
      }
    });
  }

  public void showEditWatchDialog(IOperationContext context, final AbstractEvaluationModel model) {
    ApplicationManager.getApplication().assertIsDispatchThread();
    final EditWatchDialog editWatchDialog = new EditWatchDialog(context, this, model);
    editWatchDialog.addWindowListener(new WindowAdapter() {
      @Override
      public void windowClosed(WindowEvent e) {
        fireWatchUpdated(model);
      }
    });
    editWatchDialog.showDialog();
  }

  @Override
  public JComponent createWatchesPanel() {
    return new WatchesPanel(this);
  }

  public void addWatch(final AbstractEvaluationModel evaluationModel) {
    ApplicationManager.getApplication().executeOnPooledThread(new Runnable() {
      @Override
      public void run() {
        AbstractEvaluationModel copy = evaluationModel.copy(true);
        synchronized (myWatches) {
          myWatches.add(copy);
        }
        fireWatchAdded(copy);
      }
    });
  }

  public void createWatch() {
    ApplicationManager.getApplication().executeOnPooledThread(new Runnable() {
      @Override
      public void run() {
        final AbstractEvaluationModel model = createLowLevelEvaluationModel(true);
        ApplicationManager.getApplication().invokeLater(new Runnable() {
          @Override
          public void run() {
            EditWatchDialog editWatchDialog = new EditWatchDialog(ProjectOperationContext.get(myDebugSession.getProject()), EvaluationProvider.this, model, new _FunctionTypes._void_P0_E0() {
              @Override
              public void invoke() {
                addWatch(model);
              }
            });
            editWatchDialog.showDialog();
          }
        });
      }
    });
  }

  public void removeWatch(AbstractEvaluationModel model) {
    synchronized (myWatches) {
      myWatches.remove(model);
    }
    fireWatchRemoved(model);
  }

  public DebugSession getDebugSession() {
    return myDebugSession;
  }

  public EvaluationAuxModule getAuxModule() {
    return myAuxModule;
  }

  /*package*/ AbstractEvaluationModel createLowLevelEvaluationModel(boolean isShowContext) {
    return new LowLevelEvaluationModel(myDebugSession.getProject(), myDebugSession, getAuxModule(), isShowContext);
  }

  public List<AbstractEvaluationModel> getWatches() {
    List<AbstractEvaluationModel> watchesCopy = new ArrayList<AbstractEvaluationModel>();
    synchronized (myWatches) {
      watchesCopy.addAll(myWatches);
    }
    return watchesCopy;
  }

  private List<EvaluationProvider.IWatchListener> getListeners() {
    List<EvaluationProvider.IWatchListener> listeners = new ArrayList<EvaluationProvider.IWatchListener>();
    synchronized (myWatchListeners) {
      listeners.addAll(myWatchListeners);
    }
    return listeners;
  }

  private void fireWatchAdded(AbstractEvaluationModel model) {
    for (EvaluationProvider.IWatchListener listener : getListeners()) {
      listener.watchAdded(model);
    }
  }

  private void fireWatchUpdated(AbstractEvaluationModel model) {
    for (EvaluationProvider.IWatchListener listener : getListeners()) {
      listener.watchUpdated(model);
    }
  }

  private void fireWatchRemoved(AbstractEvaluationModel model) {
    for (EvaluationProvider.IWatchListener listener : getListeners()) {
      listener.watchRemoved(model);
    }
  }

  public void addWatchListener(@NotNull EvaluationProvider.IWatchListener listener) {
    synchronized (myWatchListeners) {
      myWatchListeners.add(listener);
    }
  }

  public void removeWatchListener(@NotNull EvaluationProvider.IWatchListener listener) {
    synchronized (myWatchListeners) {
      myWatchListeners.remove(listener);
    }
  }

  public static interface IWatchListener {
    public void watchAdded(AbstractEvaluationModel model);
    public void watchUpdated(AbstractEvaluationModel model);
    public void watchRemoved(AbstractEvaluationModel model);
  }

  public static class WatchAdapter implements EvaluationProvider.IWatchListener {
    public WatchAdapter() {
    }

    @Override
    public void watchAdded(AbstractEvaluationModel model) {
    }

    @Override
    public void watchUpdated(AbstractEvaluationModel model) {
    }

    @Override
    public void watchRemoved(AbstractEvaluationModel model) {
    }
  }
}
