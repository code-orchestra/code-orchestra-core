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
package jetbrains.mps.nodeEditor;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.util.WeakSet;
import jetbrains.mps.nodeEditor.CaretBlinker.MyState;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;


@State(
  name = "CaretBlinker",
  storages = {
    @Storage(
      id ="other",
      file = "$APP_CONFIG$/mpsEditor.xml"
    )}
)
public class CaretBlinker implements PersistentStateComponent<MyState> {
  private static final Logger LOG = Logger.getLogger(CaretBlinker.class);

  public static CaretBlinker getInstance() {
    return ApplicationManager.getApplication().getComponent(CaretBlinker.class);
  }

  public static final int MIN_BLINKING_PERIOD = 100; //millis
  public static final int MAX_BLINKING_PERIOD = 1000;
  public static final int DEFAULT_BLINKING_PERIOD = 500;

  private MyState myState = new MyState();
  private boolean myStarted = false;

  private final Object myRegistrationLock = new Object();

  private WeakSet<EditorComponent> myEditors = new WeakSet<EditorComponent>();


  public CaretBlinker() {
  }

  public void launch() {
    if (myStarted) return;
    Thread t = new Thread(new MyRunnable(), "caret blinker daemon");
    t.setDaemon(true);
    t.setPriority(3);
    t.start();
    myStarted = true;
  }

  public int getCaretBlinkingRateTimeMillis() {
    return myState.myCaretBlinkingRateMillis == -1 ? DEFAULT_BLINKING_PERIOD : myState.myCaretBlinkingRateMillis;
  }

  public void setCaretBlinkingRateTimeMillis(int timeMillis) {
    myState.myCaretBlinkingRateMillis = timeMillis;
  }
                                                                  
  public void registerEditor(EditorComponent editorComponent) {
    synchronized(myRegistrationLock) {
      myEditors.add(editorComponent);
    }
  }

  public void unregisterEditor(EditorComponent editorComponent) {
    synchronized(myRegistrationLock) {
      myEditors.remove(editorComponent);
    }
  }

  public MyState getState() {
    return myState;
  }

  public void loadState(MyState state) {
    myState = state;
  }

  private class MyRunnable implements Runnable {
    @SuppressWarnings({"InfiniteLoopStatement"})
    public void run() {
      while (true) {
        synchronized(myRegistrationLock) {
          for (EditorComponent editor : myEditors) {
            if (editor.hasFocus()) {
              EditorCell selectedCell = editor.getDeepestSelectedCell();
              if (selectedCell == null) continue;
              selectedCell.switchCaretVisible();
              editor.repaint(selectedCell.getX(), selectedCell.getY(), selectedCell.getWidth()+1, selectedCell.getHeight()+1);
              break;
            }
          }
        }
        try {
          synchronized(this) {
            wait(getCaretBlinkingRateTimeMillis());
          }
        } catch (Throwable t) {
          LOG.error(t);
        }
      }
    }
  }

  public static class MyState {
    private int myCaretBlinkingRateMillis = -1;

    public int getCaretBlinkingRateMillis() {
      return myCaretBlinkingRateMillis;
    }

    public void setCaretBlinkingRateMillis(int caretBlinkingRateMillis) {
      myCaretBlinkingRateMillis = caretBlinkingRateMillis;
    }
  }
}
