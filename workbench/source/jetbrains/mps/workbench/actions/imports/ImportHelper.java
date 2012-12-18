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
package jetbrains.mps.workbench.actions.imports;

import com.intellij.ide.util.gotoByName.ChooseByNamePopup;
import com.intellij.ide.util.gotoByName.ChooseByNamePopupComponent;
import com.intellij.navigation.ItemPresentation;
import com.intellij.navigation.NavigationItem;
import com.intellij.openapi.application.ModalityState;
import com.intellij.openapi.progress.EmptyProgressIndicator;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.wm.WindowManager;
import com.intellij.psi.PsiElement;
import com.intellij.psi.impl.FakePsiElement;
import codeOrchestra.actionscript.view.ASPackageTreeNode;
import codeOrchestra.actionscript.view.ActionScriptViewPane;
import codeOrchestra.actionscript.view.utils.Languages;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import codeOrchestra.utils.EditorUtils;
import jetbrains.mps.ide.EditorUtil;
import jetbrains.mps.ide.projectPane.IProjectPane;
import jetbrains.mps.nodeEditor.EditorSettings;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.Dependency;
import jetbrains.mps.project.structure.modules.ModuleDescriptor;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.Condition;
import jetbrains.mps.util.ConditionalIterable;
import jetbrains.mps.util.IterableUtil;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.actions.goTo.ChooseByNamePopupMPS;
import jetbrains.mps.workbench.actions.goTo.FocusedModuleRootNodeElementSorter;
import jetbrains.mps.workbench.actions.goTo.index.MPSChooseSNodeDescriptor;
import jetbrains.mps.workbench.actions.goTo.index.RootNodeElement;
import jetbrains.mps.workbench.actions.goTo.index.RootNodeNameIndex;
import jetbrains.mps.workbench.actions.goTo.index.descriptor.BaseSNodeDescriptor;
import jetbrains.mps.workbench.choose.base.BaseMPSChooseModel;
import jetbrains.mps.workbench.choose.models.BaseModelByModuleModel;
import jetbrains.mps.workbench.choose.models.BaseModelItem;
import jetbrains.mps.workbench.choose.models.ModelPresentation;
import jetbrains.mps.workbench.choose.models.SModelReferenceByModule;
import jetbrains.mps.workbench.choose.modules.BaseLanguageModel;
import jetbrains.mps.workbench.choose.modules.BaseModuleItem;
import jetbrains.mps.workbench.choose.nodes.BaseNodeItem;
import jetbrains.mps.workbench.choose.nodes.BaseNodeModel;
import org.apache.commons.collections.CollectionUtils;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import javax.swing.JOptionPane;
import java.awt.Frame;
import java.util.*;

public class ImportHelper {
  private static boolean myUseCache = true;

  public static void setUseCache(boolean useCache) {
    myUseCache = useCache;
  }

  @CodeOrchestraPatch
  public static void addLanguageImport(final IModule contextModule, final SModelDescriptor model, ModuleReference languageReference) {
    AddLanguageItem addLanguageItem = new AddLanguageItem(languageReference, contextModule, model);
    addLanguageItem.setAvoidReload(true);
    addLanguageItem.navigate(false);
  }

  public static void addImport(final Project project, IModule module, SModelDescriptor sourceModel, SModelDescriptor targetModel) {
    AddModelItem addModel = new AddModelItem(project, sourceModel, targetModel.getSModelReference(), module);
    addModel.setQuiet(true);
    addModel.navigate(false);
  }

  public static void addImport(final Project project, IModule sourceModule, IModule targetModule, SModelDescriptor sourceModel, SModelDescriptor targetModel) {
    if (targetModule == null) {
      addImport(project, sourceModule, sourceModel, targetModel);
    }

    AddModelByModuleItem addModelByModuleItem = new AddModelByModuleItem(project, sourceModel, targetModel.getSModelReference(), sourceModule, targetModule);
    addModelByModuleItem.setQuiet(true);
    addModelByModuleItem.navigate(false);
  }

  public static void addModelImport(final Project project, final IModule module, final SModelDescriptor model) {
    FakePsiElement fakePsiContext = new FakePsiElement() {
      public PsiElement getParent() {
        return null;
      }
    };

    // RE-1979
    BaseModelByModuleModel goToModelModel = new BaseModelByModuleModel(project) {
      public NavigationItem doGetNavigationItem(SModelReferenceByModule ref) {
        return new AddModelByModuleItem(project, model, ref.getModelReference(), module, ref.getModule());
      }

      public SModelReference[] getUniqueSmodelReferences(IScope scope) {
        IProjectPane projectPane = ViewUtils.getCurrentPane(getProject());
        if (projectPane != null && projectPane.goToOperationsEnabled()) {
          return projectPane.getModelReferences();
        }

        Condition<SModelDescriptor> cond = new Condition<SModelDescriptor>() {
          public boolean met(SModelDescriptor modelDescriptor) {
            boolean rightStereotype = SModelStereotype.isUserModel(modelDescriptor)
              || SModelStereotype.isStubModelStereotype(modelDescriptor.getStereotype());
            boolean hasModule = modelDescriptor.getModule() != null;
            return rightStereotype && hasModule;
          }
        };
        ConditionalIterable<SModelDescriptor> iter = new ConditionalIterable<SModelDescriptor>(scope.getModelDescriptors(), cond);
        List<SModelReference> filteredModelRefs = new ArrayList<SModelReference>();
        for (SModelDescriptor md:iter){
          filteredModelRefs.add(md.getSModelReference());
        }
        return filteredModelRefs.toArray(new SModelReference[filteredModelRefs.size()]);
      }

      @Nullable
      public String getPromptText() {
        return ViewUtils.isInActionScriptView() ? "Import package:" : "Import model:";
      }
    };
    ChooseByNamePopup popup = ChooseByNamePopup.createPopup(project, goToModelModel, fakePsiContext);

    popup.invoke(new ChooseByNamePopupComponent.Callback() {
      public void onClose() {
        //if (GoToRootNodeAction.class.equals(myInAction)) myInAction = null;
      }

      public void elementChosen(final Object element) {
        ((NavigationItem) element).navigate(true);
      }
    }, ModalityState.current(), true);
  }

  public static void addLanguageImport(Project project, final IModule contextModule, final SModelDescriptor model) {
    FakePsiElement fakePsiContext = new FakePsiElement() {
      public PsiElement getParent() {
        return null;
      }
    };

    BaseLanguageModel goToLanguageModel = new BaseLanguageModel(project) {
      public NavigationItem doGetNavigationItem(ModuleReference ref) {
        return new AddLanguageItem(ref, contextModule, model);
      }

      public ModuleReference[] find(IScope scope) {
        ArrayList<ModuleReference> res = new ArrayList<ModuleReference>();

        IProjectPane iProjectPane = ViewUtils.getCurrentPane(getProject());
        if (iProjectPane != null && iProjectPane instanceof ActionScriptViewPane) {
          for (Language l : scope.getVisibleLanguages()) {
            if (isActionScriptLanguage(l)) {
              res.add(l.getModuleReference());
            }
          }
        } else {
          for (Language l : scope.getVisibleLanguages()){
            res.add(l.getModuleReference());
          }
        }

        return res.toArray(new ModuleReference[res.size()]);
      }

      @Nullable
      public String getPromptText() {
        return "Import language:";
      }
    };
    ChooseByNamePopup popup = ChooseByNamePopup.createPopup(project, goToLanguageModel, fakePsiContext);

    popup.invoke(new ChooseByNamePopupComponent.Callback() {
      public void onClose() {
        //if (GoToRootNodeAction.class.equals(myInAction)) myInAction = null;
      }

      public void elementChosen(Object element) {
        ((NavigationItem) element).navigate(true);
      }
    }, ModalityState.current(), true);
  }

  private static boolean isActionScriptLanguage(Language language) {
    return isActionScriptLanguage(language, new HashMap<Language, Boolean>());
  }

  private static boolean isActionScriptLanguage(Language language, Map<Language, Boolean> checkedLanguages) {
    if (Languages.isCodeOrchestraLanguage(language)) {
      checkedLanguages.put(language, Boolean.TRUE);
      return true;
    }

    checkedLanguages.put(language, null);

    for (Language extendedLanguage : language.getExtendedLanguages()) {
      if (checkedLanguages.containsKey(extendedLanguage)) {
        Boolean isAS = checkedLanguages.get(language);
        if (isAS == null) {
          continue;
        }
        return isAS;
      }

      if (isActionScriptLanguage(extendedLanguage, checkedLanguages)) {
        return true;
      }
    }

    checkedLanguages.put(language, Boolean.FALSE);
    return false;
  }

  private static class AddLanguageItem extends BaseModuleItem {
    private IModule myContextModule;
    private SModelDescriptor myModel;

    @CodeOrchestraPatch
    private boolean avoidReload;

    public AddLanguageItem(ModuleReference language, IModule contextModule, SModelDescriptor model) {
      super(language);
      myContextModule = contextModule;
      myModel = model;
    }

    @CodeOrchestraPatch
    public void setAvoidReload(boolean avoidReload) {
      this.avoidReload = avoidReload;
    }

    @CodeOrchestraPatch
    public void navigate(boolean requestFocus) {
      ModelAccess.instance().runWriteActionInCommand(new Runnable() {
        public void run() {
          boolean reloadRequired = false;

          // Language dependency
          ModuleReference ref = getModuleReference();
          if (myContextModule.getScope().getLanguage(ref) == null) {
            myContextModule.addUsedLanguage(ref);
            reloadRequired = true;
          }

          // Language SWC's dependency
          final Language language = MPSModuleRepository.getInstance().getLanguage(ref);
          for (Dependency dependency : language.getDependencies()) {
            if (dependency.getModuleRef().getModuleFqName().toLowerCase().contains("_swc")) {
              myContextModule.addDependency(dependency.getModuleRef(), false);
              reloadRequired = true;
            }
          }

          // Reload if needed
          if (!avoidReload && reloadRequired) { // RE-2577
            ClassLoaderManager.getInstance().reloadAll(new EmptyProgressIndicator());
          }

          // Add language usage
          myModel.getSModel().addLanguage(ref);

          // RE-3542
          // RE-3013
          // Add accessories models from the language imported and all of its super-languages
          Set<Language> languagesToGetAccessories = new HashSet<Language>(language.getAllExtendedLanguages()) {{ add(language); }}; // This is awesome
          Map<SModelDescriptor, ModuleReference> accessoryToOwnerReferencesReference = new HashMap<SModelDescriptor, ModuleReference>();
          for (Language languageToGetAccessories : languagesToGetAccessories) {
            for (SModelDescriptor accessoryModelDescriptor : languageToGetAccessories.getAccessoryModels()) {
              IModule owner = accessoryModelDescriptor.getModule();
              if (owner != null) {
                accessoryToOwnerReferencesReference.put(accessoryModelDescriptor, owner.getModuleReference());
              }
            }
          }
          // Add the accessories imports
          for (SModelDescriptor accessoryDescriptor : accessoryToOwnerReferencesReference.keySet()) {
            myModel.getSModel().addModelImport(accessoryDescriptor.getSModelReference(), false);
          }
          // RE-2874 — add dependencies on the accessory owning languages
          for (ModuleReference accessoryOwnerReference : new HashSet<ModuleReference>(accessoryToOwnerReferencesReference.values())) {
            myContextModule.addDependency(accessoryOwnerReference, false);
          }
        }
      });

      // CO-4701
      EditorUtils.clearNodesBeingEditedOfAutoValidatorObjects();
    }
  }

  public static void addModelImportByRoot(final Project project, final IModule contextModule, final SModelDescriptor model,
                                          String initialText) {
    FakePsiElement fakePsiContext = new FakePsiElement() {
      public PsiElement getParent() {
        return null;
      }
    };

    BaseMPSChooseModel goToNodeModel;

    // RE-2096
    if (!myUseCache && !ViewUtils.isInActionScriptView(project)) {
      goToNodeModel = new BaseNodeModel(project) {
        public NavigationItem doGetNavigationItem(SNode node) {
          return new BaseNodeItem(node) {
            public void navigate(boolean requestFocus) {
              new AddModelByRootItem(project, model, getNode().getModel().getSModelReference(), contextModule, getNode()).navigate(requestFocus); // RE-1979
            }
          };
        }

        public SNode[] find(IScope scope) {
          Condition<SModelDescriptor> cond = new Condition<SModelDescriptor>() {
            public boolean met(SModelDescriptor modelDescriptor) {
              boolean rightStereotype = SModelStereotype.isUserModel(modelDescriptor);
              boolean hasModule = modelDescriptor.getModule() != null;
              return rightStereotype && hasModule;
            }
          };
          ConditionalIterable<SModelDescriptor> iter = new ConditionalIterable<SModelDescriptor>(scope.getModelDescriptors(), cond);

          final List<SNode> nodes = new ArrayList<SNode>();
          for (SModelDescriptor modelDescriptor : iter) {
            SModel model = modelDescriptor.getSModel();
            if (model == null) continue;
            nodes.addAll(IterableUtil.asCollection(model.roots()));
          }
          return nodes.toArray(new SNode[nodes.size()]);
        }

        @Nullable
        public String getPromptText() {
          return ViewUtils.isInActionScriptView() ? "Import package that contains root:" : "Import model that contains root:";
        }
      };
    } else {
      goToNodeModel = new MPSChooseSNodeDescriptor(project, new RootNodeNameIndex()) {
        public NavigationItem doGetNavigationItem(final BaseSNodeDescriptor object) {
          return new RootNodeElement(object) {
            public void navigate(boolean requestFocus) {
              SModelDescriptor descriptor = GlobalScope.getInstance().getModelDescriptor(object.getModelReference());
              SModel modelDescriptor = descriptor.getSModel();
              SNode node = object.getNode(modelDescriptor);
              new AddModelByRootItem(project, model, node.getModel().getSModelReference(), contextModule, node).navigate(requestFocus); // RE-1979
            }
          };
        }

        @Nullable
        public String getPromptText() {
          return ViewUtils.isInActionScriptView() ? "Import package that contains root:" : "Import model that contains root:";
        }
      };
    }
    ChooseByNamePopupMPS popup = ChooseByNamePopupMPS.createPopup(project, goToNodeModel, fakePsiContext,initialText);

    // Perform additional sorting
    popup.setSorter(new FocusedModuleRootNodeElementSorter(contextModule));

    popup.invoke(new ChooseByNamePopupComponent.Callback() {
      public void onClose() {
        //if (GoToRootNodeAction.class.equals(myInAction)) myInAction = null;
      }

      public void elementChosen(final Object element) {
        ModelAccess.instance().runWriteAction(new Runnable() {
          public void run() {
            ((NavigationItem) element).navigate(true);
          }
        });
      }
    }, ModalityState.current(), true);
  }

  @CodeOrchestraPatch
  private static class AddModelByModuleItem extends AddModelItem {
    private ModuleReference targetModuleReference;
    private String moduleName;

    public AddModelByModuleItem(Project project, SModelDescriptor model, SModelReference modelToAdd, IModule currentModule, IModule targetModule) {
      super(project, model, modelToAdd, currentModule);
      this.targetModuleReference = targetModule.getModuleReference();
      this.moduleName = targetModule.toString();
    }

    @Override
    public ItemPresentation getPresentation() {
      return new ModelPresentation(myModelReference) {
        public Icon doGetIcon() {
          if (ViewUtils.isInActionScriptView(myProject)) {
            return ASPackageTreeNode.PACKAGE_ICON;
          }
          return super.doGetIcon();
        }

        @NotNull
        @Override
        public String doGetPresentableText() {
          if (ViewUtils.isInActionScriptView(myProject)) {
            return myModelReference.getLongName() + (myModelReference.hasStereotype() ? " (library)" : "");
          }
          return super.doGetPresentableText();
        }

        public String doGetLocationString() {
          return "(" + moduleName + ")";
        }
      };
    }

    @Override
    protected ModuleReference getModuleToImport() {
      return targetModuleReference;
    }
  }

  @CodeOrchestraPatch
  private static class AddModelByRootItem extends AddModelItem {
    private SNode root;

    public AddModelByRootItem(Project project, SModelDescriptor model, SModelReference modelToAdd, IModule currentModule, SNode root) {
      super(project, model, modelToAdd, currentModule);
      this.root = root;
    }

    @Override
    protected String getModuleImportMessage(ModuleReference moduleToImport) {
      if (ViewUtils.isInActionScriptView() && root != null) {
        String rootName = ModelAccess.instance().runReadAction(new Computable<String>() {
          public String compute() {
            return root.getName();
          }
        });
        return "<html>Root <b>" + rootName + "</b> from package <b>" + getModelReference().getSModelFqName() + "</b> is owned by module <b>" + moduleToImport.getModuleFqName() + "</b> which is not imported.</html>\n\n";
      }
      return super.getModuleImportMessage(moduleToImport);
    }

    @Override
    protected ModuleReference getModuleToImport() {
      // RE-1979
      if (root != null) {
        Set<String> rootSourceModuleUIDs = root.getSourceModuleUIDs();
        if (!rootSourceModuleUIDs.isEmpty()) {
          Set<String> moduleDependenciesUIDs = getModuleDependenciesUIDs(myModule.getModuleDescriptor());

          // If moduleDependenciesUIDs does not contain any of the rootSourceModuleUIDs
          if (!CollectionUtils.containsAny(moduleDependenciesUIDs, rootSourceModuleUIDs)) {
            // Need to import a module
            // Locate a target module by target model & rootSourceModuleUID
            SModelDescriptor targetModelDescriptor = root.getModel().getModelDescriptor();
            IModule ownerByUID = null;
            for (IModule ownerCandidate : SModelRepository.getInstance().getModules(targetModelDescriptor)) {
              if (rootSourceModuleUIDs.contains(ownerCandidate.getModuleDescriptor().getUUID())) {
                ownerByUID = ownerCandidate;
                break;
              }
            }
            if (ownerByUID != null) {
              return ownerByUID.getModuleReference();
            }
          }
        }
      }
      return super.getModuleToImport();
    }
  }

  private static class AddModelItem extends BaseModelItem {
    protected Project myProject;
    protected SModelDescriptor myModel;
    protected IModule myModule;
    protected boolean quiet;

    public AddModelItem(Project project, SModelDescriptor model, SModelReference modelToAdd, IModule currentModule) {
      super(modelToAdd);
      myProject = project;
      myModel = model;
      myModule = currentModule;
    }

    public void setQuiet(boolean quiet) {
      this.quiet = quiet;
    }

    public Frame getFrame() {
      return WindowManager.getInstance().getFrame(myProject);
    }

    protected ModuleReference getModuleToImport() {
      SModelDescriptor md = SModelRepository.getInstance().getModelDescriptor(getModelReference());
      final ModuleReference moduleReference = md.getModule().getModuleReference();
      if (myModule.getScope().getModelDescriptor(getModelReference()) == null) {
        return moduleReference;
      }
      return null;
    }

    protected String getModuleImportMessage(ModuleReference moduleToImport) {
      return "<html>Package <b>" + getModelReference().getSModelFqName() + "</b> is owned by module <b>" + moduleToImport.getModuleFqName() + "</b> which is not imported.</html>\n\n";
    }

    @CodeOrchestraPatch
    public void navigate(boolean requestFocus) {
      // RE-1979
      ModuleReference moduleToImport = ModelAccess.instance().runReadAction(new Computable<ModuleReference>() {
        public ModuleReference compute() {
          return getModuleToImport();
        }
      });
      // Find out it already dependent
      for (Dependency dependency : myModule.getDependOn()) {
        if (dependency.getModuleRef().equals(moduleToImport)) {
          moduleToImport = null;
          break;
        }
      }
      // RF-819 - don't import self
      if (myModule.getModuleReference().equals(moduleToImport)) {
        moduleToImport = null;
      }
      final ModuleReference moduleToImportFinal = moduleToImport;

      if (moduleToImportFinal != null) {
        // Quiet mode
        // RE-3701
        if (quiet || EditorSettings.getInstance().doModuleAutoImport()) {
          ModelAccess.instance().runWriteActionInCommand(new Runnable() {
            public void run() {
              myModule.addDependency(moduleToImportFinal, false);
            }
          });
        } else {
          // RE-1979
          String message1 = getModuleImportMessage(moduleToImportFinal);
          String message2 = "Importing the module will take some time.\nDo you want to automatically import the module?";

          int res = JOptionPane.showConfirmDialog(getFrame(),
            message1 + message2,
            "Module import", JOptionPane.YES_NO_OPTION);
          if (res == JOptionPane.YES_OPTION) {
            ModelAccess.instance().runWriteActionInCommand(new Runnable() {
              public void run() {
                myModule.addDependency(moduleToImportFinal, false);
              }
            });
          }
        }
      }

      ModelAccess.instance().runWriteActionInCommand(new Runnable() {
        public void run() {
          myModel.getSModel().addModelImport(getModelReference(), false);
        }
      });

      EditorUtils.clearNodesBeingEditedOfAutoValidatorObjects();
    }
  }

  public static Set<String> getModuleDependenciesUIDs(ModuleDescriptor moduleDescriptor) {
    Set<String> uids = new HashSet<String>();

    //TODO: recursivly?
    for (Dependency dependency : moduleDescriptor.getDependencies()) {
      ModuleReference dependencyModuleRef = dependency.getModuleRef();
      IModule dependencyModule = MPSModuleRepository.getInstance().getModule(dependencyModuleRef);
      if (dependencyModule != null) {
        uids.add(dependencyModule.getModuleDescriptor().getUUID());
      }
    }

    return uids;
  }

}
