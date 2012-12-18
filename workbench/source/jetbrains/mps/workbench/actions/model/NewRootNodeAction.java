package jetbrains.mps.workbench.actions.model;

import com.intellij.ide.FileEditorProvider;
import com.intellij.ide.SelectInContext;
import com.intellij.ide.SelectInTarget;
import com.intellij.ide.projectView.ProjectView;
import com.intellij.ide.projectView.impl.AbstractProjectViewPane;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.vfs.VirtualFile;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.ide.projectPane.IProjectPane;
import jetbrains.mps.ide.projectPane.ProjectPane;
import jetbrains.mps.ide.ui.smodel.SModelTreeNode;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.action.NodeFactoryManager;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.smodel.presentation.NodePresentationUtil;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.action.BaseAction;
import jetbrains.mps.workbench.editors.MPSEditorOpener;
import jetbrains.mps.workbench.nodesFs.MPSNodesVirtualFileSystem;
import org.apache.commons.lang.StringUtils;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import java.util.Map;

public class NewRootNodeAction extends BaseAction {

  private PackageProvider myPackageProvider;
  private Project myProject;
  private IScope myScope;
  public IOperationContext myContext;
  private SNodePointer myNodeConcept;
  private SModelDescriptor myModelDescriptor;

  @CodeOrchestraPatch
  private IModule module;

  public NewRootNodeAction(SNodePointer nodeConcept, String text) {
    this(nodeConcept,
      null,
      null,
      text
    );
  }

  public NewRootNodeAction(final SNodePointer nodeConcept, SModelDescriptor modelDescriptor, PackageProvider packageProvider) {
    this(nodeConcept, modelDescriptor, packageProvider, StringUtils.capitalize(NodePresentationUtil.matchingText(nodeConcept.getNode())));
  }

  public NewRootNodeAction(final SNodePointer nodeConcept, SModelDescriptor modelDescriptor, PackageProvider packageProvider, String text) {
    super(text);
    myPackageProvider = packageProvider;
    myNodeConcept = nodeConcept;
    myModelDescriptor = modelDescriptor;
    Icon icon = ModelAccess.instance().runReadAction(new Computable<Icon>() {
      public Icon compute() {
        return IconManager.getIconForConceptFQName(NameUtil.nodeFQName(nodeConcept.getNode()));
      }
    });
    getTemplatePresentation().setIcon(icon);
    setExecuteOutsideCommand(true);
  }

  @Override
  protected boolean isEnabledInASView() {
    return true;
  }

  @CodeOrchestraPatch
  protected boolean collectActionData(AnActionEvent e, Map<String, Object> _params) {
    if (!super.collectActionData(e, _params)) return false;
    myProject = MPSDataKeys.PROJECT.getData(e.getDataContext());
    if (myProject == null) {
      return false;
    }

    // RE-1979
    module = MPSDataKeys.MODULE.getData(e.getDataContext());

    myScope = MPSDataKeys.SCOPE.getData(e.getDataContext());
    if (myScope == null) return false;

    myContext = MPSDataKeys.OPERATION_CONTEXT.getData(e.getDataContext());
    if (myContext == null) return false;

    myModelDescriptor = e.getData(MPSDataKeys.CONTEXT_MODEL);
    if (myModelDescriptor == null) {
      return false;
    }

    if (!(myModelDescriptor instanceof EditableSModelDescriptor)) {
      return false;
    }

    return true;
  }

  @CodeOrchestraPatch
  protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
    final SNode node = ModelAccess.instance().runWriteActionInCommand(new Computable<SNode>() {
      public SNode compute() {
        SNode result = NodeFactoryManager.createNode(myNodeConcept.getNode(), null, null, myModelDescriptor.getSModel(), myScope);

        if (myPackageProvider != null) {
          result.setProperty(SModelTreeNode.PACK, myPackageProvider.getPackage());
        }

        // RE-1979
        if (module != null) {
          result.addSourceModuleUID(module.getModuleDescriptor().getUUID());
        }

        myModelDescriptor.getSModel().addRoot(result);
        return result;
      }
    });

    if (!trySelectInCurrentPane(node)) {
      IProjectPane pane = ProjectPane.getInstance(myProject);
      pane.activate();
      pane.selectNode(node);
    }

    myProject.getComponent(MPSEditorOpener.class).editNode(node, myContext);
  }

  private boolean trySelectInCurrentPane(final SNode node) {
    final ProjectView projectView = ProjectView.getInstance(myProject);

    AbstractProjectViewPane selectedPane = projectView.getCurrentProjectViewPane();
    if (selectedPane == null) return false;

    SelectInTarget target = selectedPane.createSelectInTarget();
    if (target == null) return false;

    SNodePointer pointer = ModelAccess.instance().runReadAction(new Computable<SNodePointer>() {
      public SNodePointer compute() {
        return new SNodePointer(node);
      }
    });
    MySelectInContext context = new MySelectInContext(pointer);
    if (!target.canSelect(context)) return false;

    target.selectIn(context, false);
    return true;
  }

  private class MySelectInContext implements SelectInContext {
    private final SNodePointer myNode;

    public MySelectInContext(SNodePointer node) {
      myNode = node;
    }

    @NotNull
    public Project getProject() {
      return myProject;
    }

    @NotNull
    public VirtualFile getVirtualFile() {
      return MPSNodesVirtualFileSystem.getInstance().getFileFor(myNode);
    }

    public Object getSelectorInFile() {
      return null;
    }

    public FileEditorProvider getFileEditorProvider() {
      return null;
    }
  }
}