package jetbrains.mps.vcs.diff.changes;

/*Generated by MPS */

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import jetbrains.mps.smodel.SNodeId;
import jetbrains.mps.smodel.SModel;

public abstract class ModelChange {
  private ChangeSet myChangeSet;
  private ModelChange myOpposite = null;

  protected ModelChange(@NotNull ChangeSet changeSet) {
    myChangeSet = changeSet;
  }

  @NotNull
  public final ChangeSet getChangeSet() {
    return myChangeSet;
  }

  @Nullable
  public SNodeId getRootId() {
    return null;
  }

  public abstract void apply(@NotNull SModel model, @NotNull NodeCopier nodeCopier);

  public ModelChange getOppositeChange() {
    if (myOpposite == null) {
      myOpposite = createOppositeChange();
      myOpposite.myOpposite = this;
    }
    return myOpposite;
  }

  @NotNull
  protected abstract ModelChange createOppositeChange();

  @NotNull
  public abstract ChangeType getType();

  @Override
  public abstract String toString();
}
