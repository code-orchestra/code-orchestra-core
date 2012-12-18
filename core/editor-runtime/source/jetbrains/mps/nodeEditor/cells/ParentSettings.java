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
package jetbrains.mps.nodeEditor.cells;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 30.11.10
 * Time: 14:58
 * To change this template use File | Settings | File Templates.
 */
public class ParentSettings {
  private boolean mySkipBackground = false;
  private boolean mySelectionPainted = false;

  public static ParentSettings createBackgroundlessSetting(boolean skipBackground) {
    ParentSettings result = new ParentSettings();
    result.mySkipBackground = skipBackground;
    return result;
  }

  public static ParentSettings createSelectedSetting(boolean isSelected) {
    ParentSettings result = new ParentSettings();
    result.mySelectionPainted = isSelected;
    return result;
  }

  public static ParentSettings createDefaultSetting() {
    return new ParentSettings();
  }

  public boolean isSkipBackground() {
    return mySkipBackground;
  }

  public boolean isSelectionPainted() {
    return mySelectionPainted;
  }

  public ParentSettings combineWith(ParentSettings otherSettings) {
    ParentSettings settings = new ParentSettings();
    settings.mySkipBackground = otherSettings.mySkipBackground || mySkipBackground;
    settings.mySelectionPainted = otherSettings.mySelectionPainted || mySelectionPainted;
    return settings;
  }
}
