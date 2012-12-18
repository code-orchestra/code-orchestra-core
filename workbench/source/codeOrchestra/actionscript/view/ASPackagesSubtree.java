package codeOrchestra.actionscript.view;

import jetbrains.mps.ide.projectPane.SortUtil;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.*;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ASPackagesSubtree {

  public static void create(MPSTreeNode rootTreeNode, IOperationContext operationContext) {
    List<SModelDescriptor> models = new ArrayList<SModelDescriptor>();
    IModule module = operationContext.getModule();
    assert module != null;

    // Collect the models
    for (SModelDescriptor modelDescriptor : module.getOwnModelDescriptors()) {
      // Ignore asset modules
      if (SModelStereotype.getStubStereotypeForId(LanguageID.ASSET)
        .equals(modelDescriptor.getSModelReference().getStereotype())) {
        continue;
      }

      // Ignore internal models
      if (ProjectModels.isProjectModel(modelDescriptor.getSModelReference())) {
        continue;
      }

      models.add(modelDescriptor);
    }

    for (SModelDescriptor md : SortUtil.sortModels(models)) {
      rootTreeNode.add(new ASPackageTreeNode(md, operationContext, module.getModuleDescriptor()));
    }
  }

}
