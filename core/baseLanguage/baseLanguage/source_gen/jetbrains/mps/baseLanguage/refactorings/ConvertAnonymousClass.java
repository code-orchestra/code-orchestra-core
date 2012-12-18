package jetbrains.mps.baseLanguage.refactorings;

/*Generated by MPS */

import jetbrains.mps.refactoring.framework.BaseRefactoring;
import jetbrains.mps.lang.core.refactorings.MoveNodes;
import jetbrains.mps.refactoring.framework.IRefactoringTarget;
import jetbrains.mps.refactoring.framework.RefactoringContext;
import jetbrains.mps.refactoring.framework.paramchooser.mps.MPSChooserFactory;
import jetbrains.mps.baseLanguage.util.plugin.refactorings.ConvertAnonymousRefactoring;

public class ConvertAnonymousClass extends BaseRefactoring {
  public ConvertAnonymousClass() {
    this.addTransientParameter("name");
  }

  public String getUserFriendlyName() {
    return "Convert Anonymous to Inner Class";
  }

  public String getKeyStroke() {
    return getKeyStroke_static();
  }

  public Class getOverridenRefactoringClass() {
    return MoveNodes.class;
  }

  public IRefactoringTarget getRefactoringTarget() {
    return new ConvertAnonymousClass_Target();
  }

  public boolean init(final RefactoringContext refactoringContext) {
    return ConvertAnonymousClass.this.ask(refactoringContext, MPSChooserFactory.createStringChooser(refactoringContext, "name", new ConvertAnonymousClass_name_Settings(refactoringContext)));
  }

  public void refactor(final RefactoringContext refactoringContext) {
    new ConvertAnonymousRefactoring(refactoringContext.getSelectedNode(), ((String) refactoringContext.getParameter("name"))).doRefactor();
  }

  public static String getKeyStroke_static() {
    return MoveNodes.getKeyStroke_static();
  }
}
