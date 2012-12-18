package codeOrchestra.actionscript.chooser;

import com.intellij.navigation.NavigationItem;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.psi.search.GlobalSearchScope;
import com.intellij.util.indexing.FileBasedIndex;
import com.intellij.util.indexing.ID;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import jetbrains.mps.ide.projectPane.IProjectPane;
import jetbrains.mps.ide.vfs.VirtualFileUtils;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.constraints.ModelConstraintsManager;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.workbench.actions.goTo.index.*;
import jetbrains.mps.workbench.actions.goTo.index.descriptor.BaseSNodeDescriptor;
import jetbrains.mps.workbench.actions.goTo.index.descriptor.SNodeDescriptor;
import jetbrains.mps.workbench.choose.base.BaseMPSChooseModel;
import jetbrains.mps.workbench.editors.MPSEditorOpener;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public class ASClassChooser extends BaseMPSChooseModel<BaseSNodeDescriptor> {

  public static final String CLASS_CONCEPT = "codeOrchestra.actionScript.structure.ClassConcept";
  public static final String MXML_COMPONENT = "codeOrchestra.mxml.structure.MxmlComponentDeclaration";

  public BaseSNodeDescriptorIndex myIndex;

  public ASClassChooser(Project project, BaseSNodeDescriptorIndex index) {
    super(project, "node");
    this.myIndex = index;
  }

  public BaseSNodeDescriptor[] find(final IScope scope) {
    IProjectPane projectPane = ViewUtils.getCurrentPane(getProject());
    if (projectPane != null && projectPane.goToOperationsEnabled()) {
      BaseSNodeDescriptor[] nodeDescriptors = projectPane.getNodeDescriptors();
      List<BaseSNodeDescriptor> filteredNodeDescriptors = new ArrayList<BaseSNodeDescriptor>();

      for (BaseSNodeDescriptor sNodeDescriptor : nodeDescriptors) {
        if (isApplicable(sNodeDescriptor)) {
          filteredNodeDescriptors.add(sNodeDescriptor);
        }
      }

      return filteredNodeDescriptors.toArray(new BaseSNodeDescriptor[filteredNodeDescriptors.size()]);
    }


    final Set<BaseSNodeDescriptor> keys = new HashSet<BaseSNodeDescriptor>();

    final ID<Integer, List<BaseSNodeDescriptor>> indexName = myIndex.getName();
    final ModelConstraintsManager cm = ModelConstraintsManager.getInstance();
    final FileBasedIndex fileBasedIndex = FileBasedIndex.getInstance();

    Set<SModelDescriptor> findDirectly = new HashSet<SModelDescriptor>();

    for (SModelDescriptor sm : scope.getModelDescriptors()) {
      if (!SModelStereotype.isUserModel(sm)) continue;

      if (sm.getLoadingState() == ModelLoadingState.FULLY_LOADED) {
        findDirectly.add(sm);
        continue;
      }

      if (!(sm instanceof EditableSModelDescriptor)) continue;
      EditableSModelDescriptor esm = (EditableSModelDescriptor) sm;
      IFile modelFile = esm.getModelFile();
      if (modelFile == null) continue;
      VirtualFile vf = VirtualFileUtils.getVirtualFile(modelFile);
      if (vf == null) continue; // e.g. model was deleted

      int fileId = FileBasedIndex.getFileId(vf);

      List<List<BaseSNodeDescriptor>> descriptors = fileBasedIndex.getValues(indexName, fileId, GlobalSearchScope.fileScope(getProject(), vf));

      if (!descriptors.isEmpty()) {
        boolean needToLoad = false;
        for (BaseSNodeDescriptor snd : descriptors.get(0)) {
          if (cm.hasGetter(snd.getConceptFqName(), SNodeUtil.property_INamedConcept_name)) {
            needToLoad = true;
            break;
          }
        }

        if (needToLoad) {
          findDirectly.add(sm);
        } else {
          keys.addAll(descriptors.get(0));
        }
      }
    }

    for (SModelDescriptor sm : findDirectly) {
      for (SNode root : myIndex.getRootsToIterate(sm.getSModel())) {
        String nodeName = (root.getName() == null) ? "null" : root.getName();
        BaseSNodeDescriptor nodeDescriptor = SNodeDescriptor.fromModelReference(
          nodeName, root.getConceptFqName(), root.getModel().getSModelReference(), root.getSNodeId());
        keys.add(nodeDescriptor);
      }
    }

    //java stubs
    for (IModule m : scope.getVisibleModules()) {
      keys.addAll(StubsNodeDescriptorsCache.getInstance().getSNodeDescriptors(m));
    }

    final Set<BaseSNodeDescriptor> applicableKeys = new HashSet<BaseSNodeDescriptor>();
    for (BaseSNodeDescriptor key : keys) {
      if(isApplicable(key)) {
        applicableKeys.add(key);
      }
    }
    return applicableKeys.toArray(new SNodeDescriptor[applicableKeys.size()]);
  }

  protected boolean isApplicable(SNode sNode) {
    return CLASS_CONCEPT.equals(sNode.getConceptFqName());
  }

  protected boolean isApplicable(BaseSNodeDescriptor sNodeDescriptor) {
    return CLASS_CONCEPT.equals(sNodeDescriptor.getConceptFqName());
  }

  public NavigationItem doGetNavigationItem(final BaseSNodeDescriptor object) {
    return new RootNodeElement(object) {
      private Project myProject = getProject();

      public void navigate(boolean requestFocus) {
        ModelAccess.instance().runReadAction(new Runnable() {
          public void run() {
            SModelDescriptor descriptor = GlobalScope.getInstance().getModelDescriptor(object.getModelReference());
            SModel model = descriptor.getSModel();
            SNode node = object.getNode(model);
            myProject.getComponent(MPSEditorOpener.class).openNode(node);
          }
        });
      }
    };
  }

  public String doGetObjectName(BaseSNodeDescriptor object) {
    return object.getNodeName();
  }

  public String doGetFullName(Object element) {
    SNodeDescriptorPresentation presentation = (SNodeDescriptorPresentation) ((NavigationItem) element).getPresentation();
    assert presentation != null;
    return presentation.getModelName() + "." + presentation.getPresentableText();
  }

  protected String doGetCheckBoxName() {
    return "Include non-project models";
  }

  public static BaseSNodeDescriptor[] find(IScope scope, Project project) {
    MPSChooseSNodeDescriptor chooseSNodeResult = new MPSChooseSNodeDescriptor(project, new RootNodeNameIndex());
    return chooseSNodeResult.find(scope);
  }

}