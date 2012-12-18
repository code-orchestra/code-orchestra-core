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

import jetbrains.mps.generator.TransientModelsModule.TransientSModelDescriptor;
import jetbrains.mps.ide.StereotypeProvider;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectLanguageTreeNode;
import jetbrains.mps.ide.projectPane.logicalview.nodes.TransientModelsTreeNode;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.ide.ui.smodel.SModelTreeNode;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.SModelRoot;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.NameUtil;

import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.MutableTreeNode;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;

public class SModelsSubtree {
  public static void create(MPSTreeNode rootTreeNode, IOperationContext operationContext) {
    IModule module = operationContext.getModule();
    assert module != null;
    create(rootTreeNode, operationContext, module.getOwnModelDescriptors(), false);
  }

  public static void create(MPSTreeNode rootTreeNode, IOperationContext operationContext, List<SModelDescriptor> models, boolean dropMiddleNodes) {
    List<SModelDescriptor> regularModels = new ArrayList<SModelDescriptor>();
    List<SModelDescriptor> tests = new ArrayList<SModelDescriptor>();
    List<SModelDescriptor> stubs = new ArrayList<SModelDescriptor>();

    for (SModelDescriptor modelDescriptor : models) {
      if (ProjectModels.isProjectModel(modelDescriptor.getSModelReference())) continue;

      String stereotype = modelDescriptor.getStereotype();

      if (stereotype == null || stereotype.length() == 0) {
        stereotype = ".";
      }

      if (SModelStereotype.isStubModelStereotype(stereotype)) {
        stubs.add(modelDescriptor);
      } else if (SModelStereotype.TESTS.equals(stereotype)) {
        tests.add(modelDescriptor);
      } else {
        regularModels.add(modelDescriptor);
      }
    }

    List<SModelTreeNode> regularModelNodes = getRootModelTreeNodes(regularModels, operationContext, isNeedBuildChildModels(rootTreeNode));
    if (!regularModelNodes.isEmpty()) {
      if (rootTreeNode instanceof jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectSolutionTreeNode) {
        SModelNamespaceTreeBuilder builder = new SModelNamespaceTreeBuilder();
        for (SModelTreeNode treeNode : regularModelNodes) {
          builder.addNode(treeNode);
        }
        builder.fillNode(rootTreeNode);
      } else {
        MPSTreeNode currentRootNode;
        if (!isNeedBuildChildModels(rootTreeNode)) {
          currentRootNode = rootTreeNode;
        } else {
          IModule contextModule = operationContext.getModule();
          List<SModelRoot> modelRoots = contextModule.getSModelRoots();
          String namespace = (modelRoots.isEmpty()) ? "" : contextModule.getSModelRoots().get(0).getPrefix();
          if (namespace == null || namespace.length() == 0) {
            namespace = contextModule.getModuleFqName();
          }
          currentRootNode = new NamespaceTextNode((namespace == null) ? "" : namespace, operationContext);
        }
        for (SModelTreeNode treeNode : regularModelNodes) {
          currentRootNode.add(treeNode);
        }
        if (!currentRootNode.equals(rootTreeNode)) {
          rootTreeNode.add(currentRootNode);
        }
      }
    }

    if (!tests.isEmpty()) {
      SModelNamespaceTreeBuilder builder = new SModelNamespaceTreeBuilder();

      List<SModelTreeNode> testNodes = getRootModelTreeNodes(tests, operationContext, isNeedBuildChildModels(rootTreeNode));
      for (SModelTreeNode testNode : testNodes) {
        builder.addNode(testNode);
      }

      TestsTreeNode testsNode = new TestsTreeNode(operationContext);
      builder.fillNode(testsNode);

      if (!dropMiddleNodes){
        rootTreeNode.add(testsNode);
      }else{
        Enumeration children = testsNode.children();
        while (children.hasMoreElements()){
          rootTreeNode.add((MutableTreeNode) children.nextElement());
        }
      }
    }

    if (!stubs.isEmpty()) {
      SModelNamespaceTreeBuilder builder = new SModelNamespaceTreeBuilder();
      List<SModelTreeNode> stubNodes = getRootModelTreeNodes(stubs, operationContext, isNeedBuildChildModels(rootTreeNode));
      for (SModelTreeNode treeNode : stubNodes) {
        builder.addNode(treeNode);
      }

      StubsTreeNode stubsNode = new StubsTreeNode(operationContext);
      builder.fillNode(stubsNode);

      if (!dropMiddleNodes){
        rootTreeNode.add(stubsNode);
      }else{
        Enumeration children = stubsNode.children();
        while (children.hasMoreElements()){
          rootTreeNode.add((MutableTreeNode) children.nextElement());
        }
      }
    }
  }

  private static List<SModelTreeNode> getRootModelTreeNodes(List<SModelDescriptor> models, IOperationContext context, boolean isNeedBuildChildModels) {
    List<SModelTreeNode> result = new ArrayList<SModelTreeNode>();
    List<SModelDescriptor> sortedModels = SortUtil.sortModels(models);
    if (!sortedModels.isEmpty()) {
      int rootIndex = 0;
      while (rootIndex < sortedModels.size()) {
        SModelDescriptor rootModelDescriptor = sortedModels.get(rootIndex);
        int countNamePart = getCountNamePart(rootModelDescriptor, NameUtil.namespaceFromLongName(rootModelDescriptor.getSModelReference().getLongName()));
        SModelTreeNode treeNode = new SModelTreeNode(sortedModels.get(rootIndex), null, context, countNamePart);
        result.add(treeNode);
        rootIndex = (isNeedBuildChildModels) ? buildChildModels(treeNode, sortedModels, rootIndex) : rootIndex + 1;
      }
    }
    return result;
  }

  private static boolean isNeedBuildChildModels(MPSTreeNode rootTreeNode) {
    return !(rootTreeNode instanceof ProjectLanguageTreeNode || rootTreeNode instanceof TransientModelsTreeNode);
  }

  private static int buildChildModels(SModelTreeNode treeNode, List<SModelDescriptor> candidates, int rootIndex) {
    int index = rootIndex + 1;
    while (index < candidates.size()) {
      SModelDescriptor candidate = (SModelDescriptor) candidates.get(index);
      if (treeNode.isSubfolderModel(candidate)) {
        IOperationContext context = treeNode.getOperationContext();
        int countNamePart = getCountNamePart(candidate, treeNode.getSModelDescriptor().getLongName());
        SModelTreeNode newChildModel = new SModelTreeNode(candidate, null, context, countNamePart);
        treeNode.addChildModel(newChildModel);
        index = buildChildModels(newChildModel, candidates, index);
      } else {
        return index;
      }
    }
    return index;
  }

  public static int getCountNamePart(SModelDescriptor md, String baseName) {
    String modelLongName = md.getLongName();
    String shortName = md instanceof TransientSModelDescriptor ? modelLongName : modelLongName.replace(baseName + '.', "");
    return shortName.split("\\.").length - 1;
  }

  public static class StubsTreeNode extends TextTreeNode implements StereotypeProvider {
    public StubsTreeNode(IOperationContext context) {
      super("stubs", context);

      setIcon(Icons.PROJECT_MODELS_ICON, false);
      setIcon(Icons.PROJECT_MODELS_EXPANDED_ICON, true);
    }

    public String getStereotype() {
      return SModelStereotype.getStubStereotypeForId(LanguageID.JAVA);
    }

    public boolean isStrict() {
      return true;
    }
  }

  public static class TestsTreeNode extends TextTreeNode implements StereotypeProvider {
    public TestsTreeNode(IOperationContext context) {
      super("tests", context);

      setIcon(Icons.PROJECT_MODELS_ICON, false);
      setIcon(Icons.PROJECT_MODELS_EXPANDED_ICON, true);
    }

    public String getStereotype() {
      return SModelStereotype.TESTS;
    }

    public boolean isStrict() {
      return true;
    }
  }
}
