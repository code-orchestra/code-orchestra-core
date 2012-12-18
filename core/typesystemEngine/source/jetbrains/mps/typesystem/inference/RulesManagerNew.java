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
package jetbrains.mps.typesystem.inference;

import jetbrains.mps.lang.typesystem.runtime.IsApplicableStatus;
import jetbrains.mps.lang.typesystem.runtime.NonTypesystemRule_Runtime;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.Pair;
import jetbrains.mps.util.misc.hash.HashMap;

import java.util.List;
import java.util.Map;

public class RulesManagerNew {
  private Map<SModelDescriptor, ModelRules> myModelsToRules = new HashMap<SModelDescriptor, ModelRules>();
  private TypeChecker myTypeChecker;

  public RulesManagerNew(TypeChecker typeChecker) {
    myTypeChecker = typeChecker;
    //myOverloadedOperationsManager = new OverloadedOperationsManager(myTypeChecker);
    SModelRepository.getInstance().addModelRepositoryListener(new SModelRepositoryAdapter() {
      public void modelRemoved(SModelDescriptor modelDescriptor) {
        myModelsToRules.remove(modelDescriptor);
      }
    });
  }

  public void clear() {
    for (Map.Entry<SModelDescriptor, ModelRules> entry : myModelsToRules.entrySet()) {
      entry.getValue().clear();
    }
    myModelsToRules.clear();
  }

  private ModelRules getModelRules(SNode node) {
    SModelDescriptor model = node.getModel().getModelDescriptor();
    ModelRules result = myModelsToRules.get(model);
    if (result == null) {
      result = new ModelRules(model);
      myModelsToRules.put(model, result);
    }
    return result;
  }

  public List<Pair<NonTypesystemRule_Runtime, IsApplicableStatus>> getNonTypesystemRules(SNode node) {
    return getModelRules(node).getNonTypesystemRules(node);
  }

}
