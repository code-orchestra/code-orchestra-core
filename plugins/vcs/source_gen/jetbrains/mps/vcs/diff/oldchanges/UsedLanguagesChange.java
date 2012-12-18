package jetbrains.mps.vcs.diff.oldchanges;

/*Generated by MPS */

import jetbrains.mps.project.structure.modules.ModuleReference;
import org.jetbrains.annotations.NotNull;
import jetbrains.mps.smodel.SNodeId;
import jetbrains.mps.smodel.SModel;

@Deprecated
public class UsedLanguagesChange extends OldChange {
  private final boolean myIsDeleted;
  private final ModuleReference myReference;

  @Deprecated
  public UsedLanguagesChange(@NotNull ModuleReference reference, boolean isDeleted) {
    myIsDeleted = isDeleted;
    myReference = reference;
  }

  public SNodeId getAffectedNodeId() {
    return null;
  }

  @Override
  public String toString() {
    String format;
    if (myIsDeleted) {
      format = "delete used language %s (%s)";
    } else {
      format = "add used language %s (%s)";
    }
    return String.format(format, myReference.getModuleFqName(), myReference.getModuleId().toString());
  }

  public boolean apply(SModel m) {
    if (myIsDeleted) {
      m.deleteLanguage(myReference);
    } else {
      m.addLanguage(myReference);
    }
    return true;
  }

  @Override
  public OldChangeType getChangeType() {
    return (myIsDeleted ?
      OldChangeType.DELETE :
      OldChangeType.ADD
    );
  }

  public boolean isOppositeTo(UsedLanguagesChange that) {
    return this.myReference.equals(that.myReference) && this.myIsDeleted != that.myIsDeleted;
  }
}
