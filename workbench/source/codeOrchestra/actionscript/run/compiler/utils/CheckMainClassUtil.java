package codeOrchestra.actionscript.run.compiler.utils;

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SReference;

import java.util.Collection;

public class CheckMainClassUtil {

  private static final String CLASS_CONCEPT = "codeOrchestra.actionScript.structure.ClassConcept";
  public static final String MXML_COMPONENT = "codeOrchestra.mxml.structure.MxmlComponentDeclaration";

  private static final String SUPERCLASS_CHILD = "superclass";
  private static final String CLASSIFIER_ROLE = "reference";

  private static final String SPRITE_CLASS_NAME = "Sprite";

  public static boolean isMainClass(SNode classConcept, Collection<SNode> alreadyFound) {
    if (alreadyFound.contains(classConcept)) {
      return true;
    }

    if (classConcept == null) {
      return false;
    }

    String conceptFqName = classConcept.getConceptFqName();
    if (!(CLASS_CONCEPT.equals(conceptFqName) || MXML_COMPONENT.equals(conceptFqName))) {
      return false;
    }

    SNode superClassClassifierType = classConcept.getChild(SUPERCLASS_CHILD);
    if (superClassClassifierType == null) {
      return false;
    }

    SReference superClassReference = superClassClassifierType.getReference(CLASSIFIER_ROLE);
    if (superClassReference == null) {
      return false;
    }

    SNode superClass = superClassReference.getTargetNode();
    if (superClass == null) {
      return false;
    }

    if (SPRITE_CLASS_NAME.equals(superClass.getName())) {
      return true;
    }

    return isMainClass(superClass);
  }

  public static boolean isMainClass(SNode classConcept) {
    if (classConcept == null) {
      return false;
    }

    String conceptFqName = classConcept.getConceptFqName();
    if (!(CLASS_CONCEPT.equals(conceptFqName) || MXML_COMPONENT.equals(conceptFqName))) {
      return false;
    }

    SNode superClassClassifierType = classConcept.getChild(SUPERCLASS_CHILD);
    if (superClassClassifierType == null) {
      return false;
    }

    SReference superClassReference = superClassClassifierType.getReference(CLASSIFIER_ROLE);
    if (superClassReference == null) {
      return false;
    }

    SNode superClass = superClassReference.getTargetNode();
    if (superClass == null) {
      return false;
    }

    if (SPRITE_CLASS_NAME.equals(superClass.getName())) {
      return true;
    }

    return isMainClass(superClass);
  }

}