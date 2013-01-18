package codeOrchestra.actionScript.stubs;

import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodeId.Foreign;
import jetbrains.mps.util.NameUtil;

/**
 * @author Anton.I.Neverov
 */
public final class ASForeignNodeIds {

  private static final String AS_STRUCTURE = "codeOrchestra.actionScript.structure.";

  public static Foreign getMemberNodeId(SNode classifierMember, SNode parent, String memberName) {
    String memberFqName = parent.getName() + "_" + memberName;
    if (SNodeOperations.isInstanceOf(classifierMember, concept("IStaticClassifierMember"))) {
      memberFqName += "_s";
    }

    if (SNodeOperations.isInstanceOf(classifierMember, concept("InstanceGetterDeclaration")) || SNodeOperations.isInstanceOf(classifierMember, concept("StaticGetterDeclaration"))) {
      memberFqName += "_get";
    } else if (SNodeOperations.isInstanceOf(classifierMember, concept("InstanceSetterDeclaration")) || SNodeOperations.isInstanceOf(classifierMember, concept("StaticSetterDeclaration"))) {
      memberFqName += "_set";
    }

    return new Foreign(Foreign.ID_PREFIX + NameUtil.shortNameFromLongName(memberFqName));
  }

  public static Foreign getId(String fqName) {
    return new Foreign(Foreign.ID_PREFIX + NameUtil.shortNameFromLongName(fqName));
  }

  public static Foreign getClassNodeId(String fqName) {
    return new Foreign(Foreign.ID_PREFIX + NameUtil.shortNameFromLongName(fqName));
  }

  public static Foreign getAnnotationNodeId(String fqName) {
    return new Foreign(Foreign.ID_PREFIX + NameUtil.shortNameFromLongName(fqName));
  }

  public static Foreign getAnnotationInstanceNodeId(String name) {
    return new Foreign(Foreign.ID_PREFIX + name + "_meta_inst");
  }

  public static Foreign getAnnotationPropertyNodeId(String fqName, String keyName) {
    return new Foreign(Foreign.ID_PREFIX + NameUtil.shortNameFromLongName(fqName + "_" + keyName));
  }

  public static Foreign getGlobalFunctionNodeId(String fqName) {
    return new Foreign(Foreign.ID_PREFIX + NameUtil.shortNameFromLongName(fqName));
  }

  public static Foreign getGlobalNSNodeId(String fqName) {
    return new Foreign(Foreign.ID_PREFIX + NameUtil.shortNameFromLongName(fqName + "_gns"));
  }

  public static Foreign getNSNodeId(String fqName) {
    return new Foreign(Foreign.ID_PREFIX + NameUtil.shortNameFromLongName(fqName + "_ns"));
  }

  public static Foreign getMethodNodeId(String classFQName, String methodName, boolean isStatic) {
    return new Foreign(Foreign.ID_PREFIX + NameUtil.shortNameFromLongName(classFQName) + "_" + methodName + ((isStatic ?
      "_s" :
      ""
    )));
  }

  public static Foreign getId(SNode node) {
    if (node.isInstanceOfConcept(concept("NamespaceDeclaration"))) {
      if (node.getParent().isInstanceOfConcept("TopLevelNamespace")) {
        return getGlobalNSNodeId(node.getName());
      }
      return getNSNodeId(node.getName());
    } else if (node.isInstanceOfConcept(concept("AnnotationInstance"))) {
      return getAnnotationInstanceNodeId(node.getName());
    } else if (node.isInstanceOfConcept(concept("AnnotationPropertyDeclaration"))) {
      return getAnnotationPropertyNodeId(node.getName(), node.getParent().getName());
    } else if (node.isInstanceOfConcept(concept("IRoot"))) {
      return getId(node.getName());
    } else if (node.isInstanceOfConcept(concept("IClassifierMember"))) {
      // IClassifierMember's parent is always Classifier
      return getMemberNodeId(node, node.getParent(), node.getName());
    } else {
      return getId(node.getName());
    }
  }

  private static String concept(String name) {
    return AS_STRUCTURE + name;
  }
}
