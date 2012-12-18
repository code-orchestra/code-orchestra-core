package jetbrains.mps.bash.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class FunctionCallCommand extends AbstractCommand {
  public static final String concept = "jetbrains.mps.bash.structure.FunctionCallCommand";
  public static final String FUNCTION = "function";
  public static final String PARAMS = "params";

  public FunctionCallCommand(SNode node) {
    super(node);
  }

  public FunctionDeclaration getFunction() {
    return (FunctionDeclaration) this.getReferent(FunctionDeclaration.class, FunctionCallCommand.FUNCTION);
  }

  public void setFunction(FunctionDeclaration node) {
    super.setReferent(FunctionCallCommand.FUNCTION, node);
  }

  public WordList getParams() {
    return (WordList) this.getChild(WordList.class, FunctionCallCommand.PARAMS);
  }

  public void setParams(WordList node) {
    super.setChild(FunctionCallCommand.PARAMS, node);
  }

  public static FunctionCallCommand newInstance(SModel sm, boolean init) {
    return (FunctionCallCommand) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.bash.structure.FunctionCallCommand", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static FunctionCallCommand newInstance(SModel sm) {
    return FunctionCallCommand.newInstance(sm, false);
  }
}
