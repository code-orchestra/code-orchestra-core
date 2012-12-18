package jetbrains.mps.workbench.dialogs.project.components.parts.validators;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.workbench.choose.models.SModelReferenceByModule;

public class ModelByModuleValidator implements Validator {
  private IScope myModuleScope;

  public ModelByModuleValidator(IScope moduleScope) {
    myModuleScope = moduleScope;
  }

  public boolean isBrokenValue(Object value) {
    if (!((value instanceof SModelReferenceByModule))) {
      return true;
    }
    final SModelReferenceByModule modelReferenceByModule = (SModelReferenceByModule) value;
    if (myModuleScope == null) {
      return true;
    }
    return ModelAccess.instance().runReadAction(new Computable<Boolean>() {
      public Boolean compute() {
        return myModuleScope.getModelDescriptor(modelReferenceByModule.getModelReference()) == null;
      }
    });
  }
}
