package codeOrchestra.actionScript.typeSystem;

import codeOrchestra.actionScript.Concepts;
import jetbrains.mps.smodel.SNode;

/**
 * @author Alexander Eliseyev
 */
public final class TypeUtils {

  public static boolean isATypeToHideFromSmartComplete(SNode type) {
    if (type == null) {
      return true;
    }

    return type.isInstanceOfConcept(Concepts.WILD_CARD_TYPE) ||
      type.isInstanceOfConcept(Concepts.NULL_TYPE);
  }

}
