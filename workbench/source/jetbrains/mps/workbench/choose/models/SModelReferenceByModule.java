package jetbrains.mps.workbench.choose.models;

import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SModelReference;

/**
 * @author Alexander Eliseyev
 */
public class SModelReferenceByModule {

  private SModelReference modelReference;
  private ModuleReference moduleReference;

  public SModelReferenceByModule(SModelReference modelReference, ModuleReference moduleReference) {
    this.modelReference = modelReference;
    this.moduleReference = moduleReference;
  }

  public SModelReference getModelReference() {
    return modelReference;
  }

  public ModuleReference getModuleReference() {
    return moduleReference;
  }

  public IModule getModule() {
    return MPSModuleRepository.getInstance().getModule(moduleReference);
  }

  @Override
  public String toString() {
    return "SModelReferenceByModule{" +
      "modelReference=" + modelReference +
      ", moduleReference=" + moduleReference +
      '}';
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    SModelReferenceByModule that = (SModelReferenceByModule) o;

    if (modelReference != null ? !modelReference.equals(that.modelReference) : that.modelReference != null)
      return false;
    if (moduleReference != null ? !moduleReference.equals(that.moduleReference) : that.moduleReference != null)
      return false;

    return true;
  }

  @Override
  public int hashCode() {
    int result = modelReference != null ? modelReference.hashCode() : 0;
    result = 31 * result + (moduleReference != null ? moduleReference.hashCode() : 0);
    return result;
  }
}
