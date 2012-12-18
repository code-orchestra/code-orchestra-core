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
package jetbrains.mps.ide.devkit.util;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.ui.Messages;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.structure.modules.GeneratorDescriptor;
import jetbrains.mps.project.structure.modules.LanguageDescriptor;
import jetbrains.mps.smodel.Generator;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.MPSModuleRepository;

import javax.swing.SwingUtilities;
import java.util.ArrayList;
import java.util.List;

public class DeleteGeneratorHelper {
  private static final Logger LOG = Logger.getLogger(DeleteGeneratorHelper.class);

  public static void deleteGenerator(Project project, Language sourceLanguage, Generator generator, GeneratorDescriptor generatorDescriptor, boolean safeDelete, boolean deleteFiles) {
    if (safeDelete) {
      safeDelete(project, sourceLanguage, generator, generatorDescriptor, deleteFiles);
    } else {
      delete(sourceLanguage, generatorDescriptor, deleteFiles);
    }
  }

  public static void delete(Language sourceLanguage, GeneratorDescriptor generatorDescriptor, boolean deleteFiles) {
    LanguageDescriptor languageDescriptor = sourceLanguage.getModuleDescriptor();
    languageDescriptor.getGenerators().remove(generatorDescriptor);
    sourceLanguage.setLanguageDescriptor(languageDescriptor, true);
    sourceLanguage.save();
  }

  private static void safeDelete(final Project project, Language sourceLanguage, final Generator generator, GeneratorDescriptor generatorDescriptor, boolean deleteFiles) {
    List<Generator> dependant = new ArrayList<Generator>();
    for (Generator gen : MPSModuleRepository.getInstance().getAllGenerators()) {
      if (gen.getReferencedGenerators().contains(generator)) {
        dependant.add(gen);
      }
    }
    if (!dependant.isEmpty()) {
      final StringBuilder report = new StringBuilder();
      report.append("Can't delete generator ").append(generator.getModuleFqName()).append(".\n");
      report.append("The following generators depend on it:\n\n");
      for (Generator gen : dependant) {
        report.append(gen.getModuleFqName()).append("\n");
      }

      SwingUtilities.invokeLater(new Runnable() {
        public void run() {
          Messages.showErrorDialog(project, report.toString(), "Deleting Generator");
        }
      });
      return;
    }

    LanguageDescriptor languageDescriptor = sourceLanguage.getModuleDescriptor();
    languageDescriptor.getGenerators().remove(generator.getModuleDescriptor());
    sourceLanguage.setLanguageDescriptor(languageDescriptor, true);
    if (deleteFiles) {
      LOG.error("DELETE GENERATOR FILES - NOT IMPLEMENTED", new Throwable());
      //todo
    }
    sourceLanguage.save();
  }
}

