package codeOrchestra.actionScript.stubs;

import jetbrains.mps.lang.smodel.generator.smodelAdapter.IAttributeDescriptor.LinkAttribute;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.SNodeId.Foreign;
import jetbrains.mps.util.NameUtil;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

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

  public static SNode findNode(Foreign nodeId, SModelReference targetModelReference) {
    SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(targetModelReference);
    if (modelDescriptor == null) {
      return null;
    }
    SModel model = modelDescriptor.getSModel();

    String idString = nodeId.getId();
    if (!idString.startsWith(Foreign.ID_PREFIX)) {
      throw new RuntimeException("Foreign id does not start with Foreign.ID_PREFIX");
    }

    idString = idString.substring(Foreign.ID_PREFIX.length());
    String[] parts = idString.split("_");

    if (parts.length == 1) {
      // Classifier, global function, etc
      return findRoot(model, parts[0]);
    } else {
      // Global namespace or simple member
      SNode root = findRoot(model, parts[0]);
      if (root == null) {
        return null;
      }
      if (parts[1].equals("gns") && parts.length == 2) {
        return root;
      }
      List<SNode> members = findMembers(root, parts[1]);
      if (members.size() == 0) {
        return null;
      }
      for (SNode member : members) {
        if (nodeId.equals(getId(member))) {
          return member;
        }
      }
    }

    return null;
  }

  private static SNode findRoot(SModel model, String name) {
    for (SNode root : model.roots()) {
      if (name.equals(root.getName())) {
        return root;
      }
    }
    return null;
  }

  private static List<SNode> findMembers(final SNode root, String name) {
    List<SNode> children = new ArrayList<SNode>() {{ addAll(root.getChildren()); }};
    Iterator<SNode> iterator = children.iterator();
    while (iterator.hasNext()) {
      if (!name.equals(iterator.next().getName())) {
        iterator.remove();
      }
    }
    return children;
  }

  private static String concept(String name) {
    return AS_STRUCTURE + name;
  }
}
