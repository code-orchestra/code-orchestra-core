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

import gnu.trove.THashSet;
import jetbrains.mps.lang.typesystem.runtime.*;
import jetbrains.mps.lang.typesystem.runtime.AbstractDependentComputation_Runtime.DependentComputationWrapper;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.language.LanguageRegistry;
import jetbrains.mps.smodel.language.LanguageRuntime;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.Condition;
import jetbrains.mps.util.Pair;

import java.util.LinkedList;
import java.util.List;
import java.util.Set;

public class ModelRules {
  public static final Object RULES_LOCK = new Object();

  private Set<String> myLoadedLanguages = new THashSet<String>();
  private RuleSet<InferenceRule_Runtime> myInferenceRules = new CheckingRuleSet<InferenceRule_Runtime>();
  private RuleSet<NonTypesystemRule_Runtime> myNonTypeSystemRules = new CheckingRuleSet<NonTypesystemRule_Runtime>();
  private RuleSet<SubtypingRule_Runtime> mySubTypingRules = new RuleSet<SubtypingRule_Runtime>();
  private DoubleRuleSet<ComparisonRule_Runtime> myComparisonRules = new DoubleRuleSet<ComparisonRule_Runtime>();
  private DoubleRuleSet<InequationReplacementRule_Runtime> myReplacementRules = new DoubleRuleSet<InequationReplacementRule_Runtime>();
  private RuleSet<AbstractDependentComputation_Runtime> myDependentComputations = new RuleSet<AbstractDependentComputation_Runtime>();
  private RuleSet<DependentComputationWrapper> myDependentComputationsBlockedNodes = new RuleSet<DependentComputationWrapper>();
  private Set<IVariableConverter_Runtime> myVariableConverters = new THashSet<IVariableConverter_Runtime>();
  private DependenciesContainer myDependenciesContainer = new DependenciesContainer();
  private Set<SModelReference> myModelsWithLoadedRules = new THashSet<SModelReference>();
  private OverloadedOperationsManager myOverloadedOperationsManager;
  private static final Logger LOG = Logger.getLogger(RulesManager.class);

  public ModelRules(SModelDescriptor model) {
    List<Language> languages = SModelOperations.getLanguages(model.getSModel(), GlobalScope.getInstance());
    for (Language language : languages) {
      loadLanguage(language.getModuleFqName());
    }
  }

  public void clear() {
    myLoadedLanguages.clear();
    myModelsWithLoadedRules.clear();
    myInferenceRules.clear();
    myNonTypeSystemRules.clear();
    mySubTypingRules.clear();
    myComparisonRules.clear();
    myReplacementRules.clear();
    myDependenciesContainer.clear();
    myVariableConverters.clear();
//    myOverloadedOperationsManager.clear();
    myDependentComputations.clear();
    myDependentComputationsBlockedNodes.clear();
  }

  //todo: we should not change language models while loading language
  public boolean loadLanguage(final String languageNamespace) {
    synchronized (RULES_LOCK) {
      if (myLoadedLanguages.contains(languageNamespace)) {
        return true;
      }
      LanguageRuntime language = LanguageRegistry.getInstance().getLanguage(languageNamespace);
      if (language == null) return false;
      IHelginsDescriptor typeSystemDescriptor = null;
      try {
        typeSystemDescriptor = language.getTypesystem();
      } catch (Throwable t) {
        LOG.error("Error while loading language: " + t);
      }
      if (typeSystemDescriptor == null) return false;
      try {
        myInferenceRules.addRuleSetItem(typeSystemDescriptor.getInferenceRules());
        myNonTypeSystemRules.addRuleSetItem(typeSystemDescriptor.getNonTypesystemRules());
        mySubTypingRules.addRuleSetItem(typeSystemDescriptor.getSubtypingRules());
        Set<ComparisonRule_Runtime> comparisonRule_runtimes = typeSystemDescriptor.getComparisonRules();
        myComparisonRules.addRuleSetItem(comparisonRule_runtimes);
        myReplacementRules.addRuleSetItem(typeSystemDescriptor.getEliminationRules());
        myDependenciesContainer.addDependencies(typeSystemDescriptor.getDependencies());
        myVariableConverters.addAll(typeSystemDescriptor.getVariableConverters());
        myOverloadedOperationsManager.addOverloadedOperationsTypeProviders(typeSystemDescriptor.getOverloadedOperationsTypesProviders());
        Set<AbstractDependentComputation_Runtime> dependentComputations = typeSystemDescriptor.getDependentComputations();
        myDependentComputations.addRuleSetItem(dependentComputations);
        for (AbstractDependentComputation_Runtime dependentComputation : dependentComputations) {
          myDependentComputationsBlockedNodes.addRule(dependentComputation.getWrapper());
        }
        myComparisonRules.makeConsistent();
        myReplacementRules.makeConsistent();
        myDependenciesContainer.makeConsistent();
        myOverloadedOperationsManager.makeConsistent();
        return true;
      } catch (Throwable t) {
        return false;
      } finally {
        myLoadedLanguages.add(languageNamespace);
      }
    }
  }

  public IVariableConverter_Runtime getVariableConverter(SNode context, String role, SNode variable, boolean isAggregation) {
    synchronized (RULES_LOCK) {
      for (IVariableConverter_Runtime converter : myVariableConverters) {
        if (converter.isApplicable(context, role, variable, isAggregation)) return converter;
      }
      return null;
    }
  }

  public List<Pair<InferenceRule_Runtime, IsApplicableStatus>> getInferenceRules(final SNode node) {
    List<Pair<InferenceRule_Runtime, IsApplicableStatus>> result = new LinkedList<Pair<InferenceRule_Runtime, IsApplicableStatus>>();
    Set<InferenceRule_Runtime> ruleSet;
    //synchronized (RULES_LOCK) {
      ruleSet = myInferenceRules.getRules(node);
    //}
    for (InferenceRule_Runtime rule : ruleSet) {
      IsApplicableStatus status = rule.isApplicableAndPattern(node);
      if (status.isApplicable()) {
        result.add(new Pair<InferenceRule_Runtime, IsApplicableStatus>(rule, status));
      }
    }
    return result;
  }


  public List<Pair<NonTypesystemRule_Runtime, IsApplicableStatus>> getNonTypesystemRules(final SNode node) {
    List<Pair<NonTypesystemRule_Runtime, IsApplicableStatus>> result =
      new LinkedList<Pair<NonTypesystemRule_Runtime, IsApplicableStatus>>();
    Set<NonTypesystemRule_Runtime> ruleSet;
    ruleSet = myNonTypeSystemRules.getRules(node);
    for (NonTypesystemRule_Runtime rule : ruleSet) {
      IsApplicableStatus status = rule.isApplicableAndPattern(node);
      if (status.isApplicable()) {
        result.add(new Pair<NonTypesystemRule_Runtime, IsApplicableStatus>(rule, status));
      }
    }
    return result;
  }

  public List<Pair<SubtypingRule_Runtime, IsApplicableStatus>> getSubtypingRules(final SNode node, final boolean isWeak) {
    List<Pair<SubtypingRule_Runtime, IsApplicableStatus>> result = new LinkedList<Pair<SubtypingRule_Runtime, IsApplicableStatus>>();
    Set<SubtypingRule_Runtime> ruleSet;
    //synchronized (RULES_LOCK) {
      //loadLanguage(node.getLanguageNamespace());
      ruleSet = mySubTypingRules.getRules(node);
    //}
    for (SubtypingRule_Runtime rule : ruleSet) {
      if ((isWeak || !rule.isWeak())) {
        IsApplicableStatus status = rule.isApplicableAndPattern(node);
        if (status.isApplicable()) {
          result.add(new Pair<SubtypingRule_Runtime, IsApplicableStatus>(rule, status));
        }
      }
    }
    return result;
  }

  public List<Pair<ComparisonRule_Runtime, IsApplicable2Status>> getComparisonRules(final SNode node1, final SNode node2, final boolean isWeak) {
    List<Pair<ComparisonRule_Runtime, IsApplicable2Status>> result = new LinkedList<Pair<ComparisonRule_Runtime, IsApplicable2Status>>();
    Set<ComparisonRule_Runtime> ruleSet;
    //synchronized (RULES_LOCK) {
      // loadLanguage(node1.getLanguageNamespace());
      // loadLanguage(node2.getLanguageNamespace());
      ruleSet = myComparisonRules.getRules(node1, node2);
    //}
    for (ComparisonRule_Runtime rule : ruleSet) {
      if (isWeak || !rule.isWeak()) {
        IsApplicable2Status status = rule.isApplicableAndPatterns(node1, node2);
        if (status.isApplicable()) {
          result.add(new Pair<ComparisonRule_Runtime, IsApplicable2Status>(rule, status));
        }
      }
    }
    return result;
  }


  public List<Pair<InequationReplacementRule_Runtime, IsApplicable2Status>> getReplacementRules(final SNode node1, final SNode node2) {
    List<Pair<InequationReplacementRule_Runtime, IsApplicable2Status>> result = new LinkedList<Pair<InequationReplacementRule_Runtime, IsApplicable2Status>>();
    Set<InequationReplacementRule_Runtime> ruleSet;
    //synchronized (RULES_LOCK) {
      ruleSet = myReplacementRules.getRules(node1, node2);
    //}
    for (InequationReplacementRule_Runtime rule : ruleSet) {
      IsApplicable2Status status = rule.isApplicableAndPatterns(node1, node2);
      if (status.isApplicable()) {
        result.add(new Pair<InequationReplacementRule_Runtime, IsApplicable2Status>(rule, status));
      }
    }
    return result;
  }

  public Set<SNode> getDependencies(SNode node) {
    return myDependenciesContainer.getDependencies(node);
  }

  public SNode getOperationType(SNode operation, SNode leftOperandType, SNode rightOperandType) {
    return myOverloadedOperationsManager.getOperationType(operation, leftOperandType, rightOperandType);
  }

  public Set<AbstractDependentComputation_Runtime> getDependentComputations(final SNode node) {
    Set<AbstractDependentComputation_Runtime> rules;
    //synchronized (RULES_LOCK) {
      rules = myDependentComputations.getRules(node);
    //}
    return CollectionUtil.filter(rules, new Condition<AbstractDependentComputation_Runtime>() {
      @Override
      public boolean met(AbstractDependentComputation_Runtime dependentComputation) {
        return dependentComputation.isApplicable(node);
      }
    });
  }

  public boolean isBlockingDependentComputationNode(SNode node) {
    Set<DependentComputationWrapper> set;
    //synchronized (RULES_LOCK) {
      set = myDependentComputationsBlockedNodes.getRules(node);
    //}
    if (set == null) return false;
    for (DependentComputationWrapper wrapper : set) {
      if (wrapper.isBlocking(node)) {
        return true;
      }
    }
    return false;
  }
}
