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
package jetbrains.mps.smodel.language;

import jetbrains.mps.generator.impl.interpreted.TemplateModuleInterpreted;
import jetbrains.mps.generator.runtime.TemplateModule;
import jetbrains.mps.ide.findusages.BaseFindUsagesDescriptor;
import jetbrains.mps.lang.typesystem.runtime.IHelginsDescriptor;
import jetbrains.mps.smodel.Generator;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.LanguageAspect;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.structure.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static jetbrains.mps.smodel.structure.DescriptorUtils.getObjectByClassNameForLanguage;

/**
 * evgeny, 4/28/11
 */
public class LanguageRuntimeInterpreted extends LanguageRuntime {
  private static final DescriptorProvider<ConstraintsDescriptor> OLD_INTERPRETED_CONSTRAINTS = new InterpretedConstraintsProvider();
  // todo: rename
  private static final DescriptorProvider<ConstraintsDescriptor> NEW_INTERPRETED_CONSTRAINTS = new CompiledConstraintsProvider();

  public static final DescriptorProvider<StructureDescriptor> STRUCTURE_PROVIDER = new InterpretedStructureProvider();
  public static final DescriptorProvider<BehaviorDescriptor> BEHAVIOR_PROVIDER = new InterpretedBehaviorProvider();
  public static final DescriptorProvider<ConstraintsDescriptor> CONSTRAINTS_PROVIDER = MixedDescriptorProvider.of(NEW_INTERPRETED_CONSTRAINTS, OLD_INTERPRETED_CONSTRAINTS);
  public static final DescriptorProvider<FacetDescriptor> FACET_PROVIDER = new InterpretedFacetProvider();

  private final Language myLanguage;
  private final Collection<TemplateModule> myTemplateModules;

  public LanguageRuntimeInterpreted(Language language) {
    myLanguage = language;

    List<Generator> generators = language.getGenerators();
    if (generators.isEmpty()) {
      myTemplateModules = null;
    } else {
      myTemplateModules = new ArrayList<TemplateModule>(generators.size());
      for (Generator generator : generators) {
        myTemplateModules.add(new TemplateModuleInterpreted(this, generator));
      }
    }
  }

  @Override
  public String getNamespace() {
    return myLanguage.getModuleFqName();
  }

  @Override
  public IHelginsDescriptor getTypesystem() {
    SModelDescriptor helginsModelDescriptor = LanguageAspect.TYPESYSTEM.get(myLanguage);
    if (helginsModelDescriptor == null) return null;
    String packageName = helginsModelDescriptor.getLongName();

    Object helginsDescriptor = getObjectByClassNameForLanguage(packageName + ".TypesystemDescriptor", myLanguage, true);

    if (helginsDescriptor != null) {
      return (IHelginsDescriptor) helginsDescriptor;
    } else {
      return (IHelginsDescriptor) getObjectByClassNameForLanguage(packageName + ".HelginsDescriptor", myLanguage, true);
    }
  }

  @Override
  public BaseFindUsagesDescriptor getFindUsages() {
    try {
      SModelDescriptor findUsages = LanguageAspect.FIND_USAGES.get(myLanguage);
      if (findUsages == null) return null;
      String packageName = findUsages.getLongName();

      Class<?> cls = myLanguage.getClass(packageName + ".FindUsagesDescriptor");
      if (cls == null) {
        return null;
      }
      return (BaseFindUsagesDescriptor) cls.newInstance();
    } catch (Throwable ex) {
      //     LOG.error("fail to instantiate findUsages for language " + l.getNamespace());
      return null;
    }
  }

  @Override
  public Collection<TemplateModule> getGenerators() {
    return myTemplateModules;
  }
}
