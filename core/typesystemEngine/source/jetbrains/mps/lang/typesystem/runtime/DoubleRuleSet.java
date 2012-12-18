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
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodeUtil;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.Pair;
import org.jetbrains.annotations.NotNull;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/*
 *   Synchronized.
 */
public class DoubleRuleSet<T extends IApplicableTo2Concepts> {

  ConcurrentMap<Pair<String, String>, Set<T>> myRules = new ConcurrentHashMap<Pair<String, String>, /* synchronized */ Set<T>>();
  ConcurrentMap<Pair<String, String>, Set<T>> myRulesCache = new ConcurrentHashMap<Pair<String, String>, /* unmodifiable */ Set<T>>();

  public void addRuleSetItem(Set<T> rules) {
    for (T rule : rules) {
      String concept1 = rule.getApplicableConceptFQName1();
      String concept2 = rule.getApplicableConceptFQName2();
      Pair<String, String> pair = new Pair<String, String>(concept1, concept2);
      Set<T> existingRules = myRules.get(pair);
      while (existingRules == null) {
        myRules.putIfAbsent(pair, Collections.synchronizedSet(new HashSet<T>(1)));
        existingRules = myRules.get(pair);
      }
      existingRules.add(rule);
    }
    myRulesCache.clear();
  }

  public Set<T> getRules(SNode node1, SNode node2) {
    return get(new Pair<String, String>(node1.getConceptFqName(), node2.getConceptFqName()));
  }

  protected Set<T> get(@NotNull final Pair<String, String> key) {
    Set<T> result = myRulesCache.get(key);
    if(result != null) {
      return result;
    }

    String c1 = key.o1;
    String c2 = key.o2;
    if (!isInterfaceConcept(c1) && !isInterfaceConcept(c2)) {
      for (String conceptDeclaration1 = c1; conceptDeclaration1 != null; conceptDeclaration1 = getSuperConcept(conceptDeclaration1)) {
        for (String conceptDeclaration2 = c2; conceptDeclaration2 != null; conceptDeclaration2 = getSuperConcept(conceptDeclaration2)) {
          Pair<String, String> newKey =
            new Pair<String, String>(conceptDeclaration1, conceptDeclaration2);
          result = myRules.get(newKey);
          if (result != null) {
            if (conceptDeclaration1 != key.o1 || conceptDeclaration2 != key.o2) {
              myRules.putIfAbsent(key, result);
            }
            // synchronized collection (result) requires external synchronization for iteration/clone
            synchronized (result) {
              Set<T> clone = Collections.unmodifiableSet(new THashSet<T>(result));
              myRulesCache.putIfAbsent(key, clone);
              return clone;
            }
          }
        }
      }
    }
    myRules.putIfAbsent(key, Collections.synchronizedSet(new HashSet<T>(1)));
    myRulesCache.putIfAbsent(key, Collections.<T>emptySet());
    return Collections.emptySet();
  }

  public void makeConsistent() {
    for (Pair<String, String> pair : myRules.keySet()) {
      if (pair == null) {
        continue;
      }
      Set<T> rules = myRules.get(pair);
      if (rules == null) continue;
      if (isInterfaceConcept(pair.o1) || isInterfaceConcept(pair.o2)) continue;

      for (String conceptDeclaration1 = pair.o1; conceptDeclaration1 != null; conceptDeclaration1 = getSuperConcept(conceptDeclaration1)) {
        for (String conceptDeclaration2 = pair.o2; conceptDeclaration2 != null; conceptDeclaration2 = getSuperConcept(conceptDeclaration2)) {
          Set<T> parentRules = myRules.get(new Pair<String, String>(conceptDeclaration1, conceptDeclaration2));
          if (parentRules != null) {
            if (conceptDeclaration1 != pair.o1 || conceptDeclaration2 != pair.o2) {
              Set<T> clone;
              synchronized (parentRules) {
                clone = new THashSet<T>(parentRules);
              }
              rules.addAll(clone);
            }
          }
        }
      }
    }
    myRulesCache.clear();
  }

  // TODO rewrite using ConceptDescriptor
  private boolean isInterfaceConcept(String conceptFqName) {
    SNode conceptDeclaration = SModelUtil.findConceptDeclaration(conceptFqName, GlobalScope.getInstance());
    return !SNodeUtil.isInstanceOfConceptDeclaration(conceptDeclaration);
  }

  // TODO rewrite using ConceptDescriptor
  private String getSuperConcept(String conceptFqName) {
    SNode conceptDeclaration = SModelUtil.findConceptDeclaration(conceptFqName, GlobalScope.getInstance());
    SNode superConcept = SNodeUtil.isInstanceOfConceptDeclaration(conceptDeclaration) ? SNodeUtil.getConceptDeclaration_Extends(conceptDeclaration) : null;
    return superConcept != null ? NameUtil.nodeFQName(superConcept) : null;
  }

  public void clear() {
    myRules.clear();
    myRulesCache.clear();
  }
}
