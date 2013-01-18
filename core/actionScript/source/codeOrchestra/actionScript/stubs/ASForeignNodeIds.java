package codeOrchestra.actionScript.stubs;

import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodeId.Foreign;
import jetbrains.mps.util.NameUtil;

/**
 * @author Anton.I.Neverov
 */
public class ASForeignNodeIds {

  public static Foreign getMemberNodeId(SNode classifierMember, SNode parent, String memberName) {
    String memberFqName = parent.getName() + "_" + memberName;
    if (SNodeOperations.isInstanceOf(classifierMember, "codeOrchestra.actionScript.structure.IStaticClassifierMember")) {
      memberFqName += "_s";
    }

    if (SNodeOperations.isInstanceOf(classifierMember, "codeOrchestra.actionScript.structure.InstanceGetterDeclaration") || SNodeOperations.isInstanceOf(classifierMember, "codeOrchestra.actionScript.structure.StaticGetterDeclaration")) {
      memberFqName += "_get";
    } else if (SNodeOperations.isInstanceOf(classifierMember, "codeOrchestra.actionScript.structure.InstanceSetterDeclaration") || SNodeOperations.isInstanceOf(classifierMember, "codeOrchestra.actionScript.structure.StaticSetterDeclaration")) {
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
}
