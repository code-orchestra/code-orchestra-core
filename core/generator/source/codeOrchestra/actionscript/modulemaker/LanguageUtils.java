package codeOrchestra.actionscript.modulemaker;

import jetbrains.mps.smodel.Language;
import org.jetbrains.annotations.Nullable;

/**
 * @author Alexander Eliseyev
 */
public final class LanguageUtils {

  private static final String ACTION_SCRIPT_UUID = "2d3d83fe-bb56-4c31-a57c-6d0c98bc04ce";

  private LanguageUtils() {
  }

  public static boolean isExtendingActionScript(@Nullable Language language) {
    if (language == null) {
      return false;
    }

    // Check the language itself for being an actionScript
    if (isActionScriptLanguage(language)) {
      return true;
    }

    // Check it's extended languages
    for (Language extendedLang : language.getAllExtendedLanguages()) {
      if (isActionScriptLanguage(extendedLang)) {
        return true;
      }
    }

    return false;
  }

  private static boolean isActionScriptLanguage(Language language) {
    return ACTION_SCRIPT_UUID.equals(language.getUUID());
  }

}
