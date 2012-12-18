package jetbrains.mps.execution.configurations.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.typesystem.inference.TypeChecker;
import org.jetbrains.annotations.Nullable;
import jetbrains.mps.lang.pattern.IMatchingPattern;
import jetbrains.mps.lang.typesystem.runtime.HUtil;
import java.util.Set;
import java.util.HashSet;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class RunConfigurationExecutor_Behavior {
  public static void init(SNode thisNode) {
  }

  public static boolean call_isDebuggable_442015021861764808(SNode thisNode) {
    return (SLinkOperations.getTarget(thisNode, "debuggerConfiguration", true) != null) || (RunConfigurationExecutor_Behavior.call_isSimple_6226796386650421097(thisNode) && SPropertyOperations.getBoolean(thisNode, "canDebug"));
  }

  public static boolean call_canBeSimple_6226796386650277682(SNode thisNode) {
    return TypeChecker.getInstance().getSubtypingManager().isSubtype(TypeChecker.getInstance().getTypeOf(SLinkOperations.getTarget(thisNode, "execute", true)), new RunConfigurationExecutor_Behavior.QuotationClass_wnz9gp_a1a0a0c().createNode());
  }

  public static boolean call_isSimple_6226796386650421097(SNode thisNode) {
    return RunConfigurationExecutor_Behavior.call_canBeSimple_6226796386650277682(thisNode) && (SLinkOperations.getTarget(thisNode, "debuggerConfiguration", true) == null);
  }

  @Nullable
  public static SNode call_getCommand_6226796386650434672(SNode thisNode) {
    {
      IMatchingPattern pattern_wnz9gp_a0d = HUtil.createMatchingPatternByConceptFQName("jetbrains.mps.execution.commands.structure.CommandProcessType");
      SNode coercedNode_wnz9gp_a0d = TypeChecker.getInstance().getRuntimeSupport().coerce_(TypeChecker.getInstance().getTypeOf(SLinkOperations.getTarget(thisNode, "execute", true)), pattern_wnz9gp_a0d);
      if (coercedNode_wnz9gp_a0d != null) {
        if ((SLinkOperations.getTarget(coercedNode_wnz9gp_a0d, "commandDeclaration", false) != null)) {
          return SLinkOperations.getTarget(coercedNode_wnz9gp_a0d, "commandDeclaration", false);
        }
      } else {
      }
    }
    return null;
  }

  public static class QuotationClass_wnz9gp_a1a0a0c {
    public QuotationClass_wnz9gp_a1a0a0c() {
    }

    public SNode createNode() {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.execution.commands.structure.CommandProcessType", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_2 = quotedNode_1;
        result = quotedNode1_2;
      }
      return result;
    }
  }
}
