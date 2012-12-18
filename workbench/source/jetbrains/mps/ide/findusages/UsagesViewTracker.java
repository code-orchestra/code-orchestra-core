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
package jetbrains.mps.ide.findusages;

import com.intellij.openapi.actionSystem.ActionManager;
import com.intellij.openapi.actionSystem.AnAction;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.KeyboardShortcut;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.keymap.Keymap;
import com.intellij.openapi.keymap.KeymapManager;
import jetbrains.mps.ide.hierarchy.HierarchyViewTool;
import org.jetbrains.annotations.NotNull;

import javax.swing.KeyStroke;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class UsagesViewTracker implements ApplicationComponent {
  private static final String PREV_COMMAND = "FindUsages.Previous";
  private static final String NEXT_COMMAND = "FindUsages.Next";
  private static List<INavigateableTool> myTools = new ArrayList<INavigateableTool>();

  public static void register(INavigateableTool tool) {
    myTools.add(tool);
  }

  public static void unregister(INavigateableTool tool) {
    myTools.remove(tool);
  }

  private static KeyboardShortcut getNextShortcut() {
    return new KeyboardShortcut(KeyStroke.getKeyStroke("control alt DOWN"), null);
  }

  private static KeyboardShortcut getPrevShortcut() {
    return new KeyboardShortcut(KeyStroke.getKeyStroke("control alt UP"), null);
  }

  public static List<HierarchyViewTool> getHierarchyTools() {
    List<HierarchyViewTool> result = new ArrayList<HierarchyViewTool>();
    for (INavigateableTool tool : myTools) {
      if (tool instanceof HierarchyViewTool) {
        result.add((HierarchyViewTool) tool);
      }
    }
    return result;
  }

  public static INavigator getNavigator() {
    Collections.sort(myTools, new Comparator<INavigateableTool>() {
      public int compare(INavigateableTool t1, INavigateableTool t2) {
        boolean v1 = t1.getToolWindow().isVisible();
        boolean v2 = t2.getToolWindow().isVisible();

        if (v1 && !v2) return -1;
        if (!v1 && v2) return 1;

        boolean a1 = t1.getToolWindow().isAvailable();
        boolean a2 = t2.getToolWindow().isAvailable();

        if (a1 && !a2) return -1;
        if (!a1 && a2) return 1;

        return t1.getPriority() - t2.getPriority();
      }
    });

    for (INavigateableTool tool : myTools) {
      INavigator navigator = tool.getCurrentNavigateableView();
      if (navigator != null) return navigator;
    }

    return null;
  }

  @NotNull
  public String getComponentName() {
    return "UsagesViewTracker";
  }

  public void initComponent() {
    Keymap keymap = KeymapManager.getInstance().getKeymap(KeymapManager.DEFAULT_IDEA_KEYMAP);
    assert keymap != null : "Default IDEA keymap is not found";
    ActionManager am = ActionManager.getInstance();

    am.registerAction(PREV_COMMAND, new AnAction() {
      public void actionPerformed(AnActionEvent e) {
        INavigator navigator = getNavigator();
        if (navigator != null) navigator.goToPrevious();
      }
    });
    keymap.addShortcut(PREV_COMMAND, getPrevShortcut());

    am.registerAction(NEXT_COMMAND, new AnAction() {
      public void actionPerformed(AnActionEvent e) {
        INavigator navigator = getNavigator();
        if (navigator != null) navigator.goToNext();
      }
    });
    keymap.addShortcut(NEXT_COMMAND, getNextShortcut());
  }

  public void disposeComponent() {
    KeymapManager.getInstance().getActiveKeymap().removeShortcut(PREV_COMMAND, getPrevShortcut());
    KeymapManager.getInstance().getActiveKeymap().removeShortcut(NEXT_COMMAND, getNextShortcut());
    ActionManager.getInstance().unregisterAction(PREV_COMMAND);
    ActionManager.getInstance().unregisterAction(NEXT_COMMAND);
  }
}
