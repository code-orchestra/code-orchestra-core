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
package jetbrains.mps.ide.editorTabs.tabfactory;

import com.intellij.openapi.application.ApplicationManager;
import jetbrains.mps.ide.editorTabs.EditorTabDescriptor;
import jetbrains.mps.ide.editorTabs.tabfactory.emptytabs.EmptyTabsComponent;
import jetbrains.mps.ide.editorTabs.tabfactory.tabs.CreateModeCallback;
import jetbrains.mps.ide.editorTabs.tabfactory.tabs.buttontabs.ButtonTabsComponent;
import jetbrains.mps.ide.editorTabs.tabfactory.tabs.plaintabs.PlainTabsComponent;
import jetbrains.mps.nodeEditor.EditorSettings;
import jetbrains.mps.nodeEditor.EditorSettings.MyState;
import jetbrains.mps.smodel.SNodePointer;

import javax.swing.JComponent;
import java.util.Set;

public abstract class TabComponentFactory {
  public static TabsComponent createTabsComponent(final SNodePointer baseNode, final Set<EditorTabDescriptor> possibleTabs, JComponent component, NodeChangeCallback callback, CreateModeCallback createModeCallback) {
    MyState state = ApplicationManager.getApplication().getComponent(EditorSettings.class).getState();
    if (!state.isShow()) {
      return new EmptyTabsComponent(baseNode);
    } else {
      if (state.isShowPlain()) {
        return new PlainTabsComponent(baseNode, possibleTabs, component, callback, state.isShowGrayed(), createModeCallback);
      } else {
        return new ButtonTabsComponent(baseNode, possibleTabs, component, callback, state.isShowGrayed());
      }
    }
  }
}
