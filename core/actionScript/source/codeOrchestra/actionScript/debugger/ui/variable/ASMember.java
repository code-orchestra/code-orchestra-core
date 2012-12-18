package codeOrchestra.actionScript.debugger.ui.variable;

import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;
import codeOrchestra.actionScript.debugger.ui.ASStackFrame;
import codeOrchestra.actionScript.debugger.ui.ASWatchablesCategory;
import flash.tools.debugger.Variable;
import jetbrains.mps.debug.api.programState.WatchablesCategory;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.internal.collections.runtime.IWhereFilter;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.behaviour.BehaviorManager;

import javax.swing.Icon;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander ELiseyev
 */
public class ASMember extends ASVariable {

  private ASVariable parent;

  public ASMember(FDBEventsProcessor eventsProcessor, Variable variable, ASStackFrame stackFrame, ASVariable parent) {
    super(eventsProcessor, variable, stackFrame);
    this.parent = parent;
  }

  @Override
  public WatchablesCategory getCategory() {
    return ASWatchablesCategory.MEMBER;
  }

  private SNode getParentClassifier() {
    SNode parentNode = parent.getNode();
    if (parentNode == null) {
      return null;
    }

    SNode classConcept = null;
    if (SNodeOperations.isInstanceOf(parentNode, "codeOrchestra.actionScript.structure.ClassConcept")) {
      classConcept = parentNode;
    } else if (SNodeOperations.isInstanceOf(parentNode, "codeOrchestra.actionScript.structure.VariableDeclaration")) {
      SNode typeNode = SLinkOperations.getTarget(parentNode, "type", true);
      if (SNodeOperations.isInstanceOf(typeNode, "codeOrchestra.actionScript.structure.ClassifierType")) {
        SNode classifier = SLinkOperations.getTarget(typeNode, "reference", false);
        if (classifier != null && SNodeOperations.isInstanceOf(classifier, "codeOrchestra.actionScript.structure.ClassConcept")) {
          classConcept = classifier;
        }
      }
    }

    return classConcept;
  }
  
  @Override
  public SNode getNode() {
    final String varName = getName();
    
    SNode classConcept = getParentClassifier();
    if (classConcept == null) {
      return null;
    }

    List<SNode> classHierarchy = new ArrayList<SNode>();
    classHierarchy.add(classConcept);
    classHierarchy.addAll(BehaviorManager.getInstance().invoke(List.class, classConcept, "call_getAllSuperclasses_1122735728268118511", new Class[]{ SNode.class }));

    for (SNode clazz : classHierarchy) {
      // Try field
      SNode field = ListSequence.fromList(SLinkOperations.getTargets(clazz, "field", true)).findFirst(new IWhereFilter<SNode>() {
        public boolean accept(SNode it) {
          return varName.equals(SPropertyOperations.getString(it, "name"));
        }
      });
      if (field != null) {
        return field;
      }

      // Try getter
      SNode getter = ListSequence.fromList(SLinkOperations.getTargets(clazz, "method", true)).findFirst(new IWhereFilter<SNode>() {
        public boolean accept(SNode it) {
          return SNodeOperations.isInstanceOf(it, "codeOrchestra.actionScript.structure.InstanceGetterDeclaration") && varName.equals(SPropertyOperations.getString(it, "name"));
        }
      });
      if (getter != null) {
        return getter;
      }
    }

    return null;
  }

  @Override
  public Icon getPresentationIcon() {
    SNode memberNode = getNode();
    if (memberNode == null) {
      return super.getPresentationIcon();
    }

    return IconManager.getIconFor(memberNode);
  }
}
