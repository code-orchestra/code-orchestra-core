package jetbrains.mps.lang.plugin.scripts;

/*Generated by MPS */

import jetbrains.mps.lang.script.runtime.BaseMigrationScript;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.lang.script.runtime.AbstractMigrationRefactoring;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SModelOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.internal.collections.runtime.IWhereFilter;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import java.util.Set;
import java.util.HashSet;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.lang.typesystem.runtime.HUtil;

public class MoveKeyStrokesToKeymaps_MigrationScript extends BaseMigrationScript {
  public MoveKeyStrokesToKeymaps_MigrationScript(IOperationContext operationContext) {
    super("Move Key Strokes to Keymaps");
    this.addRefactoring(new AbstractMigrationRefactoring(operationContext) {
      public String getName() {
        return "Move Key Strokes to Keymaps";
      }

      public String getAdditionalInfo() {
        return "Move Key Strokes to Keymaps";
      }

      public String getFqNameOfConceptToSearchInstances() {
        return "jetbrains.mps.lang.plugin.structure.ActionDeclaration";
      }

      public boolean isApplicableInstanceNode(SNode node) {
        return (SLinkOperations.getTarget(node, "keystroke", true) != null);
      }

      public void doUpdateInstanceNode(SNode node) {
        SNode keymap = ListSequence.fromList(SModelOperations.getRoots(SNodeOperations.getModel(node), "jetbrains.mps.lang.plugin.structure.KeymapChangesDeclaration")).where(new IWhereFilter<SNode>() {
          public boolean accept(SNode it) {
            return SPropertyOperations.hasValue(it, "keymap", "$default", "$default");
          }
        }).first();
        if (keymap == null) {
          keymap = SModelOperations.createNewRootNode(SNodeOperations.getModel(node), "jetbrains.mps.lang.plugin.structure.KeymapChangesDeclaration", null);
          SPropertyOperations.set(keymap, "keymap", "$default");
          SPropertyOperations.set(keymap, "name", "Default");
        }

        ListSequence.fromList(SLinkOperations.getTargets(keymap, "shortcutChange", true)).addElement(new MoveKeyStrokesToKeymaps_MigrationScript.QuotationClass_guynmc_a0a0d0e0a0a0b0a().createNode(SLinkOperations.getTarget(node, "keystroke", true), node));
        SNodeOperations.deleteNode(SLinkOperations.getTarget(node, "keystroke", true));
      }

      public boolean isShowAsIntention() {
        return false;
      }
    });
  }

  public static class QuotationClass_guynmc_a0a0d0e0a0a0b0a {
    public QuotationClass_guynmc_a0a0d0e0a0a0b0a() {
    }

    public SNode createNode(Object parameter_5, Object parameter_6) {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      SNode quotedNode_2 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.plugin.structure.SimpleShortcutChange", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_3 = quotedNode_1;
        quotedNode1_3.setReferent("action", (SNode) parameter_6);
        {
          quotedNode_2 = (SNode) parameter_5;
          SNode quotedNode1_4;
          if (_parameterValues_129834374.contains(quotedNode_2)) {
            quotedNode1_4 = HUtil.copyIfNecessary(quotedNode_2);
          } else {
            _parameterValues_129834374.add(quotedNode_2);
            quotedNode1_4 = quotedNode_2;
          }
          if (quotedNode1_4 != null) {
            quotedNode_1.addChild("keystroke", HUtil.copyIfNecessary(quotedNode1_4));
          }
        }
        result = quotedNode1_3;
      }
      return result;
    }
  }
}
