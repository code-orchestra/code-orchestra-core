package jetbrains.mps.baseLanguage.money.structure;

/*Generated by MPS */

import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.MPSModuleRepository;

public class Money_Language {
  public static ModuleReference MODULE_REFERENCE = ModuleReference.fromString("f43135f9-b833-4685-8d26-ffb6c8215f72(jetbrains.mps.baseLanguage.money)");

  public static Language get() {
    return (Language) MPSModuleRepository.getInstance().getModule(MODULE_REFERENCE);
  }
}
