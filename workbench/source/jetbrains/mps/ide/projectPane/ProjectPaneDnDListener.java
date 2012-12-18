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
package jetbrains.mps.ide.projectPane;

import com.intellij.ide.DataManager;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.wm.WindowManager;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.smodel.PackageNode;
import jetbrains.mps.ide.ui.smodel.SModelTreeNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.Pair;
import jetbrains.mps.workbench.MPSDataKeys;
import org.apache.commons.lang.ObjectUtils;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTree;
import javax.swing.tree.TreePath;
import java.awt.Point;
import java.awt.datatransfer.DataFlavor;
import java.awt.dnd.DropTargetDragEvent;
import java.awt.dnd.DropTargetDropEvent;
import java.awt.dnd.DropTargetEvent;
import java.awt.dnd.DropTargetListener;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ProjectPaneDnDListener implements DropTargetListener {
  private JTree myTree;
  private DataFlavor myDataFlavor;

  public ProjectPaneDnDListener(final JTree tree, DataFlavor dataFlavor) {
    myDataFlavor = dataFlavor;
    myTree = tree;
  }

  private SModelDescriptor getModelDescriptor(final SNode node) {
    if (node == null) return null;
    SModel model = ModelAccess.instance().runReadAction(new Computable<SModel>() {
      public SModel compute() {
        return node.getModel();
      }
    });
    return (model == null) ? null : model.getModelDescriptor();
  }

  private String getVirtualPackage(final SNode node) {
    return ModelAccess.instance().runReadAction(new Computable<String>() {
      public String compute() {
        String result = node.getProperty(SNodeUtil.property_BaseConcept_virtualPackage);
        return (result == null) ? "" : result;
      }
    });
  }

  private List<Pair<SNode, String>> getNodesToMove(SModelDescriptor targetModel, String virtualPackage, List<Pair<SNode, String>> sourceNodes) {
    if (targetModel == null) return Collections.emptyList();
    List<Pair<SNode, String>> result = new ArrayList<Pair<SNode, String>>();
    for (final Pair<SNode, String> node : sourceNodes) {
      if (ObjectUtils.equals(virtualPackage + node.o2, getVirtualPackage(node.o1))) continue;
      SModelDescriptor sourceModel = getModelDescriptor(node.o1);
      if (ObjectUtils.equals(sourceModel, targetModel)) {
        result.add(new Pair(node.o1, node.o2));
      }
    }
    return result;
  }

  private String getTargetVirtualPackage(TreePath target) {
    MPSTreeNode node = (MPSTreeNode) target.getLastPathComponent();
    while (node != null && !(node instanceof PackageNode)) {
      node = (MPSTreeNode) node.getParent();
    }
    if (node != null) {
      String result = ((PackageNode) node).getFullPackage();
      return (result == null) ? "" : result;
    }
    return null;
  }

  private SModelDescriptor getTargetModel(TreePath target) {
    MPSTreeNode node = (MPSTreeNode) target.getLastPathComponent();
    while (node != null && !(node instanceof SModelTreeNode)) {
      node = (MPSTreeNode) node.getParent();
    }
    if (node != null) {
      return ((SModelTreeNode) node).getSModelDescriptor();
    }
    return null;
  }

  private String getPackagePresentation(String name) {
    return (name == null || name.isEmpty()) ? "<i>&lt;untitled&gt;</i>" : "'<b>" + name + "</b>'";
  }

  private String getFullTargetPack(String targetPackage, String basePack) {
    return (basePack == null || basePack.isEmpty()) ? targetPackage : targetPackage + "." + basePack;
  }

  private String getConfirnLabel(List<Pair<SNode, String>> sourceNodes, String target) {
    StringBuilder builder = new StringBuilder();
    builder.append("<html>Do you want to move ");
    builder.append(NameUtil.formatNumericalString(sourceNodes.size(), "node")).append(" ");
    Pair<SNode, String> first = sourceNodes.get(0);
    boolean isSingle = sourceNodes.size() == 1;
    if (isSingle) {
      builder.append("from virtual package ");
      builder.append(getPackagePresentation(getVirtualPackage(first.o1))).append(" ");
    }
    builder.append("to ");
    builder.append(getPackagePresentation(target + ((isSingle) ? first.o2 : "")));
    builder.append("?</html>");
    return builder.toString();
  }

  public void dragEnter(DropTargetDragEvent dtde) {
    dtde.acceptDrag(dtde.getDropAction());
  }

  public void dragOver(DropTargetDragEvent dtde) {
    dtde.acceptDrag(dtde.getDropAction());
  }

  public void dropActionChanged(DropTargetDragEvent dtde) {
  }

  public void dragExit(DropTargetEvent dte) {
  }

  public void drop(DropTargetDropEvent dtde) {
    Point point = dtde.getLocation();
    TreePath treePath = myTree.getPathForLocation(point.x, point.y);
    if (treePath == null) {
      dtde.rejectDrop();
      return;
    }
    Object target = treePath.getLastPathComponent();
    if (!(target instanceof MPSTreeNode)) {
      dtde.rejectDrop();
      return;
    }
    Object source = null;
    try {
      source = dtde.getTransferable().getTransferData(myDataFlavor);
    } catch (Throwable t) {
      t.printStackTrace();
    }
    if (!(source instanceof List) || ((List) source).isEmpty()) {
      dtde.rejectDrop();
      return;
    }
    final List<Pair<SNode, String>> sourceNodes = (List<Pair<SNode, String>>) source;

    SModelDescriptor targetModel = getTargetModel(treePath);
    final String targetPackage = (getTargetVirtualPackage(treePath) == null) ? "" : getTargetVirtualPackage(treePath);
    List<Pair<SNode, String>> nodeToMove = getNodesToMove(targetModel, targetPackage, sourceNodes);
    if (nodeToMove.isEmpty()) {
      dtde.rejectDrop();
      return;
    }
    Project project = MPSDataKeys.PROJECT.getData(DataManager.getInstance().getDataContext());
    JFrame frame = WindowManager.getInstance().getFrame(project);
    String text = getConfirnLabel(sourceNodes, targetPackage);
    int result = JOptionPane.showConfirmDialog(frame, text, "Move Nodes", JOptionPane.YES_NO_OPTION);
    if (result == JOptionPane.YES_OPTION) {
      ModelAccess.instance().runWriteActionInCommand(new Runnable() {
        public void run() {
          for (Pair<SNode, String> sourceNode : sourceNodes) {
            String fullTargetPack = getFullTargetPack(targetPackage, sourceNode.o2);
            sourceNode.o1.setProperty(SModelTreeNode.PACK, fullTargetPack);
            if (SNodeOperations.isInstanceOf(sourceNode.o1, SNodeUtil.concept_AbstractConceptDeclaration)) {
              List<SNode> allAspects = SNodeUtil.findAllAspects(sourceNode.o1);
              for (SNode aspect : allAspects) {
                aspect.setProperty(SModelTreeNode.PACK, fullTargetPack);
              }
            }
          }
        }
      });
    }
    dtde.acceptDrop(dtde.getDropAction());
  }
}
