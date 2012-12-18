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
package jetbrains.mps.ide.dialogs;

import com.intellij.openapi.Disposable;
import com.intellij.openapi.util.Disposer;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings.DialogDimensions;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.ModelAccess;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.*;
import java.util.List;

public abstract class BaseDialog extends JDialog {
  private static final Logger LOG = Logger.getLogger(BaseDialog.class);

  private JLabel myErrorLabel = new ErrorLabel();
  private boolean myPrepared = false;

  private Disposable myDisposableParent = new MyDisposable();
  private Disposable myDisposableChild = new MyDisposable();

  protected BaseDialog(Frame owner) throws HeadlessException {
    this(owner, null);
  }

  protected BaseDialog(Frame mainFrame, String text) throws HeadlessException {
    this(mainFrame, text, true);
  }

  protected BaseDialog(Dialog owner, String title) throws HeadlessException {
    super(owner, title);
    Disposer.register(myDisposableParent, myDisposableChild);
    doInit(owner);
  }

  //required for invocation of "super" in descendants before initialization
  protected BaseDialog(Frame mainFrame, String text, boolean init) throws HeadlessException {
    super(mainFrame, text, true);
    Disposer.register(myDisposableParent, myDisposableChild);
    if (init) {
      doInit(mainFrame);
    }
  }

  public void dispose() {
    Disposer.dispose(myDisposableParent);
    super.dispose();
  }

  protected void doInit(Component mainFrame) {
    //do not remove this code
    //it require to run MPS correctly on system
    //with many monitors
    setLocationRelativeTo(mainFrame);

    this.addWindowListener(new WindowAdapter() {
      public void windowClosed(WindowEvent e) {
        saveMyDimensionSettings();
      }
    });

    updateDimensionSettings();
    setLocation(myDialogDimensions.getLeft(), myDialogDimensions.getTop());
    setSize(myDialogDimensions.getWidth(), myDialogDimensions.getHeight());
  }


  public void setDefaultButton(JButton button) {
    getRootPane().setDefaultButton(button);
  }

  protected DialogDimensions myDialogDimensions;

  protected static void saveDimensionSettings(int left, int top, int width, int height, Class<? extends BaseDialog> cls) {
    DialogDimensionsSettings.getInstance().saveDimensionSettings(left, top, width, height, cls);
  }

  protected void saveMyDimensionSettings() {
    Point p = getLocation();
    Dimension d = getSize();
    myDialogDimensions.setTop((int) p.getY());
    myDialogDimensions.setLeft((int) p.getX());
    myDialogDimensions.setWidth((int) d.getWidth());
    myDialogDimensions.setHeight((int) d.getHeight());
    saveDimensionSettings(myDialogDimensions.getLeft(), myDialogDimensions.getTop(), myDialogDimensions.getWidth(), myDialogDimensions.getHeight(), this.getClass());
  }

  public DialogDimensionsSettings.DialogDimensions getDefaultDimensionSettings() {
    Dimension size = getPreferredSize();
    return new DialogDimensions(100, 200, size.width, size.height);
  }

  protected static DialogDimensionsSettings.DialogDimensions getDimensionSettings(Class<? extends BaseDialog> cls) {
    return DialogDimensionsSettings.getInstance().getDimensionSettings(cls);
  }

  private boolean isValidPosition(int x, int y) {
    Point location = new Point(x, y);
    GraphicsDevice devices[] = GraphicsEnvironment.getLocalGraphicsEnvironment().getScreenDevices();
    for (GraphicsDevice d : devices) {
      Rectangle bounds = d.getDefaultConfiguration().getBounds();
      if (bounds.contains(location)) return true;
    }
    return false;
  }

  protected void updateDimensionSettings() {
    myDialogDimensions = getDimensionSettings(this.getClass());
    if (myDialogDimensions == null) {
      myDialogDimensions = getDefaultDimensionSettings();
      return;
    }
    int x = myDialogDimensions.getLeft();
    int y = myDialogDimensions.getTop();
    boolean isValid = isValidPosition(x, y);
    x += myDialogDimensions.getWidth();
    isValid = isValid && isValidPosition(x, y);
    y += myDialogDimensions.getHeight();
    isValid = isValid && isValidPosition(x, y);
    x -= myDialogDimensions.getWidth();
    isValid = isValid && isValidPosition(x, y);
    if (!isValid) {
      myDialogDimensions = getDefaultDimensionSettings();
    }
  }

  public void showDialog() {
    if (!ThreadUtils.isEventDispatchThread()) {
      LOG.error("Dialogs should be shown in EDT ", new Throwable());
    }

    if (ModelAccess.instance().canRead() || ModelAccess.instance().canWrite()) {
      LOG.error("Dialogs shouldn't be called with lock on a stack", new Throwable());
    }

    prepareDialog();
    setVisible(true);
  }

  public boolean stretchMainComponent() {
    return true;
  }

  protected void prepareDialog() {
    if (myPrepared) {
      return;
    }

    ((JComponent) getContentPane()).setBorder(BorderFactory.createEmptyBorder(4, 4, 4, 4));

    setLayout(new BorderLayout());

    JPanel panel1 = new JPanel(new BorderLayout());

    if (stretchMainComponent()) {
      panel1.add(getMainComponent(), BorderLayout.CENTER);
    } else {
      JPanel wrapper = new JPanel(new BorderLayout());
      wrapper.add(new JPanel(), BorderLayout.CENTER);
      wrapper.add(getMainComponent(), BorderLayout.NORTH);
      panel1.add(wrapper, BorderLayout.CENTER);
    }

    JPanel buttonsPanel = new JPanel(new BorderLayout());
    buttonsPanel.setBorder(BorderFactory.createEmptyBorder(4, 0, 0, 0));
    JButton[] buttons = createButtons();
    JPanel innerButtonsPanel = new JPanel(new GridLayout(1, buttons.length, 5, 30));
    for (JButton button : buttons) {
      innerButtonsPanel.add(button);
    }
    buttonsPanel.add(myErrorLabel, BorderLayout.NORTH);
    buttonsPanel.add(innerButtonsPanel, getButtonsPosition());
    panel1.add(buttonsPanel, BorderLayout.SOUTH);

    add(panel1, BorderLayout.CENTER);

    ((JComponent) getContentPane()).registerKeyboardAction(new AbstractAction("Dispose dialog") {
      public void actionPerformed(ActionEvent e) {
        dispose();
      }
    }, KeyStroke.getKeyStroke("ESCAPE"), getDisposeOnEscapeCondition());

    setDefaultCloseOperation(DISPOSE_ON_CLOSE);

    myPrepared = true;
  }

  protected int getDisposeOnEscapeCondition() {
    return JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT;
  }

  protected String getButtonsPosition() {
    return BorderLayout.EAST;
  }

  public void setErrorText(String errorText) {
    //todo we can't guarantee that this method is called from Dispatch Thread
    if (errorText != null) {
      StringTokenizer tokenizer = new StringTokenizer(errorText, "\n");
      errorText = "";
      while (errorText.length() == 0 && tokenizer.hasMoreTokens()) {
        errorText = tokenizer.nextToken();
      }
      if (tokenizer.hasMoreTokens()) {
        errorText += "...";
      }
    }
    myErrorLabel.setText(errorText);
  }

  protected JButton[] createButtons() {
    Map<Integer, Method> buttonMethods = getButtonMethods();

    List<JButton> result = new ArrayList<JButton>();
    for (int i = 0; i < buttonMethods.keySet().size(); i++) {
      if (!buttonMethods.containsKey(i))
        throw new RuntimeException("BaseDialog doesn't contain button with index " + i);
      final Button b = buttonMethods.get(i).getAnnotation(Button.class);
      final Method m = buttonMethods.get(i);

      int mnemonic = -1;
      String name = b.name();

      if (b.mnemonic() != Button.VOID_MNEMONIC_CHAR) {
        mnemonic = b.mnemonic();
      } else if (b.name().contains("" + Button.VOID_MNEMONIC_CHAR)) {
        int index = b.name().indexOf(Button.VOID_MNEMONIC_CHAR);
        mnemonic = b.name().charAt(index + 1);
        name = name.replaceAll("_", "");
      }

      final int mnemonicFin = mnemonic;
      JButton button = new JButton(new AbstractAction(name) {
        {
          if (mnemonicFin != -1) {
            putValue(Action.MNEMONIC_KEY, new Integer(mnemonicFin));
          }
        }

        public void actionPerformed(ActionEvent e) {
          try {
            m.setAccessible(true);
            m.invoke(BaseDialog.this);
          } catch (IllegalAccessException e1) {
            LOG.error(e1);
          } catch (InvocationTargetException e1) {
            LOG.error(e1);
          }
        }
      });
      if (b.defaultButton()) {
        setDefaultButton(button);
      }
      result.add(button);
    }

    return result.toArray(new JButton[result.size()]);
  }

  private Map<Integer, Method> getButtonMethods() {
    Map<Integer, Method> buttonMethods = new HashMap<Integer, Method>();
    for (Method m : getClass().getMethods()) {
      if (m.isAnnotationPresent(Button.class) && !Modifier.isStatic(m.getModifiers())) {
        Button b = m.getAnnotation(Button.class);
        if (buttonMethods.containsKey(b.position())) {
          throw new RuntimeException("BaseDialog has buttons with the same position");
        }
        if (m.getReturnType() != Void.TYPE || m.getParameterTypes().length != 0) {
          throw new RuntimeException("Button methods should return void type and have no parameters");
        }
        buttonMethods.put(b.position(), m);
      }
    }
    return buttonMethods;
  }

  protected abstract JComponent getMainComponent();

  @Target(ElementType.METHOD)
  @Retention(RetentionPolicy.RUNTIME)
  public @interface Button {
    char VOID_MNEMONIC_CHAR = '_';

    int position();

    String name();

    char mnemonic() default VOID_MNEMONIC_CHAR;

    @Deprecated String shortcut() default "";

    boolean defaultButton() default false;
  }

  private class ErrorLabel extends JLabel {
    public ErrorLabel() {
      super("");
      setForeground(Color.RED);
      setFont(getFont().deriveFont(Font.BOLD));
      setBorder(null);
    }
  }

  private class MyDisposable implements Disposable {
    public void dispose() {

    }

    public String toString() {
      return "Containing class: "+BaseDialog.this.getClass().getName();
    }
  }
}
