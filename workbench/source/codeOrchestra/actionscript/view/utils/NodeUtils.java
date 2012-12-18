package codeOrchestra.actionscript.view.utils;

import com.intellij.openapi.project.Project;
import codeOrchestra.actionScript.Concepts;
import jetbrains.mps.internal.collections.runtime.IWhereFilter;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.behaviour.BehaviorManager;
import jetbrains.mps.util.Condition;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public final class NodeUtils {

  private static final Logger LOG = Logger.getLogger(NodeUtils.class);

  public static final String AUTO_VALIDATOR_TIMESTAMP = "AutoValidator.timestamp";

  public static final String HIDDEN_ROOT_CONCEPT = "codeOrchestra.actionScript.structure.IHiddenRoot";
  public static final String HIDDEN_ROOT_METHOD = "virtual_isHiddenRoot_7839223977444713284";
  public static final Class[] HIDDEN_ROOT_PARAMETERS_CLASSES = {SNode.class};

  public static final String DUPLICABLE_CONCEPT = "codeOrchestra.actionScript.structure.IDuplicable";
  public static final String DUPLICATE_METHOD = "call_duplicate_9089970468439153275";
  public static final Class[] DUPLICATE_PARAMETERS_CLASSES = {SNode.class, EditorContext.class};
  public static final String IS_DUPLICABLE_METHOD = "call_isDuplicable_5953506402697394050";
  public static final Class[] IS_DUPLICABLE_PARAMETERS_CLASSES = {SNode.class, EditorContext.class};

  public static final String IBACKSPACE_ASCENSION_BLOCK_CONCEPT = "codeOrchestra.actionScript.structure.IBackspaceAscensionBlock";

  public static final String GET_CUSTOM_DEPENDENCIES_METHOD = "virtual_getCustomDependencies_3830106511237543636";
  public static final Class[] GET_CUSTOM_DEPENDENCIES_CLASSES = {SNode.class};

  public static final String GET_ALL_USED_METHOD = "call_getAllUsed_4509636163359869887";
  public static final Class[] GET_ALL_USED_PARAMETERS_CLASSES = {SNode.class, Project.class};

  public static final String IS_SHOW_AUTO_POPUP_METHOD = "call_isShowAutoPopup_1358850715822328773";
  public static final Class[] IS_SHOW_AUTO_POPUP_CLASSES = {SNode.class};

  public static final String IS_DYNAMIC_METHOD = "call_isDynamic_3037716163915990221";
  public static final Class[] IS_DYNAMIC_CLASSES = {SNode.class};

  public static final String GET_STRUCTURE_LIST_METHOD = "call_getStructureList_8557467791350601788";
  public static final Class[] GET_STRUCTURE_LIST_CLASSES = {SNode.class};

  public static final String BEFORE_INTELIGENT_NODE_MOVE_INTO_METHOD = "call_beforeInteligentNodeMoveInto_7034481412370998401";
  public static final Class[] BEFORE_INTELIGENT_NODE_MOVE_INTO_CLASSES = {SNode.class};

  public static final String CATCH_INSERT_BY_COMMA_LEFT_METHOD = "call_catchInsertByCommaLeft_5655330156189610219";
  public static final Class[] CATCH_INSERT_BY_COMMA_LEFT_METHOD_PARAMETERS_TYPES = new Class[]{SNode.class, SNode.class, EditorContext.class};

  public static final String CATCH_INSERT_BY_COMMA_RIGHT_METHOD = "call_catchInsertByCommaRight_5655330156189653426";
  public static final Class[] CATCH_INSERT_BY_COMMA_RIGHT_METHOD_PARAMETERS_TYPES = new Class[]{SNode.class, SNode.class, EditorContext.class};

  public static void clearAutoValidatorFlags(SNode node) {
    for (SNode descendant : node.getDescendantsIterable(Condition.TRUE_CONDITION, true)) {
      descendant.removeUserObject(AUTO_VALIDATOR_TIMESTAMP);
    }
  }

  public static void catchInsertByCommaLeft(SNode owner, SNode anchor, EditorContext editorContext) {
    assert isCallWithActualArguments(owner);

    try {
      BehaviorManager.getInstance().invoke(Void.class, owner, CATCH_INSERT_BY_COMMA_LEFT_METHOD, CATCH_INSERT_BY_COMMA_LEFT_METHOD_PARAMETERS_TYPES, anchor, editorContext);
    } catch (Throwable t) {
      LOG.error("Can't invoke ICallWithActualArguments.catchInsertByCommaLeft", t);
    }
  }

  public static void catchInsertByCommaRight(SNode owner, SNode anchor, EditorContext editorContext) {
    assert isCallWithActualArguments(owner);

    try {
      BehaviorManager.getInstance().invoke(Void.class, owner, CATCH_INSERT_BY_COMMA_RIGHT_METHOD, CATCH_INSERT_BY_COMMA_RIGHT_METHOD_PARAMETERS_TYPES, anchor, editorContext);
    } catch (Throwable t) {
      LOG.error("Can't invoke ICallWithActualArguments.catchInsertByCommaRight", t);
    }

  }

  public static boolean isCallWithActualArguments(SNode node) {
    return node.isInstanceOfConcept(Concepts.ICALL_WITH_ACTUAL_ARGUMENTS);
  }

  public static boolean hasCustomMoveIntoBehavior(SNode node) {
    return node.isInstanceOfConcept(Concepts.IBEFORE_INTELIGENT_NODE_MOVE_INTO_CONCEPT);
  }

  public static void invokeCustomMoveIntoBehavior(SNode node) {
    assert node.isInstanceOfConcept(Concepts.IBEFORE_INTELIGENT_NODE_MOVE_INTO_CONCEPT);

    try {
      BehaviorManager.getInstance().invoke(Void.class, node, BEFORE_INTELIGENT_NODE_MOVE_INTO_METHOD, BEFORE_INTELIGENT_NODE_MOVE_INTO_CLASSES);
    } catch (Throwable t) {
      LOG.error("Can't invoke IBeforeInteligentNodeMoveInto_Behavior.call_beforeInteligentNodeMoveInto", t);
    }
  }

  public static List<SNode> getStructureList(SNode node) {
    assert node.isInstanceOfConcept(Concepts.ICUSTOM_STRUCTURE_VIEW_CONCEPT);

    try {
      return BehaviorManager.getInstance().invoke(List.class, node, GET_STRUCTURE_LIST_METHOD, GET_STRUCTURE_LIST_CLASSES);
    } catch (Throwable t) {
      LOG.error("Can't invoke ICustomStructureView.getStructureList", t);
      return Collections.emptyList();
    }
  }

  public static boolean shouldShowAutoPopup(SNode node) {
    assert node.isInstanceOfConcept(Concepts.DYNAMIC_ACCESS_OPERATION_CONCEPT);

    try {
      return BehaviorManager.getInstance().invoke(Boolean.class, node, IS_SHOW_AUTO_POPUP_METHOD, IS_SHOW_AUTO_POPUP_CLASSES);
    } catch (Throwable t) {
      LOG.error("Can't invoke DynamicAccessOperation.isShowAutoPopup", t);
      return false;
    }
  }

  public static boolean isDynamicAccess(SNode node) {
    assert node.isInstanceOfConcept(Concepts.IDYNAMIC_ACCESS_CONCEPT);

    try {
      return BehaviorManager.getInstance().invoke(Boolean.class, node, IS_DYNAMIC_METHOD, IS_DYNAMIC_CLASSES);
    } catch (Throwable t) {
      LOG.error("Can't invoke IDynamicAccess.isDynamicAccess", t);
      return false;
    }
  }

  public static List<SNode> getAllUsedNodes(SNode node, Project project) {
    try {
      return BehaviorManager.getInstance().invoke(List.class, node, GET_ALL_USED_METHOD, GET_ALL_USED_PARAMETERS_CLASSES, project);
    } catch (Throwable t) {
      LOG.error("Can't invoke IRoot.getAllUsed", t);
      return Collections.emptyList();
    }
  }

  private static class ReferencesCondition implements Condition<SNode> {
    @Override
    public boolean met(SNode node) {
      return node.isInstanceOfConcept(Concepts.IREFERENCE_CONCEPT) || node.isInstanceOfConcept(Concepts.CLASS_CREATOR_CONCEPT);
    }
  }

  private static class CustomDependenciesCondition implements Condition<SNode> {
    @Override
    public boolean met(SNode node) {
      return node.isInstanceOfConcept(Concepts.ICUSTOM_DEPENDENCIES_CONCEPT);
    }
  }

  private static Set<String> GENERATION_AVOID_ANNOTATIONS = new HashSet<String>() {{
    add("NeverUsed");
    add("API");
  }};
  private static Set<String> GENERATION_FORCE_ANNOTATIONS = new HashSet<String>() {{
    add("AlwaysUsed");
  }};

  private NodeUtils () {
  }

  public static boolean isIRoot(SNode node) {
    return node.isInstanceOfConcept(Concepts.IROOT);
  }

  public static Iterable<SNode> getReferenceNodes(SNode root) {
    return root.getDescendantsIterable(new ReferencesCondition(), false);
  }

  public static Iterable<SNode> getNodesHavingCustomDependencies(SNode root) {
    return root.getDescendantsIterable(new CustomDependenciesCondition(), false);
  }

  public static boolean mustBeUsedInGenerationAnyway(SNode root) {
    if (root.isInstanceOfConcept(Concepts.IALWAYS_USED_CONCEPT)) {
      return true;
    }

    if (SNodeOperations.isInstanceOf(root, Concepts.HAS_ANNOTATION_CONCEPT)) {
      List<SNode> annotations = SLinkOperations.getTargets(root, "annotation", true);
      for (SNode annotationInstance : annotations) {
        String annotationName = SPropertyOperations.getString(SLinkOperations.getTarget(annotationInstance, "annotation", false), "name");
        if (GENERATION_FORCE_ANNOTATIONS.contains(annotationName)) {
          return true;
        }
      }
    }

    return false;
  }

  public static boolean mustBeAvoidedInGeneration(SNode root) {
    if (SNodeOperations.isInstanceOf(root, Concepts.HAS_ANNOTATION_CONCEPT)) {
      List<SNode> annotations = SLinkOperations.getTargets(root, "annotation", true);
      for (SNode annotationInstance : annotations) {
        String annotationName = SPropertyOperations.getString(SLinkOperations.getTarget(annotationInstance, "annotation", false), "name");
        if (GENERATION_AVOID_ANNOTATIONS.contains(annotationName)) {
          return true;
        }
      }
    }
    return false;
  }

  public static boolean isBackspaceAscensionBlocked(SNode node) {
    return node.isInstanceOfConcept(IBACKSPACE_ASCENSION_BLOCK_CONCEPT);
  }

  public static boolean hasCustomDependencies(SNode root) {
    return SNodeOperations.isInstanceOf(root, Concepts.ICUSTOM_DEPENDENCIES_CONCEPT);
  }

  public static List<SNode> getCustomDependencies(SNode root) {
    try {
      return BehaviorManager.getInstance().invoke(List.class, root, GET_CUSTOM_DEPENDENCIES_METHOD, GET_CUSTOM_DEPENDENCIES_CLASSES);
    } catch (Throwable t) {
      return Collections.emptyList();
    }
  }

  public static boolean shouldBeVisible(SNode root) {
    if (root.isInstanceOfConcept(HIDDEN_ROOT_CONCEPT)) {
      try {
        return !BehaviorManager.getInstance().invoke(Boolean.class, root, HIDDEN_ROOT_METHOD, HIDDEN_ROOT_PARAMETERS_CLASSES);
      } catch (Throwable t) {
        return true;
      }
    }
    return true;
  }

  public static SNode findDuplicable(SNode node, final EditorContext editorContext) {
    return ListSequence.fromList(SNodeOperations.getAncestors(node, DUPLICABLE_CONCEPT, true)).findFirst(new IWhereFilter<SNode>() {
      public boolean accept(SNode it) {
        return isDuplicable(it, editorContext);
      }
    });
  }

  public static boolean isDuplicable(SNode duplicable, EditorContext editorContext) {
    try {
      return BehaviorManager.getInstance().invoke(Boolean.class, duplicable, IS_DUPLICABLE_METHOD, IS_DUPLICABLE_PARAMETERS_CLASSES, editorContext);
    } catch (Throwable t) {
      LOG.error("Can't invoke IDuplicable_Behavior.isDuplicable", t);
      return false;
    }
  }

  public static void duplicate(SNode duplicable, EditorContext editorContext) {
    try {
      BehaviorManager.getInstance().invoke(Void.class, duplicable, DUPLICATE_METHOD, DUPLICATE_PARAMETERS_CLASSES, editorContext);
    } catch (Throwable t) {
      LOG.error("Can't invode IDuplicable_Behavior.duplicate", t);
    }
  }

}
