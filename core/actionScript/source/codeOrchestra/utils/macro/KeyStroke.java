package codeOrchestra.utils.macro;

import org.jetbrains.annotations.NotNull;

import java.awt.event.KeyEvent;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class KeyStroke {

  public static final int UNKNOWN_POSITION = -1;

  private List<KeyCodeWrapper> keyCodes;
  private List<String> socketSentCommands;

  public KeyStroke(List<KeyCodeWrapper> keyCodes, @NotNull List<String> socketSentCommands) {
    this.keyCodes = keyCodes;
    this.socketSentCommands = socketSentCommands;
  }

  public List<String> getSocketSentCommands() {
    return socketSentCommands;
  }

  public boolean isModified() {
    if (keyCodes.size() > 1) {
      for (KeyCodeWrapper keyCodeWrapper : keyCodes) {
        int keyCode = keyCodeWrapper.getKeyCode();
        if (keyCode == KeyEvent.VK_ALT || keyCode == KeyEvent.VK_CONTROL || keyCode == KeyEvent.VK_SHIFT || keyCode == KeyEvent.VK_META) {
          return true;
        }
      }
    }
    return false;
  }

  public long getTimestamp() {
    return keyCodes.get(0).getTimestamp() ;
  }

  public List<KeyCodeWrapper> getKeyCodes() {
    if (keyCodes.size() == 1) {
      KeyCodeWrapper onlyKeyWrapper = keyCodes.get(0);

      List<KeyCodeWrapper> result = new ArrayList<KeyCodeWrapper>();

      if (onlyKeyWrapper.isShiftDown()) {
        result.add(KeyCodeWrapper.SHIFT);
      }
      if (onlyKeyWrapper.isControlDown()) {
        result.add(KeyCodeWrapper.CONTROL);
      }
      if (onlyKeyWrapper.isAltDown()) {
        result.add(KeyCodeWrapper.ALT);
      }
      if (onlyKeyWrapper.isMetaDown()) {
        result.add(KeyCodeWrapper.META);
      }

      result.add(onlyKeyWrapper);
      return result;
    }

    return keyCodes;
  }

  public String getPresentation() {
    StringBuilder result = new StringBuilder();

    Iterator<KeyCodeWrapper> keyCodeIterator = keyCodes.iterator();
    while (keyCodeIterator.hasNext()) {
      result.append(keyCodeIterator.next().getPresentation());
      if (keyCodeIterator.hasNext()) {
        result.append(" ");
      }
    }

    return result.toString();
  }

  public boolean hasCursorData() {
    return getLastKeyCodeWrapperWithCursorData() != null;
  }

  public int getCursorX() {
    assert hasCursorData();
    return getLastKeyCodeWrapperWithCursorData().getCursorX();
  }

  public int getCursorY() {
    assert hasCursorData();
    return getLastKeyCodeWrapperWithCursorData().getCursorY();
  }

  private KeyCodeWrapper getLastKeyCodeWrapperWithCursorData() {
    for (int i = keyCodes.size() - 1; i >= 0; i--) {
      KeyCodeWrapper keyCodeWrapper = keyCodes.get(i);
      if (keyCodeWrapper.hasCursorPosition()) {
        return keyCodeWrapper;
      }
    }
    return null;
  }

  public boolean canBeSplit() {
    return !isModified();
  }

  public List<KeyStroke> split() {
    assert canBeSplit();

    List<KeyStroke> splitList = new ArrayList<KeyStroke>();

    Iterator<KeyCodeWrapper> keyCodeIterator = keyCodes.iterator();
    while (keyCodeIterator.hasNext()) {
      KeyCodeWrapper keyCode = keyCodeIterator.next();

      // add socket sent commands to the last keystroke
      if (keyCodeIterator.hasNext()) {
        splitList.add(new KeyStroke(Collections.singletonList(keyCode), Collections.EMPTY_LIST));
      } else {
        splitList.add(new KeyStroke(Collections.singletonList(keyCode), socketSentCommands));
      }
    }


    return splitList;
  }
}
