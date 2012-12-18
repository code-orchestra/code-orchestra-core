package jetbrains.mps.baseLanguage.util.plugin.refactorings;

/*Generated by MPS */

import java.util.List;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.baseLanguage.closures.runtime.Wrappers;
import java.util.ArrayList;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.progress.Task;
import org.jetbrains.annotations.NotNull;
import com.intellij.openapi.progress.ProgressIndicator;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.ide.findusages.model.SearchResults;
import jetbrains.mps.ide.findusages.view.FindUtils;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.ide.findusages.model.SearchResult;
import jetbrains.mps.internal.collections.runtime.ListSequence;

public class MethodRefactoringUtils {
  public MethodRefactoringUtils() {
  }

  public static List<SNode> findOverridingMethods(final SNode method, IOperationContext operationContext) {
    final Wrappers._T<List<SNode>> results = new Wrappers._T<List<SNode>>(new ArrayList<SNode>());
    ProgressManager.getInstance().run(new Task.Modal(operationContext.getProject(), "Search for overriding methods", true) {
      public void run(@NotNull final ProgressIndicator indicator) {
        ModelAccess.instance().runReadAction(new Runnable() {
          public void run() {
            results.value = MethodRefactoringUtils.findOverridingMethods(method, indicator);
          }
        });
      }
    });
    return results.value;
  }

  public static List<SNode> findOverridingMethods(SNode method, ProgressIndicator progressIndicator) {
    List<SNode> results = new ArrayList<SNode>();
    if (SNodeOperations.isInstanceOf(method, "jetbrains.mps.baseLanguage.structure.InstanceMethodDeclaration")) {
      if (SPropertyOperations.getBoolean(method, "isFinal") || SNodeOperations.isInstanceOf(SLinkOperations.getTarget(SNodeOperations.cast(method, "jetbrains.mps.baseLanguage.structure.InstanceMethodDeclaration"), "visibility", true), "jetbrains.mps.baseLanguage.structure.PrivateVisibility")) {
        return results;
      }
      SearchResults<SNode> searchResults;
      if (SNodeOperations.isInstanceOf(SNodeOperations.getParent(method), "jetbrains.mps.baseLanguage.structure.Interface")) {
        searchResults = FindUtils.getSearchResults(progressIndicator, method, GlobalScope.getInstance(), "jetbrains.mps.baseLanguage.findUsages.InterfaceMethodImplementations_Finder");
      } else {
        searchResults = FindUtils.getSearchResults(progressIndicator, method, GlobalScope.getInstance(), "jetbrains.mps.baseLanguage.findUsages.OverridingMethods_Finder");
      }

      for (SearchResult<SNode> result : ListSequence.fromList(searchResults.getSearchResults())) {
        ListSequence.fromList(results).addElement(SNodeOperations.cast(result.getObject(), "jetbrains.mps.baseLanguage.structure.BaseMethodDeclaration"));
      }
    }
    if (SNodeOperations.isInstanceOf(method, "jetbrains.mps.lang.behavior.structure.ConceptMethodDeclaration")) {
      SearchResults<SNode> searchResults = FindUtils.getSearchResults(progressIndicator, method, GlobalScope.getInstance(), "jetbrains.mps.lang.behavior.findUsages.OverridingMethods_Finder");
      for (SearchResult<SNode> result : ListSequence.fromList(searchResults.getSearchResults())) {
        ListSequence.fromList(results).addElement(SNodeOperations.cast(result.getObject(), "jetbrains.mps.baseLanguage.structure.BaseMethodDeclaration"));
      }
    }
    return results;
  }

  public static SearchResults findMethodUsages(SNode method, ProgressIndicator progressIndicator) {
    return FindUtils.getSearchResults(progressIndicator, method, GlobalScope.getInstance(), "jetbrains.mps.baseLanguage.findUsages.ExactMethodUsages_Finder");
  }
}
