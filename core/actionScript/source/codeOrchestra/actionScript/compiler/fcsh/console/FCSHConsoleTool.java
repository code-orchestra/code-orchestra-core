package codeOrchestra.actionScript.compiler.fcsh.console;

import com.intellij.execution.ui.ConsoleView;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.wm.ToolWindowAnchor;
import jetbrains.mps.execution.api.configurations.ConsoleCreator;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.workbench.tools.BaseProjectTool;

import javax.swing.JPanel;
import javax.swing.SwingUtilities;
import java.awt.BorderLayout;

/**
 * @author Alexander Eliseyev
 */
public class FCSHConsoleTool extends BaseProjectTool {

  public static final String ID = "FCSH";

  private ConsoleView myConsoleView;
  private JPanel myComponent;

  public FCSHConsoleTool(Project project) {
    super(project, ID, 2, Icons.PROJECT_ICON, ToolWindowAnchor.BOTTOM, true, false);
  }

  public ConsoleView getConsoleView() {
    return myConsoleView;
  }

  public JPanel getComponent() {
    return myComponent;
  }

  @Override
  public void initComponent() {
    super.initComponent();
    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        FCSHConsoleTool.this.myConsoleView = ConsoleCreator.createConsoleView(getProject(), false);
        FCSHConsoleTool.this.myComponent = new JPanel(new BorderLayout());
        FCSHConsoleTool.this.myComponent.add(FCSHConsoleTool.this.myConsoleView.getComponent());
      }
    });
  }

  @Override
  public void disposeComponent() {
    super.disposeComponent();
    myConsoleView.dispose();
    myComponent = null;
  }
}
