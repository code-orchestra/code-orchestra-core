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


import gnu.trove.TIntObjectHashMap;
import gnu.trove.TObjectProcedure;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.util.Pair;
import jetbrains.mps.util.EqualUtil;

import java.awt.event.KeyEvent;
import java.lang.reflect.Field;
import java.util.*;

public class EditorCellKeyMap {
  private static final Logger LOG = Logger.getLogger(EditorCellKeyMap.class);

  public static final String KEY_MODIFIERS_NONE = "none";
  public static final String KEY_MODIFIERS_ANY = "any";

  public static final String KEY_MODIFIERS_CTRL = "ctrl";
  public static final String KEY_MODIFIERS_ALT = "alt";
  public static final String KEY_MODIFIERS_SHIFT = "shift";
  public static final String KEY_MODIFIERS_CTRL_ALT = "ctrl+alt";
  public static final String KEY_MODIFIERS_CTRL_SHIFT = "ctrl+shift";
  public static final String KEY_MODIFIERS_CTRL_ALT_SHIFT = "ctrl+alt+shift";
  public static final String KEY_MODIFIERS_ALT_SHIFT = "alt+shift";

  public static final String KEY_CODE_DIGIT = "digit";
  public static final String KEY_CODE_LETTER = "letter";
  public static final String KEY_CODE_LETTER_OR_DIGIT = "letter or digit";
  public static final String KEY_CODE_SPACE = "space char";
  public static final String KEY_CODE_CHAR = "non-space char";

  private static TIntObjectHashMap<String> ourJavaKeycodesMap = new TIntObjectHashMap<String>();
  private static Set<String> ourVirtualKeycodes;
  private static Set<String> ourKeycodeCategories;
  private static Set<String> ourModifiers;

  static {
    Field[] declaredFields = KeyEvent.class.getDeclaredFields();
    for (Field field : declaredFields) {
      String name = field.getName();
      if (name.startsWith("VK_")) {
        if (name.equals("VK_CONTROL") ||
                name.equals("VK_ALT") ||
                name.equals("VK_SHIFT")) {
          continue;
        }
        try {
          int value = field.getInt(null);
          ourJavaKeycodesMap.put(value, name);
        } catch (IllegalAccessException e) {
          LOG.error(e);
        }
      }
    }
  } // static init

  private HashMap<ActionKey, EditorCellKeyMapAction> myActionMap;
  private List<Pair<ActionKey, EditorCellKeyMapAction>> myDuplicatedActionList;
  private List<EditorCellKeyMap> myChildKeyMaps;
  private boolean myApplicableToEveryModel = false;

  public EditorCellKeyMap() {
    myActionMap = new HashMap<ActionKey, EditorCellKeyMapAction>();
  }

  public void addKeyMap(EditorCellKeyMap keyMap) {
    if (myChildKeyMaps == null) {
      myChildKeyMaps = new LinkedList<EditorCellKeyMap>();
    }
    myChildKeyMaps.add(keyMap);
  }

  public void putAction(String modifiers, String keyCode, EditorCellKeyMapAction action) {
    putAction(modifiers, keyCode, keyCode.length() == 1, action);
  }

  private void putAction(String modifiers, String keyCode, boolean typed, EditorCellKeyMapAction action) {
    ActionKey key = new ActionKey(modifiers, keyCode, typed);
    if (!myActionMap.containsKey(key)) {
      myActionMap.put(key, action);
    } else {
      addToDuplicatedActions(key, action);
    }
  }

  private void addToDuplicatedActions(ActionKey key, EditorCellKeyMapAction action) {
    if (myDuplicatedActionList == null) {
      myDuplicatedActionList = new LinkedList<Pair<ActionKey, EditorCellKeyMapAction>>();
    }
    myDuplicatedActionList.add(new Pair<ActionKey, EditorCellKeyMapAction>(key, action));
  }

  private static List<EditorCellKeyMapAction> lookupDuplicatedActions(ActionKey key, List<Pair<ActionKey, EditorCellKeyMapAction>> actions) {
    if (actions == null) return Collections.emptyList();
    List<EditorCellKeyMapAction> result = null;
    for (Pair<ActionKey, EditorCellKeyMapAction> pair : actions) {
      if (pair.o1.equals(key)) {
        if (result == null) result = new LinkedList<EditorCellKeyMapAction>();
        result.add(pair.o2);
      }
    }
    if (result == null) return Collections.emptyList();
    return result;
  }

  public boolean hasActions(KeyEvent event) {
    if (findActions(this, event).size() > 0) {
      return true;
    }
    if (myChildKeyMaps != null) {
      for (EditorCellKeyMap childKeyMap : myChildKeyMaps) {
        if (findActions(childKeyMap, event).size() > 0) {
          return true;
        }
      }
    }
    return false;
  }

  public List<EditorCellKeyMapAction> getActions(KeyEvent event) {
    List<EditorCellKeyMapAction> result = null;
    List<EditorCellKeyMapAction> actions = findActions(this, event);
    if (actions.size() > 0) {
      result = new LinkedList<EditorCellKeyMapAction>();
      result.addAll(actions);
    }
    if (myChildKeyMaps != null) {
      for (EditorCellKeyMap childKeyMap : myChildKeyMaps) {
        actions = findActions(childKeyMap, event);
        if (actions.size() > 0) {
          if (result == null) result = new LinkedList<EditorCellKeyMapAction>();
          result.addAll(actions);
        }
      }
    }
    if (result == null) return Collections.emptyList();
    return result;
  }

  public List<ActionKey> getActionKeys() {
    return new ArrayList<ActionKey>(myActionMap.keySet());
  }

  private static List<EditorCellKeyMapAction> findActions(EditorCellKeyMap keyMap, KeyEvent event) {
    if (event == null) return findAllActions(keyMap);
    List<EditorCellKeyMapAction> result = null;
    List<ActionKey> actionsKeys = keyEvent2ActionKey(event);
    for (ActionKey actionKey : actionsKeys) {
      EditorCellKeyMapAction action = keyMap.myActionMap.get(actionKey);
      if (action != null) {
        if (result == null) result = new LinkedList<EditorCellKeyMapAction>();
        LOG.debug("keymap action " + (result.isEmpty() ? "" : "[" + result.size() + "]") + " found for key: " + actionKey);
        if (!result.contains(action)) {
          result.add(action);
        }
      }

      List<EditorCellKeyMapAction> extraActions = lookupDuplicatedActions(actionKey, keyMap.myDuplicatedActionList);
      if (extraActions.size() > 0) {
        LOG.debug("keymap action found [" + extraActions.size() + "] extra actions for key: " + actionKey);
        if (result == null) result = new LinkedList<EditorCellKeyMapAction>();
        // only add actions which are different
        for (EditorCellKeyMapAction extraAction : extraActions) {
          if (!result.contains(extraAction)) {
            result.add(extraAction);
          }
        }
      }
    }

    if (result == null) return Collections.emptyList();
    return result;
  }

  private static List<EditorCellKeyMapAction> findAllActions(EditorCellKeyMap keyMap) {
    List<EditorCellKeyMapAction> result = new ArrayList<EditorCellKeyMapAction>();
    for (EditorCellKeyMapAction action : keyMap.myActionMap.values()) {
      if (!result.contains(action)) {
        result.add(action);
      }
    }

    if (keyMap.myDuplicatedActionList != null) {
      List<EditorCellKeyMapAction> extraActions = new ArrayList<EditorCellKeyMapAction>();
      for (Pair<ActionKey, EditorCellKeyMapAction> pair : keyMap.myDuplicatedActionList) {
        extraActions.add(pair.o2);
      }

      if (extraActions.size() > 0) {
        // only add actions which are different
        for (EditorCellKeyMapAction extraAction : extraActions) {
          if (!result.contains(extraAction)) {
            result.add(extraAction);
          }
        }
      }
    }

    return result;
  }

  private static List<ActionKey> keyEvent2ActionKey(KeyEvent event) {
    List<ActionKey> keys = new LinkedList<ActionKey>();
    List<String> modifiers = modifiersForEvent(event);
    List<String> keyCodes = keyCodesForEvent(event);
    if (modifiers.size() > 0 && keyCodes.size() > 0) {
      for (String modifier : modifiers) {
        for (String keyKode : keyCodes) {
          ActionKey actionKey = new ActionKey(modifier, keyKode, event.getID() == KeyEvent.KEY_TYPED);
          keys.add(actionKey);
        }
      }
    }
    return keys;
  }

  private static List<String> modifiersForEvent(KeyEvent event) {
    List<String> modifiers = new LinkedList<String>();
    if (event.getModifiers() == 0) {
      modifiers.add(KEY_MODIFIERS_NONE);
    } else if (event.isControlDown() && !event.isAltDown() && !event.isShiftDown()) {
      modifiers.add(KEY_MODIFIERS_CTRL);
    } else if (!event.isControlDown() && event.isAltDown() && !event.isShiftDown()) {
      modifiers.add(KEY_MODIFIERS_ALT);
    } else if (!event.isControlDown() && !event.isAltDown() && event.isShiftDown()) {
      modifiers.add(KEY_MODIFIERS_SHIFT);
    } else if (event.isControlDown() && event.isAltDown() && !event.isShiftDown()) {
      modifiers.add(KEY_MODIFIERS_CTRL_ALT);
    } else if (event.isControlDown() && !event.isAltDown() && event.isShiftDown()) {
      modifiers.add(KEY_MODIFIERS_CTRL_SHIFT);
    } else if (event.isControlDown() && event.isAltDown() && event.isShiftDown()) {
      modifiers.add(KEY_MODIFIERS_CTRL_ALT_SHIFT);
    } else if (!event.isControlDown() && event.isAltDown() && event.isShiftDown()) {
      modifiers.add(KEY_MODIFIERS_ALT_SHIFT);
    }

    modifiers.add(KEY_MODIFIERS_ANY);
    return modifiers;
  }

  private static List<String> keyCodesForEvent(KeyEvent event) {
    List<String> keyCodes = new LinkedList<String>();

    int keyCode = event.getKeyCode();

    keyCodes.add("");

    if (keyCode != KeyEvent.VK_CONTROL &&
        keyCode != KeyEvent.VK_ALT &&
        keyCode != KeyEvent.VK_SHIFT &&
        keyCode != KeyEvent.VK_UNDEFINED) {
      String keyCodeName = ourJavaKeycodesMap.get(new Integer(keyCode));
      assert keyCodeName != null;
      keyCodes.add(keyCodeName);
    }

    // todo: the "keychar" testing in the "key pressed" event is not very reliable
    // todo: the "key typed" event should be handled instead
    if (event.isControlDown() || event.isAltDown()) {
      // ignore keychar
      return keyCodes;   //TODO why?!
    }

    char keyChar = event.getKeyChar();
    if (keyChar == KeyEvent.CHAR_UNDEFINED) {
      return keyCodes;
    }

    keyCodes.add("" + keyChar);

    if (!Character.isSpaceChar(keyChar) && !Character.isWhitespace(keyChar) &&
            keyChar != KeyEvent.VK_DELETE &&
            keyChar != KeyEvent.VK_ESCAPE &&
            keyChar != KeyEvent.VK_BACK_SPACE) {
      keyCodes.add(KEY_CODE_CHAR);
    }

    if (Character.isDigit(keyChar)) {
      keyCodes.add(KEY_CODE_DIGIT);
      keyCodes.add(KEY_CODE_LETTER_OR_DIGIT);
    } else if (Character.isLetter(keyChar)) {
      keyCodes.add(KEY_CODE_LETTER);
      keyCodes.add(KEY_CODE_LETTER_OR_DIGIT);
    } else if (Character.isLetterOrDigit(keyChar)) {
      keyCodes.add(KEY_CODE_LETTER_OR_DIGIT);
    } else if (Character.isSpaceChar(keyChar) || Character.isWhitespace(keyChar)) {
      keyCodes.add(KEY_CODE_SPACE);
    }

    return keyCodes;
  }

  public static List<String> getVirtualKeycodes() {
    List<String> result = new ArrayList<String>(getOurVirtualKeycodes());
    Collections.sort(result);
    return result;
  }

  private static Set<String> getOurVirtualKeycodes() {
    if (ourVirtualKeycodes == null) {
      final Set<String> keyCodes = new HashSet<String>();
      ourJavaKeycodesMap.forEachValue(new TObjectProcedure<String>() {
        @Override
        public boolean execute(String value) {
          keyCodes.add(value);
          return true;
        }
      });
      ourVirtualKeycodes = keyCodes;
    }
    return ourVirtualKeycodes;
  }

  public static List<String> getModifiers() {
    List<String> result = new ArrayList<String>(getOurModifiers());
    Collections.sort(result);
    return result;
  }

  private static synchronized Set<String> getOurModifiers() {
    if (ourModifiers == null) {
      ourModifiers = new HashSet<String>();
      Field[] fields = EditorCellKeyMap.class.getFields();
      for (Field field : fields) {
        String name = field.getName();
        if (name.startsWith("KEY_MODIFIERS_")) {
          try {
            String value = field.get(null).toString();
            ourModifiers.add(value);
          } catch (IllegalAccessException e) {
            LOG.error(e);
          }
        }
      }
    }
    return ourModifiers;
  }

  public static List<String> getKeycodeCategories() {
    List<String> result = new ArrayList<String>(getOurKeycodeCategories());
    Collections.sort(result);
    return result;
  }

  private static Set<String> getOurKeycodeCategories() {
    if (ourKeycodeCategories == null) {
      Set<String> categories = new HashSet<String>();
      Field[] fields = EditorCellKeyMap.class.getFields();
      for (Field field : fields) {
        String name = field.getName();
        if (name.startsWith("KEY_CODE_")) {
          try {
            String value = field.get(null).toString();
            categories.add(value);
          } catch (IllegalAccessException e) {
            LOG.error(e);
          }
        }
      }
      ourKeycodeCategories = categories;
    }
    return ourKeycodeCategories;
  }

  public static boolean isValidModifiers(String modifiers) {
    return getOurModifiers().contains(modifiers);
  }

  public static boolean isValidKeycode(String keycode) {
    if (keycode == null || keycode.length() == 0) {
      return true;
    }
    if (keycode.length() == 1) {
      return true;
    }
    return getOurKeycodeCategories().contains(keycode) || getOurVirtualKeycodes().contains(keycode);
  }

  public boolean isApplicableToEveryModel() {
    return myApplicableToEveryModel;
  }

  public void setApplicableToEveryModel(boolean isApplicable) {
    myApplicableToEveryModel = isApplicable;
  }

  public List<Pair<EditorCellKeyMapAction, ActionKey>> getAllActionsAndKeys() {
    List<Pair<EditorCellKeyMapAction, ActionKey>> result = new LinkedList<Pair<EditorCellKeyMapAction, ActionKey>>();
    if (myActionMap != null) {
      Set<Map.Entry<ActionKey, EditorCellKeyMapAction>> entries = myActionMap.entrySet();
      for (Map.Entry<ActionKey, EditorCellKeyMapAction> entry : entries) {
        Pair<EditorCellKeyMapAction, ActionKey> pair = new Pair<EditorCellKeyMapAction, ActionKey>(entry.getValue(), entry.getKey());
        result.add(pair);
      }
    }

    if (myDuplicatedActionList != null) {
      for (Pair<ActionKey, EditorCellKeyMapAction> keyAndAction : myDuplicatedActionList) {
        result.add(new Pair<EditorCellKeyMapAction, ActionKey>(keyAndAction.o2, keyAndAction.o1));
      }
    }

    if (myChildKeyMaps != null) {
      for (EditorCellKeyMap childMap : myChildKeyMaps) {
        result.addAll(childMap.getAllActionsAndKeys());
      }
    }
    return result;
  }

  public static class ActionKey {
    private String myModifiers;
    private String myKeyCode;
    private boolean myTyped;

    public ActionKey(String modifiers, String keyCode, boolean typed) {
      assert modifiers != null;
      assert keyCode != null;
      myModifiers = modifiers;
      myKeyCode = keyCode;
      myTyped = typed;
    }

    public int hashCode() {
      return myModifiers.hashCode() ^ myKeyCode.hashCode();
    }

    public boolean equals(Object o) {
      if (!(o instanceof ActionKey)) return false;

      ActionKey key = (ActionKey) o;

      return EqualUtil.equals(myModifiers, key.myModifiers) &&
        EqualUtil.equals(myKeyCode, key.myKeyCode) &&
        myTyped == key.myTyped;
    }

    public String toString() {
      return (myTyped ? "typed " : "") + "action key: " + myModifiers + " + " + myKeyCode;
    }

    public String presentation() {
      String modifiers = null;
      if (myModifiers.equals(KEY_MODIFIERS_ANY)) modifiers = "<any modifiers>";
      else if (myModifiers.equals(KEY_MODIFIERS_CTRL)) modifiers = "Ctrl";
      else if (myModifiers.equals(KEY_MODIFIERS_ALT)) modifiers = "Alt";
      else if (myModifiers.equals(KEY_MODIFIERS_SHIFT)) modifiers = "Shift";
      else if (myModifiers.equals(KEY_MODIFIERS_CTRL_ALT)) modifiers = "Ctrl+Alt";
      else if (myModifiers.equals(KEY_MODIFIERS_CTRL_SHIFT)) modifiers = "Ctrl+Shift";
      else if (myModifiers.equals(KEY_MODIFIERS_CTRL_ALT_SHIFT)) modifiers = "Ctrl+Alt+Shift";
      else if (myModifiers.equals(KEY_MODIFIERS_ALT_SHIFT)) modifiers = "Alt+Shift";

      String keyCode = myKeyCode;
      if (keyCode.startsWith("VK_")) keyCode = keyCode.substring(3);
      else keyCode = "'" + keyCode + "'";

      return (modifiers != null ? (modifiers + "-") : "") + keyCode;
    }
  }
}
