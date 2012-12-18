package jetbrains.mps.smodel.resources;

/*Generated by MPS */

import jetbrains.mps.make.resources.IResource;
import java.util.Map;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.SModelDescriptor;

public interface IFResource extends IResource {
  public String packageName();
  public Map<String, Object> contents();
  public IModule module();
  public SModelDescriptor model();
}
