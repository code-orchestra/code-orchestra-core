package jetbrains.mps.debugger.java.ui.evaluation;

/*Generated by MPS */

import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.debugger.java.evaluation.EvaluationProvider;
import jetbrains.mps.debug.runtime.SessionStopDisposer;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.debugger.java.evaluation.model.AbstractEvaluationModel;
import jetbrains.mps.debug.runtime.DebugSession;
import com.intellij.openapi.application.ApplicationManager;
import javax.swing.JComponent;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings;

public abstract class AbstractEvaluationDialog extends BaseDialog {
  protected final EvaluationProvider myProvider;
  protected final EvaluationPanel myEvaluationPanel;
  private final SessionStopDisposer mySessionStopDisposer;

  public AbstractEvaluationDialog(IOperationContext context, EvaluationProvider provider, AbstractEvaluationModel model, String title) {
    super(context.getMainFrame(), title);

    setModal(false);

    myProvider = provider;
    final DebugSession debugSession = provider.getDebugSession();
    myEvaluationPanel = new EvaluationPanel(context.getProject(), debugSession, model, false);
    myEvaluationPanel.setErrorTextListener(new EvaluationUi.IErrorTextListener() {
      public void updateErrorText(String text) {
        setErrorText(text);
      }
    });

    mySessionStopDisposer = new SessionStopDisposer(debugSession) {
      public void doDispose() {
        ApplicationManager.getApplication().invokeLater(new Runnable() {
          public void run() {
            dispose();
          }
        });
      }
    };

  }

  protected JComponent getMainComponent() {
    return myEvaluationPanel;
  }

  @Override
  public void dispose() {
    ApplicationManager.getApplication().assertIsDispatchThread();
    super.dispose();
    myEvaluationPanel.dispose();
  }

  @Override
  public DialogDimensionsSettings.DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensionsSettings.DialogDimensions(100, 200, 500, 500);
  }
}
