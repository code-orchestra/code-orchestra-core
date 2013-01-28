package codeOrchestra.actionScript.scope;

import codeOrchestra.actionscript.modulemaker.LanguageUtils;
import jetbrains.mps.project.DevKit;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.Language;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
abstract class ActionScriptLanguageScope extends ActionScriptScope {

  @Override
  public Language getLanguage(ModuleReference moduleReference) {
     Language language = super.getLanguage(moduleReference);

    // Don't return the language if it doesn't extend the AS language
    if (LanguageUtils.isExtendingActionScript(language)) {
      return language;
    }

    return null;
  }

  @Override
  public Language getLanguage(String fqName) {
    Language language = super.getLanguage(fqName);

    // Don't return the language if it doesn't extend the AS language
    if (LanguageUtils.isExtendingActionScript(language)) {
      return language;
    }

    return null;
  }

  @Override
  public DevKit getDevKit(ModuleReference ref) {
    DevKit devKit = super.getDevKit(ref);

    // Don't return the devkit if it doesn't contains a single AS-extending language
    if (isASDevKit(devKit)) {
      return devKit;
    }

    return null;
  }

  @Override
  public List<Language> getVisibleLanguages() {
    List<Language> visibleLanguages = new ArrayList<Language>();
    for (Language language : super.getVisibleLanguages()) {
      visibleLanguages.add(language);
    }

    // Filter out non-AS languages
    Iterator<Language> visibleLanguageIterator = visibleLanguages.iterator();
    while (visibleLanguageIterator.hasNext()) {
      if (!LanguageUtils.isExtendingActionScript(visibleLanguageIterator.next())) {
        visibleLanguageIterator.remove();
      }
    }

    return visibleLanguages;
  }

  @Override
  public List<DevKit> getVisibleDevkits() {
    List<DevKit> visibleDevkits = new ArrayList<DevKit>();
    for (DevKit devKit : super.getVisibleDevkits()) {
      visibleDevkits.add(devKit);
    }

    // Filter out non-AS devkits
    Iterator<DevKit> visibleDevKitIterator = visibleDevkits.iterator();
    while (visibleDevKitIterator.hasNext()) {
      if (!isASDevKit(visibleDevKitIterator.next())) {
        visibleDevKitIterator.remove();
      }
    }

    return visibleDevkits;
  }

  protected boolean isApplicableActionScriptModule(@NotNull IModule module) {
    if (module instanceof Language) {
      return LanguageUtils.isExtendingActionScript((Language) module);
    } else if (module instanceof DevKit) {
      return isASDevKit((DevKit) module);
    }
    return false;
  }
}
