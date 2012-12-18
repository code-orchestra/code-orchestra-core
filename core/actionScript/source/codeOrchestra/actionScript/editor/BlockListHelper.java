package codeOrchestra.actionScript.editor;

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodeUtil;
import jetbrains.mps.smodel.behaviour.BehaviorManager;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;

import java.util.Collections;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public final class BlockListHelper {

  private static Class[] GET_LIST_ELEMENTS_PARAMS_CLASSES = {SNode.class};

  private static final String IBLOCK_LIST_BEHAVIOR_CONCEPT = "codeOrchestra.actionScript.structure.IBlockListBehavior";
  private static final String GET_LIST_ELEMENTS_METHOD = "virtual_getListElements_2527627527858648354";

  private BlockListHelper() {
  }

  public static SNode findTopMostNodeWithSingularContainment(SNode childNode) {
    while (
      childNode.getParent() != null
        &&
        (
          SNodeUtil.getLinkDeclaration_IsSingular(childNode.getRoleLink())
            ||
            BlockListHelper.isBlockListAndHasLessThanTwoElements(childNode.getParent())
        )
      )
    {
      childNode = childNode.getParent();
    }
    return childNode;
  }

  public static boolean isBlockListConcept(SNode node) {
    return node.isInstanceOfConcept(IBLOCK_LIST_BEHAVIOR_CONCEPT);
  }

  public static boolean isBlockListAndHasLessThanTwoElements(@NotNull SNode node) {
    if (!isBlockListConcept(node)) {
      return false;
    }
    return getListElements(node).size() < 2;
  }

  private static List<SNode> getListElements(SNode node) {
    List list = BehaviorManager.getInstance().invoke(List.class, node, GET_LIST_ELEMENTS_METHOD, GET_LIST_ELEMENTS_PARAMS_CLASSES);
    if (list == null) {
      return Collections.EMPTY_LIST;
    }
    return list;
  }

}
