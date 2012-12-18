package jetbrains.mps.ide.editor.actions;

/*Generated by MPS */

import codeOrchestra.actionScript.editor.BlockListHelper;
import codeOrchestra.actionscript.view.utils.NodeUtils;
import jetbrains.mps.internal.collections.runtime.IListSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.plugins.pluginparts.actions.GeneratedAction;
import javax.swing.Icon;

import jetbrains.mps.smodel.SNodeUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.intellij.openapi.actionSystem.AnActionEvent;
import java.util.Map;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.List;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.internal.collections.runtime.MapSequence;
import jetbrains.mps.nodeEditor.EditorComponent;
import org.jetbrains.annotations.NotNull;
import jetbrains.mps.workbench.MPSDataKeys;
import java.util.ArrayList;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.smodel.behaviour.BehaviorManager;

public class CopyThisDown_Action extends GeneratedAction {
  private static final Icon ICON = null;
  protected static Log log = LogFactory.getLog(CopyThisDown_Action.class);

  public CopyThisDown_Action() {
    super("Duplicate Node", "", ICON);
    this.setIsAlwaysVisible(false);
    this.setExecuteOutsideCommand(false);
  }

  @Override
  protected boolean isEnabledInASView() {
    return true;
  }

  public boolean isApplicable(AnActionEvent event, final Map<String, Object> _params) {
    return ListSequence.fromList(((List<SNode>) MapSequence.fromMap(_params).get("inputNodes"))).count() > 0 && !(((EditorComponent) MapSequence.fromMap(_params).get("editorComponent")).isReadOnly());
  }

  public void doUpdate(@NotNull AnActionEvent event, final Map<String, Object> _params) {
    try {
      {
        boolean enabled = this.isApplicable(event, _params);
        this.setEnabledState(event.getPresentation(), enabled);
      }
    } catch (Throwable t) {
      if (log.isErrorEnabled()) {
        log.error("User's action doUpdate method failed. Action:" + "CopyThisDown", t);
      }
      this.disable(event.getPresentation());
    }
  }

  protected boolean collectActionData(AnActionEvent event, final Map<String, Object> _params) {
    if (!(super.collectActionData(event, _params))) {
      return false;
    }
    {
      List<SNode> nodes = event.getData(MPSDataKeys.NODES);
      boolean error = false;
      if (nodes != null) {
      }
      if (error || nodes == null) {
        MapSequence.fromMap(_params).put("inputNodes", null);
      } else {
        MapSequence.fromMap(_params).put("inputNodes", ListSequence.fromListWithValues(new ArrayList<SNode>(), nodes));
      }
    }
    if (MapSequence.fromMap(_params).get("inputNodes") == null) {
      return false;
    }
    MapSequence.fromMap(_params).put("editorComponent", event.getData(MPSDataKeys.EDITOR_COMPONENT));
    if (MapSequence.fromMap(_params).get("editorComponent") == null) {
      return false;
    }
    return true;
  }

  public void doExecute(@NotNull final AnActionEvent event, final Map<String, Object> _params) {
    try {
      IListSequence<SNode> inputNodes = ListSequence.fromList((List<SNode>) MapSequence.fromMap(_params).get("inputNodes"));
      EditorComponent editorComponent = (EditorComponent) MapSequence.fromMap(_params).get("editorComponent");

      // RE-3434
      if (inputNodes.count() == 1) {
        SNode nodeToCopy = inputNodes.first();
        while (SNodeOperations.getParent(nodeToCopy) != null) {
          // Get all the stuff we need - parent, role and link declaration
          SNode parent = SNodeOperations.getParent(nodeToCopy);
          String role = nodeToCopy.getRole_();
          SNode link = SLinkOperations.findLinkDeclaration(parent.getConceptFqName(), role);
          if (link == null) {
            return;
          }

          // If the parent is a IBlockList concept instance and has less than two elements,
          // treat it like a singular relationship
          boolean isSingularRelation = SNodeUtil.getLinkDeclaration_IsSingular(link);
          if (BlockListHelper.isBlockListAndHasLessThanTwoElements(parent)) {
            isSingularRelation = true;
          }

          // Singular relation handling
          if (isSingularRelation) {
            if (nodeToCopy.isInstanceOfConcept(NodeUtils.DUPLICABLE_CONCEPT)) {
              // If the current node is in singular relation & is IDuplicable which can be activated, do it
              if (NodeUtils.isDuplicable(nodeToCopy, editorComponent.getEditorContext())) {
                NodeUtils.duplicate(nodeToCopy, editorComponent.getEditorContext());
                return;
              } else {
                // We go up the AST
                nodeToCopy = parent;
              }
            } else {
              // We go up the AST
              nodeToCopy = parent;
            }
          } else {
            // One-to-many (giggity) relation
            SNode copy = SNodeOperations.copyNode(nodeToCopy);
            parent.insertChild(nodeToCopy, role, copy);

            if (copy != null) {
              editorComponent.getEditorContext().selectWRTFocusPolicy(copy);
              editorComponent.selectNode(copy);
            }
            return;
          }
        }
      } else {
        SNode firstNode = inputNodes.first();
        SNode lastNode = inputNodes.last();
        String role = firstNode.getRole_();
        SNode parent = SNodeOperations.getParent(firstNode);
        SNode link = SLinkOperations.findLinkDeclaration(parent.getConceptFqName(), role);
        if (link == null) {
          return;
        }
        for (SNode node : inputNodes.reversedList()) {
          parent.insertChild(lastNode, role, SNodeOperations.copyNode(node));
        }
        editorComponent.getEditorContext().selectRange(firstNode, lastNode);
      }
    } catch (Throwable t) {
      if (log.isErrorEnabled()) {
        log.error("User's action execute method failed. Action:" + "CopyThisDown", t);
      }
    }
  }

}
