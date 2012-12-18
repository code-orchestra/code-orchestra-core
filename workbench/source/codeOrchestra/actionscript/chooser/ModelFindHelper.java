package codeOrchestra.actionscript.chooser;

import com.intellij.openapi.project.Project;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import jetbrains.mps.ide.projectPane.IProjectPane;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.ProjectScope;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.workbench.choose.models.SModelReferenceByModule;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public final class ModelFindHelper {

  public static List<SModelReferenceByModule> getEditableProjectModelsByModules(Project project) {
    List<SModelReferenceByModule> result = new ArrayList<SModelReferenceByModule>();

    for (EditableSModelDescriptor editableSModelDescriptor : getEditableProjectModelDescriptors(project)) {
      Set<IModule> owners = SModelRepository.getInstance().getModules(editableSModelDescriptor);
      for (IModule owner : owners) {
        SModelReferenceByModule sModelReferenceByModule
          = new SModelReferenceByModule(editableSModelDescriptor.getSModelReference(), owner.getModuleReference());
        if (!result.contains(sModelReferenceByModule)) {
          result.add(sModelReferenceByModule);
        }
      }
    }

    return result;
  }

  private static List<EditableSModelDescriptor> getEditableProjectModelDescriptors(Project project) {
    List<EditableSModelDescriptor> result = new ArrayList<EditableSModelDescriptor>();

    IProjectPane projectPane = ViewUtils.getCurrentPane(project);
    if (projectPane != null && projectPane.goToOperationsEnabled()) {
      for (SModelReference modelReference : projectPane.getProjectModelReferences()) {
        SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(modelReference);
        if (modelDescriptor != null && modelDescriptor instanceof EditableSModelDescriptor) {
          result.add((EditableSModelDescriptor) modelDescriptor);
        }
      }
    } else {
      ProjectScope projectScope = project.getComponent(ProjectScope.class);
      for (SModelDescriptor sModelDescriptor : projectScope.getModelDescriptors()) {
        if (sModelDescriptor instanceof EditableSModelDescriptor) {
          result.add((EditableSModelDescriptor) sModelDescriptor);
        }
      }
    }

    return result;
  }

}
