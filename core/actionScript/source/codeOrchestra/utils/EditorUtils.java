package codeOrchestra.utils;

import com.intellij.openapi.fileEditor.FileEditorManager;
import com.intellij.openapi.util.Computable;
import codeOrchestra.actionscript.view.utils.NodeUtils;
import jetbrains.mps.ide.IEditor;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.workbench.editors.MPSFileNodeEditor;
import jetbrains.mps.workbench.highlighter.EditorsHelper;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public final class EditorUtils {

  public static void clearNodesBeingEditedOfAutoValidatorObjects() {
    for (SNode sNode : getNodesBeingEdited()) {
      NodeUtils.clearAutoValidatorFlags(sNode);
    }
  }

  public static List<SNode> getNodesBeingEdited() {
    List<MPSFileNodeEditor> mpsEditors = EditorsHelper.getAllEditors(FileEditorManager.getInstance(ProjectHolder.getProject()));
    if (mpsEditors == null) {
      return Collections.EMPTY_LIST;
    }

    List<SNode> editedNodes = new ArrayList<SNode>();
    for (MPSFileNodeEditor mpsEditor : mpsEditors) {
      IEditor nodeEditor = mpsEditor.getNodeEditor();
      if (nodeEditor != null) {
        final SNodePointer currentlyEditedNode = nodeEditor.getCurrentlyEditedNode();
        if (currentlyEditedNode != null) {
          SNode sNode = ModelAccess.instance().runReadAction(new Computable<SNode>() {
            @Override
            public SNode compute() {
              return currentlyEditedNode.getNode();
            }
          });

          if (sNode != null) {
            editedNodes.add(sNode);
          }
        }
      }
    }

    return editedNodes;
  }

}
