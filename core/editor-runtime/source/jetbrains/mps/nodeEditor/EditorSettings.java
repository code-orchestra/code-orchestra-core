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

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.options.ConfigurationException;
import com.intellij.openapi.options.SearchableConfigurable;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.EditorSettings.MyState;
import jetbrains.mps.nodeEditor.cells.EditorCell_Constant;
import jetbrains.mps.nodeEditor.cells.ParentSettings;
import jetbrains.mps.nodeEditor.cells.TextLine;
import jetbrains.mps.util.IntegerValueDocumentFilter;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.Nls;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;
import javax.swing.text.AbstractDocument;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;
import java.util.List;

@State(
  name = "EditorSettings",
  storages = {
    @Storage(
      id = "other",
      file = "$APP_CONFIG$/mpsEditor.xml"
    )}
)

public class EditorSettings implements SearchableConfigurable, PersistentStateComponent<MyState> {
  private static final Logger LOG = Logger.getLogger(EditorSettings.class);

  public static EditorSettings getInstance() {
    return ApplicationManager.getApplication().getComponent(EditorSettings.class);
  }

  private List<EditorSettingsListener> myListeners = new ArrayList<EditorSettingsListener>();

  private MyState myState = new MyState();
  private Font myDefaultEditorFont;
  private int mySpaceWidth = -1;

  private EditorSettingsPreferencesPage myPreferencesPage;

  CaretBlinker getCaretBlinker() {
    return myCaretBlinker;
  }

  private CaretBlinker myCaretBlinker;

  public EditorSettings(CaretBlinker caretBlinker) {
    myCaretBlinker = caretBlinker;

    updateCachedValue();
  }

  public double getLineSpacing() {
    return myState.myLineSpacing;
  }

  public Font getDefaultEditorFont() {
    return myDefaultEditorFont;
  }

  public int getFontSize() {
    return myState.myFontSize;
  }

  public String getFontFamily() {
    return myState.myFontFamily;
  }

  public void setDefaultEditorFont(Font newFont) {
    myState.myFontFamily = newFont.getFamily();
    myState.myFontSize = newFont.getSize();
  }

  public boolean useBraces() {
    return myState.myUseBraces;
  }

  public void setUseBraces(boolean newUseBraces) {
    myState.myUseBraces = newUseBraces;
  }

  public boolean doModuleAutoImport() {
    return myState.moduleAutoImport;
  }

  public void setModuleAutoImport(boolean moduleAutoImport) {
    myState.moduleAutoImport = moduleAutoImport;
  }

  public boolean isAutoScrollEnabled() {
    return myState.autoScroll;
  }

  public void setAutoScroll(boolean autoScroll) {
    this.myState.autoScroll = autoScroll;
  }

  public boolean allowSideSelect() {
    return myState.allowSideSelect;
  }

  public void setAllowSideSelect(boolean allowSideSelect) {
    myState.allowSideSelect = allowSideSelect;
  }

  public boolean letterByLetterUndo() {
    return myState.letterByLetterUndo;
  }

  public void setLetterByLetterUndo(boolean letterByLetterUndo) {
    myState.letterByLetterUndo = letterByLetterUndo;
  }

  public int getIndentSize() {
    return myState.myIndentSize;
  }

  public void setIndentSize(int indentSize) {
    myState.myIndentSize = indentSize;
  }

  public int getVerticalBound() {
    return myState.myVerticalBound;
  }

  public void setVerticalBound(int verticalBound) {
    myState.myVerticalBound = verticalBound;
  }

  public int getVerticalBoundWidth() {
    return getSpacesWidth(getVerticalBound());
  }

  public boolean isUseAntialiasing() {
    return myState.myUseAntialiasing;
  }

  public void setUseAntialiasing(boolean useAntialiasing) {
    myState.myUseAntialiasing = useAntialiasing;
  }

  public boolean isPowerSaveMode() {
    return myState.myPowerSaveMode;
  }

  public void setPowerSaveMode(boolean powerSaveMode) {
    myState.myPowerSaveMode = powerSaveMode;
  }

  public boolean isHighightChanges() {
    return myState.myHighlightChanges;
  }

  public void setHighlightChanges(boolean highlightChanges) {
    myState.myHighlightChanges = highlightChanges;
  }

  public Color getSelectionBackgroundColor() {
    return myState.mySelectionBackground;
  }

  public Color getSelectionForegroundColor() {
    return myState.mySelectionForeground;
  }

  static Color getDefaultSelectionBackgroundColor() {
    return new Color(82, 109, 165);
  }

  static Color getDefaultSelectionForegroundColor() {
    return Color.WHITE;
  }

  public Color getRangeSelectionForegroundColor() {
    return getSelectionBackgroundColor();
  }

  public int getSpacesWidth(int size) {
    if (mySpaceWidth == -1) {
      TextLine textLine = new TextLine(" ");
      textLine.relayout();
      mySpaceWidth = textLine.getWidth();
    }

    return mySpaceWidth * size;
  }

  public void addEditorSettingsListener(EditorSettingsListener l) {
    myListeners.add(l);
  }

  public void removeEditorSettingsListener(EditorSettingsListener l) {
    myListeners.remove(l);
  }

  void fireEditorSettingsChanged() {
    for (EditorSettingsListener l : new ArrayList<EditorSettingsListener>(myListeners)) {
      try {
        l.settingsChanged();
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private EditorSettingsPreferencesPage getPreferencesPage() {
    if (myPreferencesPage == null) {
      myPreferencesPage = new EditorSettingsPreferencesPage(this);
    }
    return myPreferencesPage;
  }

  public String getId() {
    return "mps.editor.settings";
  }

  public Runnable enableSearch(String option) {
    return null;
  }

  @Nls
  public String getDisplayName() {
    return "Editor";
  }

  @Nullable
  public Icon getIcon() {
    return getPreferencesPage().getIcon();
  }

  @Nullable
  @NonNls
  public String getHelpTopic() {
    return "preferences.editor";
  }

  public JComponent createComponent() {
    return getPreferencesPage().getComponent();
  }

  public boolean isModified() {
    return getPreferencesPage().isModified();
  }

  public void apply() throws ConfigurationException {
    getPreferencesPage().commit();
  }

  public void reset() {
    getPreferencesPage().reset();
  }

  public void disposeUIResources() {

  }

  public MyState getState() {
    return myState;
  }

  public void loadState(MyState state) {
    myState = state;
    updateCachedValue();
  }

  void updateCachedValue() {
    myDefaultEditorFont = new Font(myState.myFontFamily, 0, myState.myFontSize);
    mySpaceWidth = -1;
  }

  public static class MyState {
    @CodeOrchestraPatch
    private String myFontFamily = DefaultEditorSettingsHelper.getDefaultFontFamily();
    @CodeOrchestraPatch
    private int myFontSize = DefaultEditorSettingsHelper.getDefaultFontSize();

    private double myLineSpacing = 1.0;

    private int myTextWidth = 500;
    private boolean myUseAntialiasing = true;

    private Color mySelectionForeground = getDefaultSelectionForegroundColor();
    private Color mySelectionBackground = getDefaultSelectionBackgroundColor();

    private boolean myUseBraces = true;

    @CodeOrchestraPatch
    private boolean letterByLetterUndo = true;
    @CodeOrchestraPatch
    private boolean allowSideSelect = false;
    @CodeOrchestraPatch
    private boolean moduleAutoImport = true;
    @CodeOrchestraPatch
    private boolean autoScroll = false;

    private int myIndentSize = 2;
    private int myVerticalBound = 120;

    private boolean myPowerSaveMode = false;
    private boolean myHighlightChanges = false;

    private boolean showPlain = true;
    private boolean showGrayed = true;
    private boolean show = true;

    @Override
    @CodeOrchestraPatch
    public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      MyState otherState = (MyState) o;

      if (myFontSize != otherState.myFontSize) return false;
      if (Double.compare(otherState.myLineSpacing, myLineSpacing) != 0) return false;
      if (myTextWidth != otherState.myTextWidth) return false;
      if (myUseAntialiasing != otherState.myUseAntialiasing) return false;
      if (myUseBraces != otherState.myUseBraces) return false;
      if (myFontFamily != null ? !myFontFamily.equals(otherState.myFontFamily) : otherState.myFontFamily != null)
        return false;
      if (mySelectionBackground != null ? !mySelectionBackground.equals(otherState.mySelectionBackground) : otherState.mySelectionBackground != null)
        return false;
      if (mySelectionForeground != null ? !mySelectionForeground.equals(otherState.mySelectionForeground) : otherState.mySelectionForeground != null)
        return false;

      if (myIndentSize != otherState.myIndentSize) {
        return false;
      }

      if (myVerticalBound != otherState.myVerticalBound) {
        return false;
      }

      if (myPowerSaveMode != otherState.myPowerSaveMode) {
        return false;
      }

      if (myHighlightChanges != otherState.myHighlightChanges) {
        return false;
      }

      if (letterByLetterUndo != otherState.letterByLetterUndo) {
        return false;
      }

      if (allowSideSelect != otherState.allowSideSelect) {
        return false;
      }

      if (autoScroll != otherState.autoScroll) {
        return false;
      }

      // RE-3701
      if (moduleAutoImport != otherState.moduleAutoImport) {
        return false;
      }

      return true;
    }

    @Override
    @CodeOrchestraPatch
    public int hashCode() {
      int result;
      long temp;
      result = myFontFamily != null ? myFontFamily.hashCode() : 0;
      result = 31 * result + myFontSize;
      temp = myLineSpacing != +0.0d ? Double.doubleToLongBits(myLineSpacing) : 0L;
      result = 31 * result + (int) (temp ^ (temp >>> 32));
      result = 31 * result + myTextWidth;
      result = 31 * result + myIndentSize;
      result = 31 * result + myVerticalBound;
      result = 31 * result + (myPowerSaveMode ? 1 : 0);
      result = 31 * result + (myHighlightChanges ? 1 : 0);
      result = 31 * result + (myUseAntialiasing ? 1 : 0);
      result = 31 * result + (mySelectionForeground != null ? mySelectionForeground.hashCode() : 0);
      result = 31 * result + (mySelectionBackground != null ? mySelectionBackground.hashCode() : 0);
      result = 31 * result + (myUseBraces ? 1 : 0);
      result = 31 * result + (letterByLetterUndo ? 1 : 0);
      result = 31 * result + (allowSideSelect ? 1 : 0);
      result = 31 * result + (autoScroll ? 1 : 0);
      result = 31 * result + (moduleAutoImport ? 1 : 0); // RE-3701
      return result;
    }

    public String getFontFamily() {
      return myFontFamily;
    }

    public void setFontFamily(String fontFamily) {
      myFontFamily = fontFamily;
    }

    public int getFontSize() {
      return myFontSize;
    }

    public void setFontSize(int fontSize) {
      myFontSize = fontSize;
    }

    public int getTextWidth() {
      return myTextWidth;
    }

    public void setTextWidth(int textWidth) {
      myTextWidth = textWidth;
    }

    public int getVerticalBound() {
      return myVerticalBound;
    }

    public void setVerticalBound(int verticalBound) {
      myVerticalBound = verticalBound;
    }

    public int getIndentSize() {
      return myIndentSize;
    }

    public void setIndentSize(int indentSize) {
      myIndentSize = indentSize;
    }

    public boolean isUseAntialiasing() {
      return myUseAntialiasing;
    }

    public void setUseAntialiasing(boolean useAntialiasing) {
      myUseAntialiasing = useAntialiasing;
    }

    public int getSelectionForeground() {
      return mySelectionForeground.getRGB();
    }

    public void setSelectionForeground(int rgb) {
      mySelectionForeground = new Color(rgb);
    }

    public int getSelectionBackground() {
      return mySelectionBackground.getRGB();
    }

    public void setSelectionBackground(int rgb) {
      mySelectionBackground = new Color(rgb);
    }

    public boolean isUseBraces() {
      return myUseBraces;
    }

    public void setUseBraces(boolean useBraces) {
      myUseBraces = useBraces;
    }

    public boolean isLetterByLetterUndo() {
      return letterByLetterUndo;
    }

    public void setLetterByLetterUndo(boolean letterByLetterUndo) {
      this.letterByLetterUndo = letterByLetterUndo;
    }

    public boolean isModuleAutoImport() {
      return moduleAutoImport;
    }

    public void setModuleAutoImport(boolean moduleAutoImport) {
      this.moduleAutoImport = moduleAutoImport;
    }

    public boolean isAutoScroll() {
      return autoScroll;
    }

    public void setAutoScroll(boolean autoScroll) {
      this.autoScroll = autoScroll;
    }

    public boolean isAllowSideSelect() {
      return allowSideSelect;
    }

    public void setAllowSideSelect(boolean allowSideSelect) {
      this.allowSideSelect = allowSideSelect;
    }

    public double getLineSpacing() {
      return myLineSpacing;
    }

    public void setLineSpacing(double lineSpacing) {
      myLineSpacing = lineSpacing;
    }

    public boolean isPowerSaveMode() {
      return myPowerSaveMode;
    }

    public void setPowerSaveMode(boolean powerSaveMode) {
      myPowerSaveMode = powerSaveMode;
    }

    public boolean isHighlightChanges() {
      return myHighlightChanges;
    }

    public void setHighlightChanges(boolean highlightChanges) {
      myHighlightChanges = highlightChanges;
    }

    //setters are for persistence
    public void setShowPlain(boolean showPlain) {
      this.showPlain = showPlain;
    }

    //setters are for persistence
    public void setShowGrayed(boolean showGrayed) {
      this.showGrayed = showGrayed;
    }

    //setters are for persistence
    public void setShow(boolean show) {
      this.show = show;
    }

    public boolean isShowPlain() {
      return showPlain;
    }

    public boolean isShowGrayed() {
      return showGrayed;
    }

    public boolean isShow() {
      return show;
    }
  }
}
