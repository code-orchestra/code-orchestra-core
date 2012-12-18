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

import gnu.trove.THashSet;
import jetbrains.mps.smodel.LanguageHierarchyCache;
import jetbrains.mps.smodel.SNode;

import java.util.Collections;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/*
 *  Synchronized.
 */
public class RuleSet<T extends IApplicableToConcept> {
  ConcurrentMap<String, Set<T>> myRules = new ConcurrentHashMap<String, /* synchronized */ Set<T>>();
  ConcurrentMap<String, Set<T>> myRulesCache = new ConcurrentHashMap<String, /* unmodifiable */ Set<T>>();

  public void addRuleSetItem(Set<T> rules) {
    for (T rule : rules) {
      addRule_internal(rule);
    }
    myRulesCache.clear();
  }

  public void addRule(T rule) {
    addRule_internal(rule);
    myRulesCache.clear();
  }

  private void addRule_internal(T rule) {
    String concept = rule.getApplicableConceptFQName();
    Set<T> existingRules = myRules.get(concept);
    while (existingRules == null) {
      myRules.putIfAbsent(concept, Collections.synchronizedSet(new THashSet<T>(2)));
      existingRules = myRules.get(concept);
    }
    existingRules.add(rule);
  }

  public Set<T> getRules(SNode node) {
    return get(node.getConceptFqName());
  }

  protected Set<T> get(String key) {
    Set<T> cachedResult = myRulesCache.get(key);
    if (cachedResult != null) {
      return cachedResult;
    }

    Set<T> result = Collections.unmodifiableSet(computeRuleSet(key));
    myRulesCache.put(key, result);
    return result;
  }

  private Set<T> computeRuleSet(String concept) {
    Set<T> result = new THashSet<T>();
    Set<String> frontier = new THashSet<String>();
    Set<String> newFrontier = new THashSet<String>();
    frontier.add(concept);

    while (!frontier.isEmpty()) {
      for (String abstractConcept : frontier) {
        Set<T> rules = myRules.get(abstractConcept);
        boolean overrides = false;
        if (rules != null) {
          synchronized (rules) {
            result.addAll(rules);
            for (T rule : rules) {
              if (rule instanceof ICheckingRule_Runtime && ((ICheckingRule_Runtime) rule).overrides()) {
                overrides = true;
              }
            }
          }
        }
        //else {
        if (overrides) {
          continue;
        }

        newFrontier.addAll(LanguageHierarchyCache.getParentsNames(abstractConcept));
        //}

      }
      frontier = newFrontier;
      newFrontier = new THashSet<String>();
    }
    return result;
  }

  public void clear() {
    myRules.clear();
    myRulesCache.clear();
  }
}
