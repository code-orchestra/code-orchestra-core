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
package jetbrains.mps.ide;

import com.intellij.openapi.actionSystem.*;
import jetbrains.mps.workbench.action.BaseGroup;

public class KeyStrokesUtil {
  public static String dumpKeyStrokes() {
    ActionManager manager = ActionManager.getInstance();
    StringBuilder result = new StringBuilder();
    for (String id : manager.getActionIds("")) {
      if (manager.isGroup(id)) {
        dump((ActionGroup) manager.getAction(id), result);
      }
    }
    return result.toString();
  }

  private static void dump(ActionGroup ag, StringBuilder builder) {
    for (AnAction a : ag.getChildren(null)) {
      builder
        .append(a.getTemplatePresentation().getText())
        .append(" = ");
      for (Shortcut s : a.getShortcutSet().getShortcuts()) {
        if (s instanceof KeyboardShortcut) {
          KeyboardShortcut ks = (KeyboardShortcut) s;
          builder.append(ks.getFirstKeyStroke()).append(";");
        }
      }
      builder.append("\n");

      if (a instanceof BaseGroup) {
        dump((BaseGroup) a, builder);
      }
    }
  }
}
