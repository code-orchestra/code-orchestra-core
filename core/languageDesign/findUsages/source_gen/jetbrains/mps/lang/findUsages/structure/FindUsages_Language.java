package jetbrains.mps.lang.findUsages.structure;

/*Generated by MPS */

import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.MPSModuleRepository;

public class FindUsages_Language {
  public static ModuleReference MODULE_REFERENCE = ModuleReference.fromString("64d34fcd-ad02-4e73-aff8-a581124c2e30(jetbrains.mps.lang.findUsages)");

  public static Language get() {
    return (Language) MPSModuleRepository.getInstance().getModule(MODULE_REFERENCE);
  }
}
