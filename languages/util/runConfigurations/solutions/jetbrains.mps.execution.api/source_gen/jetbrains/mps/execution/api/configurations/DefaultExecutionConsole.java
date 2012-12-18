package jetbrains.mps.execution.api.configurations;

/*Generated by MPS */

import com.intellij.execution.ui.ExecutionConsole;
import org.jetbrains.annotations.Nullable;
import jetbrains.mps.baseLanguage.closures.runtime._FunctionTypes;
import javax.swing.JComponent;

public class DefaultExecutionConsole implements ExecutionConsole {
  @Nullable
  private final _FunctionTypes._void_P0_E0 myDispose;
  private final JComponent myComponent;

  public DefaultExecutionConsole(JComponent component, @Nullable _FunctionTypes._void_P0_E0 dispose) {
    myDispose = dispose;
    myComponent = component;
  }

  public JComponent getPreferredFocusableComponent() {
    return myComponent;
  }

  public void dispose() {
    if (myDispose == null) {
      return;
    }
    myDispose.invoke();
  }

  public JComponent getComponent() {
    return myComponent;
  }
}
