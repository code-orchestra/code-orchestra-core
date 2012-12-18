package codeOrchestra.actionscript.hierarchy;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.hierarchy.AbstractHierarchyTree;
import jetbrains.mps.ide.hierarchy.AbstractHierarchyView;
import jetbrains.mps.ide.hierarchy.CircularHierarchyException;
import jetbrains.mps.ide.hierarchy.IconContainer;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.SNode;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ASLanguageHierarchyViewTool extends AbstractHierarchyView {

  public ASLanguageHierarchyViewTool(Project project) {
    super(project, "Class Hierarchy", -1, IconContainer.ICON_d0a0);
  }

  protected AbstractHierarchyTree createHierarchyTree(boolean isParentHierarchy) {
    return new ASLanguageHierarchyViewTool.ASLanguageHierarchyTree(this, "codeOrchestra.actionScript.structure.Classifier", isParentHierarchy);
  }

  public static class ASLanguageHierarchyTree extends AbstractHierarchyTree {

    public ASLanguageHierarchyTree(AbstractHierarchyView view, String aClass, boolean isParentHierarchy) {
      super(view, aClass, isParentHierarchy);
    }

    @Override
    protected Set<SNode> getParents(SNode classifier, Set<SNode> visited) throws CircularHierarchyException {
      Set<SNode> result = new HashSet<SNode>();

      if (SNodeOperations.isInstanceOf(classifier, "codeOrchestra.actionScript.structure.ClassConcept")) {
        SNode clazz = SNodeOperations.cast(classifier, "codeOrchestra.actionScript.structure.ClassConcept");
        if ((SLinkOperations.getTarget(clazz, "superclass", true) != null) && (SLinkOperations.getTarget(SLinkOperations.getTarget(clazz, "superclass", true), "reference", false) != null)) {
          SNode superClassifier = SLinkOperations.getTarget(SLinkOperations.getTarget(clazz, "superclass", true), "reference", false);
          result.add(superClassifier);
        }
        for (SNode interfaceClassifier : ListSequence.fromList(SLinkOperations.getTargets(clazz, "implementedInterface", true))) {
          if ((SLinkOperations.getTarget(interfaceClassifier, "reference", false) != null)) {
            SNode interfaceSuperclass = SLinkOperations.getTarget(interfaceClassifier, "reference", false);
            result.add(interfaceSuperclass);
          }
        }
      } else {
        SNode clazz = SNodeOperations.cast(classifier, "codeOrchestra.actionScript.structure.Interface");
        for (SNode extendedInterfaceClassifier : ListSequence.fromList(SLinkOperations.getTargets(clazz, "extendedInterface", true))) {
          if ((SLinkOperations.getTarget(extendedInterfaceClassifier, "reference", false) != null)) {
            SNode extendedInterface = SLinkOperations.getTarget(extendedInterfaceClassifier, "reference", false);
            result.add(extendedInterface);
          }
        }
      }

      return result;
    }

    @Override
    protected Set<SNode> getDescendants(SNode classifier, Set<SNode> visited) throws CircularHierarchyException {
      Set<SNode> result = new HashSet<SNode>();

      ASDerivedClassifiersFinder derivedClassifiersFinder = ASDerivedClassifiersFinder.getInstance();
      List<SNode> derivedClassifiers = derivedClassifiersFinder.getDerivedClassifiers(classifier, GlobalScope.getInstance(), myOperationContext.getProject());
      result.addAll(derivedClassifiers);

      return result;
    }

    @Override
    protected SNode getParent(SNode classifier) {
      // RE-2956
      if (myHierarchyNode == classifier) {
        return null;
      }

      if (SNodeOperations.isInstanceOf(classifier, "codeOrchestra.actionScript.structure.ClassConcept")) {
        SNode clazz = SNodeOperations.cast(classifier, "codeOrchestra.actionScript.structure.ClassConcept");
        if ((SLinkOperations.getTarget(clazz, "superclass", true) != null) && (SLinkOperations.getTarget(SLinkOperations.getTarget(clazz, "superclass", true), "reference", false) != null)) {
          SNode superClassifier = SLinkOperations.getTarget(SLinkOperations.getTarget(clazz, "superclass", true), "reference", false);
          return superClassifier;
        }
      }
      return null;
    }

    protected String noNodeString() {
      return "(no classifier)";
    }
  }
}
