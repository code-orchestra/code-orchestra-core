package jetbrains.mps.samples.matrixLanguage.structure;

/*Generated by MPS */

import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.MPSModuleRepository;

public class MatrixLanguage_Language {
  public static ModuleReference MODULE_REFERENCE = ModuleReference.fromString("aeb98137-c8ec-4c86-a51b-f00c080e4652(jetbrains.mps.samples.matrixLanguage)");

  public static Language get() {
    return (Language) MPSModuleRepository.getInstance().getModule(MODULE_REFERENCE);
  }
}
