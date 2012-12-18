package jetbrains.mps.workbench.actions.goTo;

import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.workbench.actions.goTo.ChooseByNameBaseMPS.Sorter;
import jetbrains.mps.workbench.actions.goTo.index.RootNodeElement;

import java.util.LinkedHashSet;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public class FocusedModuleRootNodeElementSorter implements Sorter {
  private IModule module;

  public FocusedModuleRootNodeElementSorter(IModule module) {
    this.module = module;
  }

  public FocusedModuleRootNodeElementSorter(IOperationContext operationContext) {
    if (operationContext != null) {
      this.module = operationContext.getModule();
    }
  }

  public void doAdditionalSort(LinkedHashSet<Object> objects) {
    if (module == null) {
      return;
    }

    LinkedHashSet<Object> currentModuleNodes = new LinkedHashSet<Object>();
    LinkedHashSet<Object> anotherModuleNodes = new LinkedHashSet<Object>();

    for (Object rootObject : objects) {
      if (!(rootObject instanceof RootNodeElement)) {
        anotherModuleNodes.add(rootObject);
        continue;
      }

      RootNodeElement rootNodeElement = (RootNodeElement) rootObject;
      SModelReference rootModelReference = rootNodeElement.getModel();
      if (rootModelReference == null) {
        anotherModuleNodes.add(rootNodeElement);
        continue;
      }

      SModelDescriptor rootModel = SModelRepository.getInstance().getModelDescriptor(rootModelReference);
      if (rootModel == null) {
        anotherModuleNodes.add(rootNodeElement);
        continue;
      }

      Set<IModule> iModuleSet = rootModel.getModules();
      if (iModuleSet == null || !iModuleSet.contains(module)) {
        anotherModuleNodes.add(rootNodeElement);
        continue;
      }

      currentModuleNodes.add(rootNodeElement);
    }

    objects.clear();

    objects.addAll(currentModuleNodes);
    objects.addAll(anotherModuleNodes);
  }
}