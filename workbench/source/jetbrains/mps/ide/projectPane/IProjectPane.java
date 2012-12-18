package jetbrains.mps.ide.projectPane;

import jetbrains.mps.ide.projectPane.ProjectPane.ComponentCreationListener;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.smodel.NodeEditor;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.workbench.actions.goTo.index.descriptor.BaseSNodeDescriptor;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public interface IProjectPane {

  String getId();

  String getMessageMarker();

  NodeEditor getNodeEditor();

  Object getData(@NonNls String dataId);

  void selectNode(@NotNull final SNode node);

  void selectNode(@NotNull final SNode node, boolean focus);

  MPSTree getTree();

  boolean goToOperationsEnabled();

  BaseSNodeDescriptor[] getNodeDescriptors();

  SModelReference[] getModelReferences();

  SModelReference[] getProjectModelReferences();

  void rebuildTree();

  void selectNextNode(final SNode node);

  // ---

  void selectModel(final SModelDescriptor model);

  void selectModel(final SModelDescriptor model, boolean focus);

  void selectModule(final IModule module);

  void activate();

  // ---

  MPSTreeNode findNextTreeNode(SNode node);

  void selectModule(IModule module, boolean focus);

  void rebuild();

  boolean isShowPropertiesAndReferences();

  List<IModule> getSelectedModules();

  void addComponentCreationListener(ComponentCreationListener componentCreationListener);

  void removeComponentCreationListener(ComponentCreationListener componentCreationListener);
}
