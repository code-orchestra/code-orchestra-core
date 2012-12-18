package codeOrchestra.utils;

import jetbrains.mps.project.structure.modules.ModuleReference;
import org.apache.commons.lang.ObjectUtils;

import java.util.Collection;

/**
 * @author Alexander Eliseyev
 */
public final class ModuleReferenceUtils {

  public static boolean checkContainsByFQName(Collection<ModuleReference> references, ModuleReference targetReference) {
    if (references == null || references.isEmpty()) {
      return false;
    }

    for (ModuleReference reference : references) {
      if (ObjectUtils.equals(reference.getModuleFqName(), targetReference.getModuleFqName())) {
        return true;
      }
    }

    return false;
  }

}
