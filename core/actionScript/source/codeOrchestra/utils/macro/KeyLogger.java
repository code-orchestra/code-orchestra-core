package codeOrchestra.utils.macro;

import codeOrchestra.utils.macro.util.CursorUtil;
import codeOrchestra.utils.macro.util.KeyCodeUtil;

import java.awt.KeyEventDispatcher;
import java.awt.Point;
import java.awt.event.KeyEvent;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class KeyLogger implements KeyEventDispatcher {

  private static KeyLogger INSTANCE;

  private int lastSourceHash = 0;

  private Point initialCaretPosition;
  private boolean forceFinishOldSourceKeystroke;

  public static synchronized KeyLogger getInstance() {
    if (INSTANCE == null) {
      INSTANCE = new KeyLogger();
    }
    return INSTANCE;
  }

  private boolean enabled;

  private List<KeyCodeWrapper> keyCodesStack = new ArrayList<KeyCodeWrapper>();
  private List<KeyCodeWrapper> currentKeyStroke = new ArrayList<KeyCodeWrapper>();
  private List<String> currentSocketSentCommands = Collections.synchronizedList(new ArrayList<String>());

  private List<KeyLoggerListener> keyLoggerListeners = new ArrayList<KeyLoggerListener>();
  private Object keyLoggerListenersMonitor = new Object();

  private KeyLogger() {
  }

  public Point getInitialCaretPosition() {
    return initialCaretPosition;
  }

  public void addKeyLoggerListener(KeyLoggerListener keyLoggerListener) {
    synchronized (keyLoggerListenersMonitor) {
      this.keyLoggerListeners.add(keyLoggerListener);
    }
  }

  public void removeKeyLoggerListener(KeyLoggerListener keyLoggerListener) {
    synchronized (keyLoggerListenersMonitor) {
      this.keyLoggerListeners.remove(keyLoggerListener);
    }
  }

  public void broadcastNewKeystroke(KeyStroke keyStoke) {
    synchronized (keyLoggerListenersMonitor) {
      for (KeyLoggerListener keyLoggerListener : keyLoggerListeners) {
        keyLoggerListener.onNewKeyStroke(keyStoke);
      }
    }
  }

  public synchronized void toggle(boolean on) {
    this.enabled = on;
    if (!on) {
      reset();
    } else {
      initialCaretPosition = CursorUtil.getCursorPosition();
    }
  }

  private void reset() {
    resetCurrentKeyStroke();
    initialCaretPosition = null;
  }

  private void resetCurrentKeyStroke() {
    lastSourceHash = 0;
    forceFinishOldSourceKeystroke = false;
    keyCodesStack.clear();
    currentKeyStroke.clear();
    currentSocketSentCommands.clear();
  }

  @Override
  public synchronized boolean dispatchKeyEvent(KeyEvent keyEvent) {
    if (enabled) {
      int keyEventId = keyEvent.getID();
      switch (keyEventId) {
        case KeyEvent.KEY_PRESSED:
          push(keyEvent);
          break;
        case KeyEvent.KEY_RELEASED:
          pop(keyEvent);
          break;
        case KeyEvent.KEY_TYPED:
          break;
      }
    }
    return false;
  }

  private void push(KeyEvent keyEvent) {
    if (!enabled) {
      return;
    }

    refreshLastKeyCodeCursorPosition();

    if (KeyCodeUtil.isModifier(keyEvent)) {
      return;
    }

    boolean sourceHasChanged = sourceHasChanged(keyEvent);
    boolean hadToForceKeystrokeFinish = forceFinishOldSourceKeystroke;

    if (sourceHasChanged && forceFinishOldSourceKeystroke) {
      keyStrokeIsFinished();
    }

    KeyCodeWrapper keyCodeWrapper = new KeyCodeWrapper(keyEvent);
    keyCodesStack.add(keyCodeWrapper);
    currentKeyStroke.add(keyCodeWrapper);

    if (sourceHasChanged && !hadToForceKeystrokeFinish) {
      keyCodeWrapper.finish(true); // finish the last known stroke
      keyStrokeIsFinished();
      return;
    }

    lastSourceHash = keyEvent.getSource().hashCode();
  }

  private void refreshLastKeyCodeCursorPosition() {
    KeyCodeWrapper lastKeyCodeWrapper = currentKeyStroke.isEmpty() ? null : currentKeyStroke.get(currentKeyStroke.size() - 1);
    if (lastKeyCodeWrapper != null) {
      lastKeyCodeWrapper.refreshCursorPosition();
    }
  }

  private void pop(KeyEvent keyEvent) {
    if (!enabled) {
      return;
    }

    if (KeyCodeUtil.isModifier(keyEvent)) {
      return;
    }

    KeyCodeWrapper keyCodeWrapper = getKeyCodeWrapper(keyEvent);
    if (keyCodeWrapper == null) {
      return;
    }

    keyCodeWrapper.finish(false);

    if (keyCodesStack.remove(keyCodeWrapper) && keyCodesStack.isEmpty()) {
      keyStrokeIsFinished();
    }
  }

  private boolean sourceHasChanged(KeyEvent keyEvent) {
    return lastSourceHash != 0 && lastSourceHash != keyEvent.getSource().hashCode();
  }

  private KeyCodeWrapper getKeyCodeWrapper(KeyEvent keyEvent) {
    for (KeyCodeWrapper keyCodeWrapper : currentKeyStroke) {
      if (keyEvent.getKeyCode() == keyCodeWrapper.getKeyCode()) {
        return keyCodeWrapper;
      }
    }
    return null;
  }

  public void addSocketSentCommand(String socketSentCommand) {
    this.currentSocketSentCommands.add(socketSentCommand);
  }

  private void keyStrokeIsFinished() {
    KeyStroke keyStoke = new KeyStroke(new ArrayList<KeyCodeWrapper>(currentKeyStroke), new ArrayList<String>(currentSocketSentCommands));
    broadcastNewKeystroke(keyStoke);
    resetCurrentKeyStroke();
  }

  public boolean isEnabled() {
    return enabled;
  }

  public void setEnabled(boolean enabled) {
    this.enabled = enabled;
  }

  public void setForceFinishOldSourceKeystroke(boolean forceFinishOldSourceKeystroke) {
    this.forceFinishOldSourceKeystroke = forceFinishOldSourceKeystroke;
  }
}
