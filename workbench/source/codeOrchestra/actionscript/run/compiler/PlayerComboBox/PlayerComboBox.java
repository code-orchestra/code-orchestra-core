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
package codeOrchestra.actionscript.run.compiler.PlayerComboBox;

import codeOrchestra.actionscript.modulemaker.view.FlexSDKPlayerVersionAnalyzer;
import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings;
import com.intellij.backport12.util.ui.EmptyIcon;
import com.intellij.openapi.ui.ComboBoxWithWidePopup;
import com.intellij.ui.ScreenUtil;
import com.intellij.backport12.ui.SimpleTextAttributes;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;
import java.awt.Dimension;
import java.awt.Rectangle;
import java.util.Collections;
import java.util.List;

/**
 * @author olegchir
 */
public class PlayerComboBox extends ComboBoxWithWidePopup {
  private static final Icon EMPTY_ICON = EmptyIcon.create(1, 16);

  public PlayerComboBox() {
    super(new PlayerComboBoxModel());
    setRenderer(new PlayerListRenderer() {
      @Override
      public void doCustomize(JList list, Object value, int index, boolean selected, boolean hasFocus) {
        if (PlayerComboBox.this.isEnabled()) {
          setIcon(EMPTY_ICON);    // to fix vertical size
          if (value instanceof InvalidPlayerComboBoxItem) {
            final String str = value.toString();
            append(str, SimpleTextAttributes.ERROR_ATTRIBUTES);
          }
          else {
            super.doCustomize(list, value != null ? ((PlayerComboBoxItem)value).getPlayer()
              : new NonePlayerComboBoxItem(), index, selected, hasFocus);
          }
        }
      }
    });
  }

  public void selectPlayer(String player) {
    if (null==player) {
      return;
    }

    int idx = indexOf(player);
    if (-1!=idx) {
      setSelectedItem(getItemAt(idx));
      return;
    }

    List<String> players = FlexSDKPlayerVersionAnalyzer.getAvailablePlayerVersions(FlexSDKSettings.getInstance().getFlexSDKPath());
    PlayerComboBoxItem item = null;
    if (players.contains(player)){
      item = new PlayerComboBoxItem(player);
    } else {
      item = new InvalidPlayerComboBoxItem(player);
    }

    addItem(item);
    setSelectedItem(item);
  }

  @Override
  public Dimension getPreferredSize() {
    final Rectangle rec = ScreenUtil.getScreenRectangle(0, 0);
    final Dimension size = super.getPreferredSize();
    final int maxWidth = rec.width / 4;
    if (size.width > maxWidth) {
      size.width = maxWidth;
    }
    return size;
  }

  @Override
  public Dimension getMinimumSize() {
    final Dimension minSize = super.getMinimumSize();
    final Dimension prefSize = getPreferredSize();
    if (minSize.width > prefSize.width) {
      minSize.width = prefSize.width;
    }
    return minSize;
  }

  @Nullable
  public String getSelectedPlayer() {
    final PlayerComboBoxItem selectedItem = (PlayerComboBoxItem)super.getSelectedItem();
    return selectedItem.getPlayer();
  }

  public void setSelectedPlayer(String player) {
    final int index = indexOf(player);
    if (index >= 0) {
      setSelectedIndex(index);
    }
  }

  public void setInvalidPlayer(String name) {
    removeInvalidElement();
    addItem(new InvalidPlayerComboBoxItem(name));
    setSelectedIndex(getModel().getSize() - 1);
  }

  private int indexOf(String player) {
    final PlayerComboBoxModel model = (PlayerComboBoxModel)getModel();
    final int count = model.getSize();
    for (int idx = 0; idx < count; idx++) {
      final PlayerComboBoxItem elementAt = model.getElementAt(idx);
      if (player == null) {
        if (elementAt instanceof NonePlayerComboBoxItem) {
          return idx;
        }
      }
      else {
        String elementAtPlayer = elementAt.getPlayer();
        if (elementAtPlayer != null && player.equals(elementAtPlayer)) {
          return idx;
        }
      }
    }
    return -1;
  }

  private void removeInvalidElement() {
    final PlayerComboBoxModel model = (PlayerComboBoxModel)getModel();
    final int count = model.getSize();
    for (int idx = 0; idx < count; idx++) {
      final PlayerComboBoxItem elementAt = model.getElementAt(idx);
      if (elementAt instanceof InvalidPlayerComboBoxItem) {
        removeItemAt(idx);
        break;
      }
    }
  }

  public static class NonePlayerComboBoxItem extends PlayerComboBoxItem {
    public NonePlayerComboBoxItem() {
      super(null);
    }

    public String toString() {
      return "<None>";
    }
  }

  private static class InvalidPlayerComboBoxItem extends PlayerComboBoxItem {
    private final String myPlayerName;

    public InvalidPlayerComboBoxItem(String name) {
      super(null);
      myPlayerName = name;
    }

    @Override
    public String getPlayer() {
      return myPlayerName;
    }

    public String toString() {
      return myPlayerName+" [invalid]";
    }
  }


  @Override
  public PlayerComboBoxItem getSelectedItem() {
    return (PlayerComboBoxItem)super.getSelectedItem();
  }

  public static class PlayerComboBoxItem {
    private final String myPlayer;

    public PlayerComboBoxItem(@Nullable String player) {
      myPlayer = player;
    }

    public String getPlayer() {
      return myPlayer;
    }


    public String toString() {
      return myPlayer;
    }
  }


  private static class PlayerComboBoxModel extends DefaultComboBoxModel {
    public PlayerComboBoxModel() {
      List<String> players = FlexSDKPlayerVersionAnalyzer.getAvailablePlayerVersions(FlexSDKSettings.getInstance().getFlexSDKPath());
      Collections.sort(players);
      for (String player : players) {
        addElement(new PlayerComboBoxItem(player));
      }
    }

    // implements javax.swing.ListModel
    @Override
    public PlayerComboBoxItem getElementAt(int index) {
      return (PlayerComboBoxItem)super.getElementAt(index);
    }

    public void updateContents() {
      fireContentsChanged(this, -1, -1);
    }
  }
}
