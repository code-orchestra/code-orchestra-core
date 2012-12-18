package jetbrains.mps.baseLanguage.plugin;

/*Generated by MPS */

import jetbrains.mps.plugins.applicationplugins.BaseApplicationPlugin;
import com.intellij.openapi.extensions.PluginId;
import jetbrains.mps.ide.actions.EditorPopup_ActionGroup;
import jetbrains.mps.ide.actions.ModelActionsInternal_ActionGroup;
import jetbrains.mps.ide.actions.NodeActionsInternal_ActionGroup;
import jetbrains.mps.ide.actions.Tools_ActionGroup;
import jetbrains.mps.lang.refactoring.plugin.NodeRefactoring_ActionGroup;
import jetbrains.mps.ide.actions.Code_ActionGroup;
import jetbrains.mps.lang.dataFlow.plugin.DFAActions_ActionGroup;
import jetbrains.mps.ide.actions.EditorInternal_ActionGroup;
import java.util.List;
import jetbrains.mps.plugins.pluginparts.custom.BaseCustomApplicationPlugin;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.ArrayList;
import jetbrains.mps.workbench.action.BaseKeymapChanges;

public class BaseLanguage_ApplicationPlugin extends BaseApplicationPlugin {
  private PluginId myId = PluginId.getId("jetbrains.mps.baseLanguage");

  public BaseLanguage_ApplicationPlugin() {
  }

  public PluginId getId() {
    return myId;
  }

  public void createGroups() {
    // actions w/o parameters 
    addAction(new AnalyzeStacktrace_Action());
    addAction(new CommentLine_Action());
    addAction(new CommentStatements_Action());
    addAction(new ExtractMethod_Action());
    addAction(new GoToInheritedClassifier_Action());
    addAction(new GoToOverridenMethod_Action());
    addAction(new ImplementMethod_Action());
    addAction(new InlineLocalVariable_Action());
    addAction(new InlineMethod_Action());
    addAction(new IntroduceConstant_Action());
    addAction(new IntroduceField_Action());
    addAction(new IntroduceVariable_Action());
    addAction(new OverrideMethod_Action());
    addAction(new PrintNodePosition_Action());
    addAction(new RenameVariable_Action());
    addAction(new ShowMembers_Action());
    addAction(new ShowNullDFA_Action());
    addAction(new ShowTodoViewer_Action());
    addAction(new UncommentStatements_Action());
    // groups 
    addGroup(new AnalyzersActions_ActionGroup());
    addGroup(new BaseLangaugeCodeCommentsMenuGroup_ActionGroup());
    addGroup(new BaseLanguageEditorPopup_ActionGroup());
    addGroup(new BaseLanguageModelActionsInternal_ActionGroup());
    addGroup(new BaseLanguageNodeActionsInternal_ActionGroup());
    addGroup(new BaseLanguageToolsAddition_ActionGroup());
    addGroup(new BaseLangugeCodeOverrideImplementMenuGroup_ActionGroup());
    addGroup(new PrintNodePosition_ActionGroup());
    addGroup(new RefactoringAddition_ActionGroup());
  }

  public void adjustRegularGroups() {
    insertGroupIntoAnother(BaseLanguageEditorPopup_ActionGroup.ID, EditorPopup_ActionGroup.ID, null);
    insertGroupIntoAnother(BaseLanguageModelActionsInternal_ActionGroup.ID, ModelActionsInternal_ActionGroup.ID, null);
    insertGroupIntoAnother(BaseLanguageNodeActionsInternal_ActionGroup.ID, NodeActionsInternal_ActionGroup.ID, null);
    insertGroupIntoAnother(BaseLanguageToolsAddition_ActionGroup.ID, Tools_ActionGroup.ID, Tools_ActionGroup.LABEL_ID_customTools);
    insertGroupIntoAnother(RefactoringAddition_ActionGroup.ID, NodeRefactoring_ActionGroup.ID, null);
    insertGroupIntoAnother(BaseLangugeCodeOverrideImplementMenuGroup_ActionGroup.ID, Code_ActionGroup.ID, Code_ActionGroup.LABEL_ID_overrideImplement);
    insertGroupIntoAnother(BaseLangaugeCodeCommentsMenuGroup_ActionGroup.ID, Code_ActionGroup.ID, Code_ActionGroup.LABEL_ID_comments);
    insertGroupIntoAnother(AnalyzersActions_ActionGroup.ID, DFAActions_ActionGroup.ID, null);
    insertGroupIntoAnother(PrintNodePosition_ActionGroup.ID, EditorInternal_ActionGroup.ID, null);
  }

  public List<BaseCustomApplicationPlugin> initCustomParts() {
    List<BaseCustomApplicationPlugin> res = ListSequence.fromList(new ArrayList<BaseCustomApplicationPlugin>());
    addCustomPart(res, new DebugInfoProvider_CustomApplicationPlugin());
    addCustomPart(res, new RunConfigurationsInitializer_CustomApplicationPlugin());
    return res;
  }

  public List<BaseKeymapChanges> initKeymaps() {
    List<BaseKeymapChanges> res = ListSequence.fromList(new ArrayList<BaseKeymapChanges>());
    ListSequence.fromList(res).addElement(new Default_KeymapChanges());
    return res;
  }

  private void addCustomPart(List<BaseCustomApplicationPlugin> plugins, BaseCustomApplicationPlugin plugin) {
    ListSequence.fromList(plugins).addElement(plugin);
    plugin.init();
  }
}
