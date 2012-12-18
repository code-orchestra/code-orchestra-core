package codeOrchestra.actionScript.id;

import jetbrains.mps.smodel.SNodeId;
import jetbrains.mps.util.NameUtil;
import java.util.List;
import java.util.Iterator;

public class ASMNodeId {
  public ASMNodeId() {
  }

  public static SNodeId createId(String fqClassName) {
    return new SNodeId.Foreign(SNodeId.Foreign.ID_PREFIX + NameUtil.shortNameFromLongName(fqClassName));
  }

  public static SNodeId createFieldId(String fqClassName, String fieldName) {
    return new SNodeId.Foreign(SNodeId.Foreign.ID_PREFIX + NameUtil.shortNameFromLongName(fqClassName) + "." + fieldName);
  }

  public static SNodeId createAnnotationMethodId(String fqClassName, String methodName) {
    StringBuilder sb = new StringBuilder();
    sb.append(NameUtil.shortNameFromLongName(fqClassName));
    sb.append('.');
    sb.append(methodName);
    sb.append("()");
    return new SNodeId.Foreign(SNodeId.Foreign.ID_PREFIX + sb.toString());
  }

  private static String shortNameFromSlashedLongName(String slashedLongName) {
    int offset = slashedLongName.lastIndexOf('/');
    if (offset < 0) {
      return slashedLongName;
    }
    return slashedLongName.substring(offset + 1);
  }

}
