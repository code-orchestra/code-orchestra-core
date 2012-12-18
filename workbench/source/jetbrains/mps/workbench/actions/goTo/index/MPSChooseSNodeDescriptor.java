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
package jetbrains.mps.workbench.actions.goTo.index;

import com.intellij.ide.DataManager;
import com.intellij.navigation.NavigationItem;
import com.intellij.openapi.actionSystem.AnAction;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.DefaultActionGroup;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.ui.popup.JBPopupFactory;
import com.intellij.openapi.ui.popup.JBPopupFactory.ActionSelectionAid;
import com.intellij.openapi.ui.popup.ListPopup;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.psi.search.GlobalSearchScope;
import com.intellij.util.indexing.FileBasedIndex;
import com.intellij.util.indexing.ID;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import codeOrchestra.environment.view.EnvironmentLibraryManager;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.ide.projectPane.IProjectPane;
import jetbrains.mps.ide.vfs.VirtualFileUtils;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.constraints.ModelConstraintsManager;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.workbench.actions.goTo.index.descriptor.BaseSNodeDescriptor;
import jetbrains.mps.workbench.actions.goTo.index.descriptor.SNodeDescriptor;
import jetbrains.mps.workbench.choose.base.BaseMPSChooseModel;
import jetbrains.mps.workbench.editors.MPSEditorOpener;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class MPSChooseSNodeDescriptor extends BaseMPSChooseModel<BaseSNodeDescriptor> {

  public BaseSNodeDescriptorIndex myIndex;

  @CodeOrchestraPatch
  private IOperationContext operationContext;

  public MPSChooseSNodeDescriptor(Project project, BaseSNodeDescriptorIndex index) {
    super(project, "node");
    myIndex = index;
  }

  public BaseSNodeDescriptor[] find(final IScope scope) {
    IProjectPane projectPane = ViewUtils.getCurrentPane(getProject());
    if (projectPane != null && projectPane.goToOperationsEnabled()) {
      return projectPane.getNodeDescriptors();
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
      if (descriptors.isEmpty()) continue;

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

    return keys.toArray(new BaseSNodeDescriptor[keys.size()]);
  }

  @CodeOrchestraPatch
  public void setOperationContext(IOperationContext operationContext) {
    this.operationContext = operationContext;
  }

  @CodeOrchestraPatch
  public NavigationItem doGetNavigationItem(final BaseSNodeDescriptor object) {
    return new RootNodeElement(object) {
      private Project myProject = getProject();

      public void navigate(boolean requestFocus) {
        ModelAccess.instance().runReadAction(new Runnable() {
          public void run() {
            // 1 - get the operation context here
            // 2 - if we have the module in the context, try to figure out the output type

            SModelDescriptor descriptor = GlobalScope.getInstance().getModelDescriptor(object.getModelReference());
            if (descriptor == null) {
              LOG.error("Can't find model descriptor for: " + object.getModelReference());
              return;
            }

            SModel model = descriptor.getSModel();
            SNode node = object.getNode(model);
            if (node == null) {
              LOG.error("Can't find node for: " + object.getId());
              return;
            }

            EnvironmentLibraryManager environmentLibraryManager = getProject().getComponent(EnvironmentLibraryManager.class);

            // Check if we can redirect the navigation to the implementation
            if (operationContext != null && operationContext.getModule() != null) {
              node = environmentLibraryManager.getRedirector().redirect(getProject(), node, operationContext.getModule());
            } else {
              List<SNode> allEnvironmentsImplementations = environmentLibraryManager.getRedirector().getAllEnvironmentsImplementations(node);
              if (allEnvironmentsImplementations.size() > 1) {
                DefaultActionGroup group = new DefaultActionGroup();

                for (final SNode envImplementation : allEnvironmentsImplementations) {
                  group.add(new AnAction(envImplementation.getName()) {
                    @Override
                    public void update(final AnActionEvent e) {
                      super.update(e);
                      e.getPresentation().setIcon(IconManager.getIconFor(envImplementation));

                      ModelAccess.instance().tryRead(new Runnable() {
                        @Override
                        public void run() {
                          e.getPresentation().setText(envImplementation.getName() + " (" + SolutionUtils.getModulePresentation((Solution) envImplementation.getSourceModule()) + ")");
                        }
                      });
                    }

                    @Override
                    public void actionPerformed(AnActionEvent e) {
                      myProject.getComponent(MPSEditorOpener.class).openNode(envImplementation);
                    }
                  });
                }

                ListPopup createActionGroupPopup = JBPopupFactory.getInstance().createActionGroupPopup("Choose the Node to Navigate to", group, DataManager.getInstance().getDataContext(), ActionSelectionAid.ALPHA_NUMBERING, false);
                createActionGroupPopup.showCenteredInCurrentWindow(getProject());
                return;
              }
            }

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
    return "Include &non-&&project models";
  }
}
