package codeOrchestra.utils.macro.ui;

import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.wm.WindowManager;
import com.intellij.openapi.wm.impl.IdeFrameImpl;
import codeOrchestra.utils.ProjectHolder;
import codeOrchestra.utils.macro.KeyLogger;
import codeOrchestra.utils.macro.KeyLoggerListener;
import codeOrchestra.utils.macro.KeyLoggerReport;
import codeOrchestra.utils.macro.KeyStroke;
import jetbrains.mps.ide.smodel.CurrentProjectAccessUtil;
import jetbrains.mps.nodeEditor.CaretBlinker;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.action.BaseAction;

import javax.swing.SwingUtilities;
import java.awt.Point;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class ToggleKeyLoggingAction extends BaseAction implements KeyLoggerListener {

  private static final String LOGGING_TITLE = "Code Orchestra 2.0";
  private static final PropertyChangeListener TITLE_CHANGE_LISTENER = new PropertyChangeListener() {
    @Override
    public void propertyChange(PropertyChangeEvent propertyChangeEvent) {
      setFrameTitle(LOGGING_TITLE);
    }
  };
  private List<KeyStroke> recordedKeyStrokes = new ArrayList<KeyStroke>();

  private boolean on;
  private long startTime;

  private String titleWas;

  public ToggleKeyLoggingAction() {
    super("Toggle Key Logging");
  }

  @Override
  protected boolean isEnabledInASView() {
    return true;
  }

  @Override
  protected void doExecute(final AnActionEvent e, Map<String, Object> params) {
    final Project project = CurrentProjectAccessUtil.getProjectFromUI();

    if (on) {
      // Turn off
      this.on = false;

      Point initialCaretPosition = KeyLogger.getInstance().getInitialCaretPosition();

      KeyLogger.getInstance().toggle(false);
      KeyLogger.getInstance().removeKeyLoggerListener(this);

      KeyLoggerReport keyLoggerReport = new KeyLoggerReport(startTime, recordedKeyStrokes, initialCaretPosition);
      String outputPath = keyLoggerReport.write(project);

      WindowManager.getInstance().getFrame(ProjectHolder.getProject()).removePropertyChangeListener("title", TITLE_CHANGE_LISTENER);
      setFrameTitle(titleWas);

      // WindowManager.getInstance().getIdeFrame(project).getStatusBar().setInfo("Key logging finished, output: " + outputPath); // RE-4140
    } else {
      // Turn on
      this.on = true;

      reset();

      SwingUtilities.invokeLater(new Runnable() {
        @Override
        public void run() {
          try {
            Thread.sleep(100);
          } catch (InterruptedException e1) {
            // ignore
          }

          KeyLogger.getInstance().toggle(true);

          KeyLogger.getInstance().addKeyLoggerListener(ToggleKeyLoggingAction.this);

          titleWas = WindowManager.getInstance().getFrame(ProjectHolder.getProject()).getTitle();

          setFrameTitle(LOGGING_TITLE);
          WindowManager.getInstance().getFrame(ProjectHolder.getProject()).addPropertyChangeListener("title", TITLE_CHANGE_LISTENER);

          // WindowManager.getInstance().getIdeFrame(project).getStatusBar().setInfo("Key logging started"); // RE-4140
        }
      });
    }
  }

  private static void setFrameTitle(String loggingTitle) {
    ((IdeFrameImpl) WindowManager.getInstance().getFrame(ProjectHolder.getProject())).setFrameTitle(loggingTitle);
  }

  private void reset() {
    this.recordedKeyStrokes.clear();
    this.startTime = System.currentTimeMillis();
  }

  @Override
  public void onNewKeyStroke(KeyStroke keyStoke) {
    recordedKeyStrokes.add(keyStoke);
  }
}
