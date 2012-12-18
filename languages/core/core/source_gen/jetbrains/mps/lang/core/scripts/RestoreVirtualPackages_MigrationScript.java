package jetbrains.mps.lang.core.scripts;

/*Generated by MPS */

import jetbrains.mps.lang.script.runtime.BaseMigrationScript;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.lang.script.runtime.AbstractMigrationRefactoring;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;

public class RestoreVirtualPackages_MigrationScript extends BaseMigrationScript {
  public RestoreVirtualPackages_MigrationScript(IOperationContext operationContext) {
    super("Restore Virtual Packages");
    this.addRefactoring(new AbstractMigrationRefactoring(operationContext) {
      public String getName() {
        return "Restore Virtual Packages";
      }

      public String getAdditionalInfo() {
        return "Restore Virtual Packages";
      }

      public String getFqNameOfConceptToSearchInstances() {
        return "jetbrains.mps.lang.core.structure.BaseConcept";
      }

      public boolean isApplicableInstanceNode(SNode node) {
        return node.getProperty("package") != null;
      }

      public void doUpdateInstanceNode(SNode node) {
        String pack = node.getProperty("package");
        node.setProperty("package", null);
        SPropertyOperations.set(node, "virtualPackage", pack);
      }

      public boolean isShowAsIntention() {
        return true;
      }
    });
  }
}
