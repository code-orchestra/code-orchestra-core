package jetbrains.mps.execution.api.configurations;

/*Generated by MPS */

import com.intellij.execution.process.ProcessAdapter;
import com.intellij.execution.ui.ConsoleView;
import com.intellij.execution.process.ProcessEvent;
import com.intellij.openapi.util.Key;
import com.intellij.execution.process.ProcessOutputTypes;
import com.intellij.execution.ui.ConsoleViewContentType;

public class ConsoleProcessListener extends ProcessAdapter {
  private final ConsoleView myConsoleView;

  public ConsoleProcessListener(ConsoleView consoleView) {
    myConsoleView = consoleView;
  }

  @Override
  public void onTextAvailable(ProcessEvent event, Key key) {
    if (ProcessOutputTypes.STDERR.equals(key)) {
      myConsoleView.print(event.getText(), ConsoleViewContentType.ERROR_OUTPUT);
    } else
    if (ProcessOutputTypes.SYSTEM.equals(key)) {
      myConsoleView.print(event.getText(), ConsoleViewContentType.SYSTEM_OUTPUT);
    } else
    if (ProcessOutputTypes.STDOUT.equals(key)) {
      myConsoleView.print(event.getText(), ConsoleViewContentType.NORMAL_OUTPUT);
    }
  }
}
