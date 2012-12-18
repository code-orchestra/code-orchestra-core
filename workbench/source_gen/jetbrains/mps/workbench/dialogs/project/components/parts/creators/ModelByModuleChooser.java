package jetbrains.mps.workbench.dialogs.project.components.parts.creators;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import codeOrchestra.actionscript.view.ActionScriptViewPane;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import jetbrains.mps.ide.projectPane.IProjectPane;
import jetbrains.mps.internal.collections.runtime.ISelector;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.workbench.choose.models.SModelReferenceByModule;
import jetbrains.mps.workbench.dialogs.choosers.CommonChoosers;
import jetbrains.mps.workbench.dialogs.project.IBindedDialog;

import java.util.ArrayList;
import java.util.List;

public class ModelByModuleChooser implements Computable<List<SModelReferenceByModule>> {
  private final IBindedDialog myOwner;
  private Project project;

  public ModelByModuleChooser(IBindedDialog owner, Project project) {
    myOwner = owner;
    this.project = project;
  }

  public List<SModelReferenceByModule> compute() {
    List<SModelReferenceByModule> models = ModelAccess.instance().runReadAction(new Computable<List<SModelReferenceByModule>>() {
      public List<SModelReferenceByModule> compute() {
        List<SModelReferenceByModule> refs = new ArrayList<SModelReferenceByModule>();

        List<SModelDescriptor> availableModels = null;
        if (ViewUtils.isInActionScriptView()) {
          availableModels = new ArrayList<SModelDescriptor>();

          IProjectPane iProjectPane = ViewUtils.getCurrentPane(project);
          if (iProjectPane != null && iProjectPane instanceof ActionScriptViewPane) {
            for (SModelReference modelReference : iProjectPane.getModelReferences()) {
              SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(modelReference);
              if (!availableModels.contains(modelDescriptor)) {
                availableModels.add(modelDescriptor);
              }
            }
          }
        } else {
          availableModels = GlobalScope.getInstance().getModelDescriptors();
        }

        for (SModelDescriptor descriptor : availableModels) {
          for (IModule owner : SModelRepository.getInstance().getModules(descriptor)) {
            if (owner instanceof Solution) {
              refs.add(new SModelReferenceByModule(descriptor.getSModelReference(), owner.getModuleReference()));
            }
          }
        }

        return refs;
      }
    });

    return CommonChoosers.showDialogModelByModuleCollectionChooser(myOwner.getMainComponent(), models, null);
  }
}
