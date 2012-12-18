package jetbrains.mps.smodel.resources;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.tuples.runtime.MultiTuple;
import jetbrains.mps.make.delta.IDelta;
import jetbrains.mps.make.resources.IResource;
import jetbrains.mps.baseLanguage.tuples.runtime.Tuples;

public class DResource extends MultiTuple._1<Iterable<IDelta>> implements IResource, IDeltaResource {
  public DResource() {
    super();
  }

  public DResource(Iterable<IDelta> delta) {
    super(delta);
  }

  public Iterable<IDelta> delta(Iterable<IDelta> value) {
    return super._0(value);
  }

  public Iterable<IDelta> delta() {
    return super._0();
  }

  @SuppressWarnings(value = "unchecked")
  public DResource assignFrom(Tuples._1<Iterable<IDelta>> from) {
    return (DResource) super.assign(from);
  }

  public String describe() {
    return null;
  }
}
