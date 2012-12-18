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
package jetbrains.mps.smodel.runtime.interpreted;

import jetbrains.mps.smodel.LanguageAspect;
import jetbrains.mps.smodel.constraints.ModelConstraintsManager;
import jetbrains.mps.smodel.runtime.ConstraintsDescriptor;
import jetbrains.mps.smodel.runtime.base.BaseConstraintsDescriptor;
import jetbrains.mps.smodel.runtime.impl.DataHolderConstraintsDescriptor;
import jetbrains.mps.smodel.structure.ConstraintsDataHolder;
import jetbrains.mps.smodel.structure.InterpretedConstraintsDataHolder;
import jetbrains.mps.util.NameUtil;

import static jetbrains.mps.smodel.structure.DescriptorUtils.getObjectByClassNameForConcept;

public class ConstraintsAspectInterpreted implements jetbrains.mps.smodel.runtime.ConstraintsAspectDescriptor {
  private static final ConstraintsAspectInterpreted INSTANCE = new ConstraintsAspectInterpreted();

  private ConstraintsAspectInterpreted() {
  }

  public static ConstraintsAspectInterpreted getInstance() {
    return INSTANCE;
  }

  @Override
  public ConstraintsDescriptor getDescriptor(String fqName) {
    // todo: add illegal constraints support

    Object constraintsObject = getObjectByClassNameForConcept(NameUtil.getAspectNodeFqName(fqName, LanguageAspect.CONSTRAINTS) + "_Constraints", fqName, false);

    ConstraintsDescriptor descriptor = null;

    if (constraintsObject == null) {
      // if ConstraintsDescriptor not exist too - return EmptyConstraintsDataHolder
      if (ModelConstraintsManager.getOldConstraintsDescriptor(NameUtil.namespaceFromConceptFQName(fqName)) == null) {
        descriptor = new BaseConstraintsDescriptor(fqName);
      }
    } else {
      if (ConstraintsDataHolder.class.isAssignableFrom(constraintsObject.getClass())) {
        try {
          ConstraintsDataHolder compiledDataHolder = (ConstraintsDataHolder) constraintsObject;
          descriptor = new DataHolderConstraintsDescriptor(compiledDataHolder);
        } catch (Exception ignored) {
        }
      }
    }

    if (descriptor == null) {
      descriptor = new DataHolderConstraintsDescriptor(new InterpretedConstraintsDataHolder(fqName));
    }

    return descriptor;
  }
}
