/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.smodel.structure;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.LanguageAspect;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.NameUtil;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.List;

public class DescriptorUtils {

  private static Logger LOG = Logger.getLogger(DescriptorUtils.class);

  @Nullable
  public static Object getObjectByClassNameForLanguage(String className, @Nullable Language language, boolean avoidLogErrors) {
    try {
      if (language == null) {
        return null;
      }

      if (avoidLogErrors) {
        ClassLoader cl = ClassLoaderManager.getInstance().getClassLoaderFor(language, false);
        if (cl == null) {
          return null;
        }
      }

      Class clazz = language.getClass(className);
      if (clazz == null) {
        return null;
      }

      return clazz.newInstance();
    } catch (Throwable e) {
      LOG.debug("error loading class\""+className+"\"", e);
    }
    return null;
  }

  @Nullable
  public static Object getObjectByClassNameForLanguageNamespace(String className, String languageNamespace, boolean avoidLogErrors) {
    return getObjectByClassNameForLanguage(className, MPSModuleRepository.getInstance().getLanguage(languageNamespace), avoidLogErrors);
  }

  @Nullable
  public static Object getObjectByClassNameForConcept(String className, String conceptFqName, boolean avoidLogErrors) {
    return getObjectByClassNameForLanguageNamespace(className, NameUtil.namespaceFromConceptFQName(conceptFqName), avoidLogErrors);
  }

  public static List<String> getLanguageConcepts(Language language) {
    List<String> result = new ArrayList<String>();

    for (SNode node : LanguageAspect.STRUCTURE.get(language).getSModel().nodes()) {
      if ("jetbrains.mps.lang.structure.structure.ConceptDeclaration".equals(node.getConceptFqName()) ||
        "jetbrains.mps.lang.structure.structure.InterfaceConceptDeclaration".equals(node.getConceptFqName())) {
        result.add(NameUtil.nodeFQName(node));
      }
    }

    return result;
  }
}
