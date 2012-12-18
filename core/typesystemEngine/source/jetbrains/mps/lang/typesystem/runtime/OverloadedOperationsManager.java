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
package jetbrains.mps.lang.typesystem.runtime;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.RulesManager;
import jetbrains.mps.typesystem.inference.SubtypingManager;
import jetbrains.mps.typesystem.inference.TypeChecker;
import jetbrains.mps.util.CollectionUtil;

import java.util.*;

public class OverloadedOperationsManager {
  private static final Logger LOG = Logger.getLogger(OverloadedOperationsManager.class);

  private RuleSet<IOverloadedOpsTypesProvider> myOperationsToTypeProviders =
    new RuleSet<IOverloadedOpsTypesProvider>();

  private TypeChecker myTypeChecker;

  public OverloadedOperationsManager(TypeChecker typeChecker) {
    myTypeChecker = typeChecker;
  }

  public void addOverloadedOperationsTypeProvider(IOverloadedOpsTypesProvider provider) {
    Set<IOverloadedOpsTypesProvider> providers = CollectionUtil.set(provider);
    addOverloadedOperationsTypeProviders(providers);
  }

  public void addOverloadedOperationsTypeProviders(Set<IOverloadedOpsTypesProvider> providers) {
    myOperationsToTypeProviders.addRuleSetItem(providers);
  }

  public SNode getOperationType(SNode operation, SNode leftOperandType, SNode rightOperandType) {
    Set<IOverloadedOpsTypesProvider> operationsTypesProviderSet;
    synchronized (RulesManager.RULES_LOCK) {
      operationsTypesProviderSet = myOperationsToTypeProviders.getRules(operation);
    }
    if (operationsTypesProviderSet.isEmpty()) {
      return null;
    }
    SubtypingManager subtypingManager = myTypeChecker.getSubtypingManager();
    List<IOverloadedOpsTypesProvider> filteredProviders = new ArrayList<IOverloadedOpsTypesProvider>();
    for (IOverloadedOpsTypesProvider provider : operationsTypesProviderSet) {
      if (provider.isApplicable(subtypingManager, operation, leftOperandType, rightOperandType)) {
        filteredProviders.add(provider);
      }
    }
    final boolean[] severalRules = new boolean[]{false};
    Collections.sort(filteredProviders, new Comparator<IOverloadedOpsTypesProvider>() {
      public int compare(IOverloadedOpsTypesProvider o1, IOverloadedOpsTypesProvider o2) {
        int i = o1.compareTo(o2);
        if (i == 0) {
          severalRules[0] = true;
        }
        return i;
      }
    });
    if (severalRules[0]) {
      LOG.warning("several overloaded rules found for operation", operation);
    }
    for (IOverloadedOpsTypesProvider provider : filteredProviders) {
      SNode result = provider.getOperationType(operation, leftOperandType, rightOperandType);
      if (result != null) {
        return result;
      }
    }
    return null;
  }

  public void clear() {
    myOperationsToTypeProviders = new RuleSet<IOverloadedOpsTypesProvider>();
  }

  public void makeConsistent() {
  }
}
