/*
 * Copyright 2003-2010 JetBrains s.r.o.
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
package jetbrains.mps.ide.ui.smodel;

import com.intellij.openapi.actionSystem.ActionGroup;
import jetbrains.mps.generator.TransientSModel;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.ide.projectPane.ProjectPaneActionGroups;
import jetbrains.mps.ide.projectPane.SortUtil;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.MPSTreeNodeEx;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.*;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.actions.model.CreateRootNodeGroup;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import javax.swing.tree.DefaultTreeModel;
import java.util.*;

public class SModelTreeNode extends MPSTreeNodeEx implements ISModelTreeNode {
  @Deprecated
  public static final String PACK = SNode.PACK;

  private SModelDescriptor myModelDescriptor;
  private List<SModelTreeNode> myChildModelTreeNodes = new ArrayList<SModelTreeNode>();

  private String myLabel;
  private boolean myInitialized = false;
  private boolean myInitializing = false;
  private boolean myShowLongName;
  private int myCountAdditionalNamePart = 0;
  private List<SNodeGroupTreeNode> myRootGroups = new ArrayList<SNodeGroupTreeNode>();

  private Condition<SNode> myNodesCondition;

  private DependencyRecorder<SNodeTreeNode> myDependencyRecorder = new DependencyRecorder<SNodeTreeNode>();

  private Map<String, PackageNode> myPackageNodes = new HashMap<String, PackageNode>();
  private Icon myIcon;

  public SModelTreeNode(SModelDescriptor modelDescriptor,
                        String label,
                        @NotNull IOperationContext operationContext) {
    this(modelDescriptor, label, operationContext, true);
  }

  public SModelTreeNode(SModelDescriptor modelDescriptor,
                        String label,
                        @NotNull IOperationContext operationContext,
                        Condition<SNode> condition) {
    this(modelDescriptor, label, operationContext, true, condition, 0);
  }

  public SModelTreeNode(SModelDescriptor modelDescriptor,
                        String label,
                        IOperationContext operationContext,
                        boolean showLongName) {
    this(modelDescriptor, label, operationContext, showLongName, Condition.TRUE_CONDITION, 0);
  }

  public SModelTreeNode(SModelDescriptor modelDescriptor,
                        String label,
                        IOperationContext operationContext,
                        int countNamePart) {
    this(modelDescriptor, label, operationContext, false, Condition.TRUE_CONDITION, countNamePart);
  }

  public SModelTreeNode(SModelDescriptor modelDescriptor,
                        String label,
                        IOperationContext operationContext,
                        boolean showLongName,
                        Condition<SNode> condition,
                        int countNamePart) {
    super(operationContext);
    myShowLongName = showLongName;
    myModelDescriptor = modelDescriptor;
    myIcon = IconManager.getIconFor(getSModelDescriptor());
    myLabel = label;
    myNodesCondition = condition;
    myCountAdditionalNamePart = countNamePart;
    setUserObject(modelDescriptor);
    if (myModelDescriptor != null) {
      setNodeIdentifier(myModelDescriptor.toString());
    } else {
      setNodeIdentifier("");
    }
    setText(calculateText());
    setIcon(myIcon);
  }

  public Icon getDefaultIcon() {
    return myIcon;
  }

  public boolean hasModelsUnder() {
    return !getSubfolderSModelTreeNodes().isEmpty();
  }

  //do not use!
  public DependencyRecorder<SNodeTreeNode> getDependencyRecorder() {
    return myDependencyRecorder;
  }

  protected SNodeGroupTreeNode getNodeGroupFor(SNode node) {
    boolean packagesEnabled = true;
    if (!packagesEnabled) {
      return null;
    }

    String nodePackage = node.getProperty(PACK);

    if (nodePackage != null && !"".equals(nodePackage)) {
      String[] packages = nodePackage.split("\\.");

      String pack = "";
      PackageNode current = null;
      for (String aPackage : packages) {
        if (pack.length() > 0) {
          pack += ".";
        }
        pack += aPackage;

        if (!myPackageNodes.containsKey(pack)) {
          current = new PackageNode(this, aPackage, current);
          myPackageNodes.put(pack, current);
        }

        current = myPackageNodes.get(pack);
      }

      return current;
    }
    return null;
  }

  void register(SNodeGroupTreeNode parent, SNodeGroupTreeNode groupTreeNode) {
    if (parent == null) {
      int index = -1;
      for (int i = 0; i < myRootGroups.size(); i++) {
        SNodeGroupTreeNode group = myRootGroups.get(i);
        String rp = groupTreeNode.toString();
        String cp = group.toString();
        if (rp.compareTo(cp) < 0) {
          index = i;
          break;
        }
      }
      if (index == -1) {
        index = myRootGroups.size();
      }

      myRootGroups.add(index, groupTreeNode);

      if (myInitialized || myInitializing) {
        DefaultTreeModel treeModel = (DefaultTreeModel) getTree().getModel();
        treeModel.insertNodeInto(groupTreeNode, this, index + myChildModelTreeNodes.size());
      }
    } else {
      int index = -1;
      int groupCount = 0;
      for (int i = 0; i < parent.getChildCount(); i++) {
        if (!(parent.getChildAt(i) instanceof SNodeGroupTreeNode)) {
          break;
        }
        groupCount++;
        SNodeGroupTreeNode group = (SNodeGroupTreeNode) parent.getChildAt(i);
        String rp = groupTreeNode.toString();
        String cp = group.toString();
        if (rp.compareTo(cp) < 0) {
          index = i;
          break;
        }
      }
      if (index == -1) {
        index = groupCount;
      }

      if (myInitialized || myInitializing) {
        DefaultTreeModel treeModel = (DefaultTreeModel) getTree().getModel();
        treeModel.insertNodeInto(groupTreeNode, parent, index);
      } else {
        parent.insert(groupTreeNode, index);
      }
    }
  }

  public void groupBecameEmpty(SNodeGroupTreeNode node) {
    DefaultTreeModel treeModel = (DefaultTreeModel) getTree().getModel();

    myRootGroups.remove(node);

    MPSTreeNode parent = (MPSTreeNode) node.getParent();
    if (node.isAutoDelete()) {
      treeModel.removeNodeFromParent(node);
    }

    if (parent instanceof SNodeGroupTreeNode && parent.getChildCount() == 0) {
      groupBecameEmpty((SNodeGroupTreeNode) parent);
    }

    if (node instanceof PackageNode) {
      myPackageNodes.remove(((PackageNode) node).getPackage());
    }
  }

  public SModel getSModel() {
    return myModelDescriptor.getSModel();
  }

  public SModelDescriptor getSModelDescriptor() {
    return myModelDescriptor;
  }

  @NotNull
  public final SNodeTreeNode createSNodeTreeNode(SNode node, IOperationContext operationContext) {
    return createSNodeTreeNode(node, null, operationContext);
  }

  @NotNull
  public final SNodeTreeNode createSNodeTreeNode(SNode node, IOperationContext operationContext, Condition<SNode> condition) {
    return createSNodeTreeNode(node, null, operationContext, condition);
  }

  @NotNull
  public final SNodeTreeNode createSNodeTreeNode(SNode node, String role, IOperationContext operationContext) {
    return createSNodeTreeNode(node, role, operationContext, Condition.TRUE_CONDITION);
  }

  @NotNull
  public SNodeTreeNode createSNodeTreeNode(SNode node, String role, IOperationContext operationContext, Condition<SNode> condition) {
    return new SNodeTreeNode(node, role, operationContext, condition);
  }

  public ActionGroup getActionGroup() {
    return ActionUtils.getGroup(ProjectPaneActionGroups.PROJECT_PANE_MODEL_ACTIONS);
  }

  public CreateRootNodeGroup getQuickCreateGroup(boolean plain) {
    return new CreateRootNodeGroup(plain);
  }

  @CodeOrchestraPatch
  private String calculateText() {
    SModelReference reference;

    if (getSModelDescriptor() != null) {
      reference = getSModelDescriptor().getSModelReference();
    } else if (getSModel() != null) {
      reference = getSModel().getSModelReference();
    } else {
      return "";
    }

    String name = calculatePresentationText(reference);

    if (reference.getStereotype().length() > 0) {
      name += "@" + reference.getStereotype();
    }


    String result;

    if (myLabel != null) {
      result = myLabel + " : " + name;
    } else {
      result = name;
    }

    // RE-3993
    if (getSModel() instanceof TransientSModel) {
      TransientSModel transientSModel = (TransientSModel) getSModel();
      result += transientSModel.isObsolete() ? " (obsolete)" : " (not obsolete)";
    }

    return InternUtil.intern(result);
  }

  public void setCountAdditionalNamePart(int count) {
    myCountAdditionalNamePart = count;
    updatePresentation();
  }

  public boolean isInitialized() {
    return myInitialized;
  }

  public boolean isSubfolderModel(SModelDescriptor candidate) {
    if (myModelDescriptor == null) return false;
    String modelName = myModelDescriptor.getLongName();
    String candidateName = candidate.getLongName();
    if (candidateName == null || !candidateName.startsWith(modelName) || modelName.equals(candidateName)) return false;
    if (candidateName.charAt(modelName.length()) == '.') {
      String modelStereotype = myModelDescriptor.getStereotype();
      String candidateStereotype = candidate.getStereotype();
      if (!modelStereotype.equals(candidateStereotype)) return false;
      String shortName = candidateName.replace(modelName + ".", "");
      if (shortName.contains(".")) {
        String maxPackage = candidateName.substring(0, candidateName.lastIndexOf('.'));
        SModelDescriptor md = SModelRepository.getInstance().getModelDescriptor(SModelReference.fromString(maxPackage));
        if (md != null) {
          if (md.getModule().getOwnModelDescriptors().contains(myModelDescriptor)) {
            return false;
          }
        }
      }
      return true;
    }
    return false;
  }

  public void addChildModel(SModelTreeNode model) {
    myChildModelTreeNodes.add(model);
  }

  public List<ISModelTreeNode> getSubfolderSModelTreeNodes() {
    List<ISModelTreeNode> isModelTreeNodes = new ArrayList<ISModelTreeNode>();
    isModelTreeNodes.addAll(myChildModelTreeNodes);
    return isModelTreeNodes;
  }

  public List<SModelTreeNode> getAllSubfolderSModelTreeNodes() {
    List<SModelTreeNode> result = new ArrayList<SModelTreeNode>();
    if (myChildModelTreeNodes.isEmpty()) {
      result.add(this);
    } else {
      for (SModelTreeNode treeNode : myChildModelTreeNodes) {
        result.addAll(treeNode.getAllSubfolderSModelTreeNodes());
      }
    }
    return result;
  }

  protected void doUpdate() {
    myInitialized = false;
    this.removeAllChildren();
  }

  protected void doInit() {
    try {
      myInitializing = true;

      removeAllChildren();
      myPackageNodes.clear();
      myRootGroups.clear();

      for (SModelTreeNode newChildModel : myChildModelTreeNodes) {
        DefaultTreeModel treeModel = (DefaultTreeModel) getTree().getModel();
        int index = myChildModelTreeNodes.indexOf(newChildModel);
        treeModel.insertNodeInto(newChildModel, this, index);
      }
      SModel model = getSModel();
      Iterable<SNode> iter = new ConditionalIterable(model.roots(), myNodesCondition);

      List<SNode> filteredRoots = new ArrayList<SNode>();
      for (SNode node : iter) {
        filteredRoots.add(node);
      }
      List<SNode> sortedRoots = SortUtil.sortNodesByPresentation(filteredRoots);
      Comparator<Object> childrenComparator = getTree().getChildrenComparator();
      if (childrenComparator != null) {
        Collections.sort(sortedRoots, childrenComparator);
      }
      for (SNode sortedRoot : sortedRoots) {
        MPSTreeNodeEx treeNode = createSNodeTreeNode(sortedRoot, getOperationContext(), myNodesCondition);
        MPSTreeNode group = getNodeGroupFor(sortedRoot);
        if (group != null) {
          group.add(treeNode);
        } else {
          add(treeNode);
        }
      }

      DefaultTreeModel treeModel = (DefaultTreeModel) getTree().getModel();
      treeModel.nodeStructureChanged(this);
    } finally {
      myInitialized = true;
      myInitializing = false;
    }
  }

  private String calculatePresentationText(SModelReference reference) {
    if (myShowLongName) {
      return reference.getLongName();
    } else if (myCountAdditionalNamePart == 0) {
      return NameUtil.shortNameFromLongName(reference.getLongName());
    }
    StringBuilder stringBuilder = new StringBuilder();
    String[] namePart = reference.getLongName().split("\\.");
    int firstPart = namePart.length - myCountAdditionalNamePart - 1;
    for (int i = firstPart; i < namePart.length - 1; i++) {
      stringBuilder.append(namePart[i]).append('.');
    }
    stringBuilder.append(NameUtil.shortNameFromLongName(reference.getLongName()));
    return stringBuilder.toString();
  }

  protected final boolean canBeOpened() {
    return false;
  }

  public void insertRoots(Set<SNode> addedRoots) {
    if (addedRoots.isEmpty()) return;

    DefaultTreeModel treeModel = (DefaultTreeModel) getTree().getModel();

    final ArrayList<SNode> allRoots = new ArrayList<SNode>();
    for (SNode root1 : getSModel().roots()) {
      allRoots.add(root1);
    }
    Collections.sort(allRoots, new ToStringComparator(true));

    List<SNode> added = new ArrayList<SNode>(addedRoots);
    Collections.sort(added, new Comparator<SNode>() {
      public int compare(SNode o1, SNode o2) {
        return new Integer(allRoots.indexOf(o1)).compareTo(allRoots.indexOf(o2));
      }
    });

    for (SNode root : added) {
      SNodeTreeNode nodeToInsert = new SNodeTreeNode(root, getOperationContext());
      MPSTreeNode targetNode = getNodeGroupFor(root);

      if (targetNode == null) {
        targetNode = SModelTreeNode.this;
      }

      int index = -1;
      for (int i = 0; i < targetNode.getChildCount(); i++) {
        if (!(targetNode.getChildAt(i) instanceof SNodeTreeNode)) {
          continue;
        }
        SNodeTreeNode child = (SNodeTreeNode) targetNode.getChildAt(i);
        String rp = root.toString();
        String cp = child.getSNode().toString();
        if (rp.compareTo(cp) < 0) {
          index = i;
          break;
        }
      }
      if (index == -1) {
        index = targetNode.getChildCount();
      }
      treeModel.insertNodeInto(nodeToInsert, targetNode, index);
    }
  }

  public Object getUserObject() {
    return myModelDescriptor;
  }

}
