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

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings.MyState;

import java.awt.Dimension;
import java.awt.DisplayMode;
import java.awt.GraphicsDevice;
import java.awt.GraphicsEnvironment;
import java.util.HashMap;


@State(
  name = "DialogDimensionsSettings",
  storages = {
    @Storage(
      id = "other",
      file = "$APP_CONFIG$/mpsDialogDimensionSettings.xml"
    )}
)
@Deprecated
public class DialogDimensionsSettings implements PersistentStateComponent<MyState> {
  public static DialogDimensionsSettings getInstance() {
    return ApplicationManager.getApplication().getComponent(DialogDimensionsSettings.class);
  }

  private MyState myState = new MyState();

  protected DialogDimensions getDimensionSettings(Class<? extends BaseDialog> cls) {
    return myState.myDialogsDimensions.get(cls.getName());
  }

  protected void saveDimensionSettings(int left, int top, int width, int height, Class<? extends BaseDialog> cls) {
    DialogDimensions dialogDimensions = new DialogDimensions(left, top, width, height);
    myState.myDialogsDimensions.put(cls.getName(), dialogDimensions);
  }

  public MyState getState() {
    return myState;
  }

  public void loadState(MyState state) {
    myState = state;
  }

  public static DialogDimensions generateDialogDimensions(int width, int height) {
    int screenWidth = 800;
    int screenHeight = 600;
    GraphicsEnvironment graphicsEnvironment = GraphicsEnvironment.getLocalGraphicsEnvironment();
    if (graphicsEnvironment != null) {
      GraphicsDevice defaultScreenDevice = graphicsEnvironment.getDefaultScreenDevice();
      if (defaultScreenDevice != null) {
        DisplayMode displayMode = defaultScreenDevice.getDisplayMode();
        if (displayMode != null) {
          screenWidth = displayMode.getWidth();
          screenHeight = displayMode.getHeight();
        }
      }
    }
    if (width <= 0 && height <= 0) {
      width = screenWidth + width;
      height = screenHeight + height;
    }
    return new DialogDimensions((screenWidth - width) / 2, (screenHeight - height) / 2, width, height);
  }

  public static class DialogDimensions {
    private int myTop;
    private int myLeft;
    private int myWidth;
    private int myHeight;

    public DialogDimensions() {
    }

    public DialogDimensions(int left, int top, int width, int height) {
      myHeight = height;
      myWidth = width;
      myLeft = left;
      myTop = top;
    }

    public Dimension getDimensions() {
      return new Dimension(myWidth, myHeight);
    }

    public int getTop() {
      return myTop;
    }

    public void setTop(int top) {
      myTop = top;
    }

    public int getLeft() {
      return myLeft;
    }

    public void setLeft(int left) {
      myLeft = left;
    }

    public int getWidth() {
      return myWidth;
    }

    public void setWidth(int width) {
      myWidth = width;
    }

    public int getHeight() {
      return myHeight;
    }

    public void setHeight(int height) {
      myHeight = height;
    }
  }

  public static class MyState {
    private HashMap<String, DialogDimensions> myDialogsDimensions = new HashMap<String, DialogDimensions>();

    public HashMap<String, DialogDimensions> getDialogsDimensions() {
      return myDialogsDimensions;
    }

    public void setDialogsDimensions(HashMap<String, DialogDimensions> dialogsDimensions) {
      myDialogsDimensions = dialogsDimensions;
    }
  }
}
