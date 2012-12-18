package jetbrains.mps.ide.actions;

/*Generated by MPS */

import jetbrains.mps.workbench.action.BaseKeymapChanges;
import com.intellij.openapi.actionSystem.Shortcut;
import com.intellij.openapi.actionSystem.KeyboardShortcut;
import javax.swing.KeyStroke;
import java.util.List;
import java.util.ArrayList;

public class Mac_KeymapChanges extends BaseKeymapChanges {
  public Mac_KeymapChanges() {
    // simple 
    addSimpleShortcut("jetbrains.mps.ide.actions.AddLanguageImport_Action", getShortcut("ctrl L"));
    addSimpleShortcut("jetbrains.mps.ide.actions.AddModelImport_Action", getShortcut("ctrl M"));
    addSimpleShortcut("jetbrains.mps.ide.actions.CreateAspect_Action", getShortcut("ctrl alt N"));
    addSimpleShortcut("jetbrains.mps.ide.actions.QuickCreate_Action", getShortcut("ctrl N"), getShortcut("ctrl ENTER"));
    addSimpleShortcut("jetbrains.mps.ide.actions.ShowClassInHierarchy_Action", getShortcut("ctrl H"));
    addSimpleShortcut("jetbrains.mps.ide.actions.ShowConceptInHierarchy_Action", getShortcut("ctrl H"));
    addSimpleShortcut("jetbrains.mps.ide.actions.ShowNodeInfo_Action", getShortcut("ctrl Q"));
    // simple parameterized 
    addComplexShortcut("jetbrains.mps.ide.actions.GoToBookmark_Action", new BaseKeymapChanges.ComplexShortcut.ParameterizedSimpleShortcut(getShortcut("ctrl 0")));
    // complex 
    addComplexShortcut("jetbrains.mps.ide.actions.GoToBookmark_Action", new Mac_KeymapChanges.GoToBookmark_ShortcutChange_tqv_i());
  }

  public String getScheme() {
    return "Mac OS X";
  }

  public static Shortcut getShortcut(String stroke) {
    return new KeyboardShortcut(KeyStroke.getKeyStroke(stroke), null);
  }

  public class GoToBookmark_ShortcutChange_tqv_i extends BaseKeymapChanges.ComplexShortcut {
    public GoToBookmark_ShortcutChange_tqv_i() {
    }

    public List<Shortcut> getShortcutsFor(Object... objects) {
      List<Shortcut> _result = new ArrayList<Shortcut>();
      _result.add(new KeyboardShortcut(KeyStroke.getKeyStroke("ctrl " + ((Integer) objects[0])), null));
      return _result;
    }
  }
}
