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
package jetbrains.mps.workbench.action;

import com.intellij.openapi.actionSystem.Shortcut;
import com.intellij.openapi.keymap.Keymap;
import com.intellij.openapi.keymap.KeymapManager;
import gnu.trove.THashMap;
import gnu.trove.THashSet;
import jetbrains.mps.logging.Logger;

import java.util.*;
import java.util.Map.Entry;

public abstract class BaseKeymapChanges {
  private static final Logger LOG = Logger.getLogger(BaseKeymapChanges.class);

  private static Map<Keymap, Set<String>> ourClearedActions = new THashMap<Keymap, Set<String>>();
  private Map<String, Set<Shortcut>> myRemovedShortcuts = new THashMap<String, Set<Shortcut>>();

  private Map<String, Set<Shortcut>> myAddedComplexShortcuts = new THashMap<String, Set<Shortcut>>();

  private Map<String, Set<Shortcut>> mySimpleShortcuts = new THashMap<String, Set<Shortcut>>();
  private Map<String, Set<ComplexShortcut>> myComplexShortcuts = new THashMap<String, Set<ComplexShortcut>>();

  private Keymap myKeymap;

  public abstract String getScheme();

  //shortId is an id w/o parameter ids
  public void parameterizedActionCreated(String shortId, String longId, Object... params) {
    Keymap keymap = getKeymap();
    if (keymap == null) return;

    Set<ComplexShortcut> complexShortcuts = myComplexShortcuts.get(shortId);
    if (complexShortcuts == null) return;

    for (ComplexShortcut cs : complexShortcuts) {
      for (Shortcut s : cs.getShortcutsFor(params)) {
        addShortcutToKeymap(longId, keymap, s);

        Set<Shortcut> added = myAddedComplexShortcuts.get(longId);
        if (added == null) {
          added = new THashSet<Shortcut>();
          myAddedComplexShortcuts.put(longId, added);
        }
        added.add(s);
      }
    }
  }

  public final void init() {
    Keymap keymap = getKeymap();
    if (keymap == null) return;

    for (Entry<String, Set<Shortcut>> e : mySimpleShortcuts.entrySet()) {
      String key = e.getKey();
      for (Shortcut s : e.getValue()) {
        addShortcutToKeymap(key, keymap, s);
      }
    }
  }

  public final void dispose() {
    Keymap keymap = getKeymap();
    if (keymap == null) return;

    //complex
    for (Entry<String, Set<Shortcut>> e : myAddedComplexShortcuts.entrySet()) {
      String key = e.getKey();
      for (Shortcut s : e.getValue()) {
        keymap.removeShortcut(key, s);
      }
    }
    myAddedComplexShortcuts.clear();

    //simple
    for (Entry<String, Set<Shortcut>> e : mySimpleShortcuts.entrySet()) {
      String key = e.getKey();
      for (Shortcut s : e.getValue()) {
        keymap.removeShortcut(key, s);
      }
    }
    mySimpleShortcuts.clear();

    //register old
    for (Entry<String, Set<Shortcut>> e : myRemovedShortcuts.entrySet()) {
      String key = e.getKey();
      for (Shortcut s : e.getValue()) {
        keymap.addShortcut(key, s);
      }
    }
    myRemovedShortcuts.clear();

    ourClearedActions.clear();
  }

  protected void addSimpleShortcut(String id, Shortcut... s) {
    Set<Shortcut> shortcuts = mySimpleShortcuts.get(id);
    if (shortcuts == null) {
      shortcuts = new THashSet<Shortcut>();
      mySimpleShortcuts.put(id, shortcuts);
    }
    shortcuts.addAll(Arrays.asList(s));
  }

  protected void addComplexShortcut(String id, ComplexShortcut... s) {
    Set<ComplexShortcut> shortcuts = myComplexShortcuts.get(id);
    if (shortcuts == null) {
      shortcuts = new THashSet<ComplexShortcut>();
      myComplexShortcuts.put(id, shortcuts);
    }
    shortcuts.addAll(Arrays.asList(s));
  }

  private void addShortcutToKeymap(String longId, Keymap keymap, Shortcut s) {
    Shortcut[] oldShortcuts = keymap.getShortcuts(longId);

    boolean isClear = oldShortcuts.length == 0;
    if (!isClear) {
      for (Set<String> set : ourClearedActions.values()) {
        if (set.contains(longId)) {
          isClear = true;
          break;
        }
      }
    }

    if (!isClear) {
      if (oldShortcuts.length != 0) {
        myRemovedShortcuts.put(longId, new THashSet<Shortcut>(Arrays.asList(oldShortcuts)));
        keymap.removeAllActionShortcuts(longId);
      }
    }

    Set<String> actions = ourClearedActions.get(keymap);
    if (actions == null) {
      actions = new THashSet<String>();
      ourClearedActions.put(keymap, actions);
    }
    actions.add(longId);

    keymap.addShortcut(longId, s);
  }

  private Keymap getKeymap() {
    if (myKeymap == null) {
      myKeymap = KeymapManager.getInstance().getKeymap(getScheme());
      if (myKeymap == null) {
        LOG.error("keymap " + getScheme() + " is not found");
        return null;
      }
    }
    return myKeymap;
  }

  protected static abstract class ComplexShortcut {
    public abstract List<Shortcut> getShortcutsFor(Object... params);

    public static class ParameterizedSimpleShortcut extends ComplexShortcut {
      private final List<Shortcut> myShortcut;

      public ParameterizedSimpleShortcut(Shortcut... shortcut) {
        myShortcut = Arrays.asList(shortcut);
      }

      public List<Shortcut> getShortcutsFor(Object... params) {
        return myShortcut;
      }
    }
  }
}
