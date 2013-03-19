package codeOrchestra.utils.macro;

import codeOrchestra.utils.macro.util.CursorUtil;
import codeOrchestra.utils.macro.util.KeyCodeUtil;
import com.intellij.openapi.util.SystemInfo;

import java.awt.Point;
import java.awt.event.KeyEvent;

/**
 * @author Alexander Eliseyev
 */
public class KeyCodeWrapper {

  public static KeyCodeWrapper SHIFT = new KeyCodeWrapper(KeyEvent.VK_SHIFT);
  public static KeyCodeWrapper CONTROL = new KeyCodeWrapper(KeyEvent.VK_CONTROL);
  public static KeyCodeWrapper ALT = new KeyCodeWrapper(KeyEvent.VK_ALT);
  public static KeyCodeWrapper META = new KeyCodeWrapper(KeyEvent.VK_META);

  private long timestamp;

  private boolean altDown;
  private boolean controlDown;
  private boolean shiftDown;
  private boolean metaDown;

  private int keyCode;

  private int cursorX;
  private int cursorY;

  public KeyCodeWrapper(KeyEvent keyEvent) {
    this(keyEvent.getKeyCode(), keyEvent.getWhen(), keyEvent.isAltDown(), keyEvent.isControlDown(), keyEvent.isShiftDown(), keyEvent.isMetaDown());
  }

  private KeyCodeWrapper(int keyCode) {
    this(keyCode, 0l, false, false, false, false);
  }

  public KeyCodeWrapper(int keyCode, long timestamp, boolean altDown, boolean controlDown, boolean shiftDown, boolean metaDown) {
    this.keyCode = keyCode;
    this.timestamp = timestamp;
    this.altDown = altDown;
    this.controlDown = controlDown;
    this.shiftDown = shiftDown;
    this.metaDown = metaDown;
  }

  public boolean isGoByReferenceKeyStroke() {
    return keyCode == KeyEvent.VK_B && ((SystemInfo.isMac && metaDown) || (SystemInfo.isWindows && controlDown));
  }

  public boolean hasCursorPosition() {
    return cursorX > 0 && cursorY > 0;
  }

  public int getCursorX() {
    return cursorX;
  }

  public int getCursorY() {
    return cursorY;
  }

  public long getTimestamp() {
    return timestamp;
  }

  public boolean isAltDown() {
    return altDown;
  }

  public boolean isControlDown() {
    return controlDown;
  }

  public boolean isShiftDown() {
    return shiftDown;
  }

  public boolean isMetaDown() {
    return metaDown;
  }

  public String getPresentation() {
    StringBuilder sb = new StringBuilder();
    if (shiftDown) {
      sb.append(KeyCodeUtil.INSTANCE.getKeyCodeName(KeyEvent.VK_SHIFT)).append(" ");
    }
    if (controlDown) {
      sb.append(KeyCodeUtil.INSTANCE.getKeyCodeName(KeyEvent.VK_CONTROL)).append(" ");
    }
    if (altDown) {
      sb.append(KeyCodeUtil.INSTANCE.getKeyCodeName(KeyEvent.VK_ALT)).append(" ");
    }
    if (metaDown) {
      sb.append(KeyCodeUtil.INSTANCE.getKeyCodeName(KeyEvent.VK_META)).append(" ");
    }
    sb.append(KeyCodeUtil.INSTANCE.getKeyCodeName(keyCode));
    return sb.toString();
  }

  public int getKeyCode() {
    return keyCode;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    KeyCodeWrapper that = (KeyCodeWrapper) o;

    if (keyCode != that.keyCode) return false;

    return true;
  }

  @Override
  public int hashCode() {
    return keyCode;
  }

  public void finish(boolean async) {
    if (async) {
      new Thread(new Runnable() {
        @Override
        public void run() {
          try {
            Thread.sleep(200);
          } catch (InterruptedException e) {
            // ignore
          }

          refreshCursorPosition();
        }
      }).start();
    } else {
      refreshCursorPosition();
    }
  }

  public void refreshCursorPosition() {
    if (hasCursorPosition()) {
      return;
    }

    Point cursorPosition = CursorUtil.getCursorPosition();
    if (cursorPosition != null) {
      cursorX = (int) cursorPosition.getX();
      cursorY = (int) cursorPosition.getY();
    }
  }

}