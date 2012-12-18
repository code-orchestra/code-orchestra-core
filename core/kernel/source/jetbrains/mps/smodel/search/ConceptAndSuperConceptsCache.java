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
package jetbrains.mps.smodel.search;

import jetbrains.mps.cache.AbstractCache;
import jetbrains.mps.cache.CachesManager;
import jetbrains.mps.cache.CachesManager.CacheCreator;
import jetbrains.mps.cache.KeyProducer;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.search.Datasets.ConceptPropertiesDataSet;
import jetbrains.mps.smodel.search.Datasets.ConceptsDataSet;
import jetbrains.mps.smodel.search.Datasets.LinkDeclarationsDataSet;
import jetbrains.mps.smodel.search.Datasets.PropertyDeclarationsDataSet;
import jetbrains.mps.util.NameUtil;

import java.util.*;

/**
 * Should be thread safe.
 */
class ConceptAndSuperConceptsCache extends AbstractCache {
  private static final KeyProducer keyProducer = new KeyProducer();

  private static final CacheCreator<SNode> CREATOR = new CacheCreator<SNode>() {
    public AbstractCache create(Object key, SNode element) {
      return new ConceptAndSuperConceptsCache(key, element);
    }
  };

  public static ConceptAndSuperConceptsCache getInstance(SNode topConcept) {
    Object key = keyProducer.createKey(topConcept);
    return (ConceptAndSuperConceptsCache) CachesManager.getInstance().getCache(key, topConcept, CREATOR);
  }

  @Override
  public Set<SModelDescriptor> getDependsOnModels(Object element) {
    Set<SModelDescriptor> dependsOnModel = new HashSet<SModelDescriptor>();
    for (SNode concept : getConcepts()) {
      // http://youtrack.jetbrains.net/issue/MPS-8362
      // http://youtrack.jetbrains.net/issue/MPS-8556
      SModelDescriptor descriptor = concept.getModel().getModelDescriptor();
      assert descriptor != null : getAssertionMessage(element, concept);
      dependsOnModel.add(descriptor);
    }
    return dependsOnModel;
  }

  private String getAssertionMessage(Object element, SNode concept) {
    String conceptFQName = NameUtil.nodeFQName(concept);
    GlobalScope scope = GlobalScope.getInstance();
    SNode conceptFromModelUtil = SModelUtil.findConceptDeclaration(conceptFQName, scope);

    String languageFqName = NameUtil.namespaceFromConceptFQName(conceptFQName);
    String conceptName = NameUtil.shortNameFromLongName(conceptFQName);
    Language language = scope.getLanguage(new ModuleReference(languageFqName));
    SNode conceptFromScope = null;
    if (language != null) {
      conceptFromScope = language.findConceptDeclaration(conceptName);
    }

    return "Model descriptor is null for concept: " +
      concept + "(" + System.identityHashCode(concept) + ")  same concept from SModelUtil_new: " +
      conceptFromModelUtil + "(" + System.identityHashCode(conceptFromModelUtil) + ") same concept from Scope:"
      + conceptFromScope + "(" + System.identityHashCode(conceptFromScope) + "), element: " +
      element + "(" + System.identityHashCode(element) + "), myTopConcept: " +
      myTopConcept + "(" + System.identityHashCode(element) + ")";
  }

  //-----------------------

  private SNode myTopConcept;

  protected ConceptAndSuperConceptsCache(Object key, SNode topConcept) {
    super(key);
    myTopConcept = topConcept;
  }

  public SNode getTopConcept() {
    return myTopConcept;
  }

  public SNode[] getConcepts() {
    ConceptsDataSet dataSet = (ConceptsDataSet) getDataSet(Datasets.ConceptsDataSet.ID, Datasets.CONCEPTS_CACHE_CREATOR);
    return dataSet.getConcepts();
  }

  public SNode getPropertyDeclarationByName(String name) {
    PropertyDeclarationsDataSet dataSet = (PropertyDeclarationsDataSet) getDataSet(Datasets.PropertyDeclarationsDataSet.ID, Datasets.PROPDECL_CACHE_CREATOR);
    return dataSet.getPropertyDeclarationByName(name);
  }

  public List<SNode> getPropertyDeclarations() {
    PropertyDeclarationsDataSet dataSet = (PropertyDeclarationsDataSet) getDataSet(Datasets.PropertyDeclarationsDataSet.ID, Datasets.PROPDECL_CACHE_CREATOR);
    return dataSet.getPropertyDeclarations();
  }

  public SNode getLinkDeclarationByRole(String role) {
    LinkDeclarationsDataSet dataSet = (LinkDeclarationsDataSet) getDataSet(Datasets.LinkDeclarationsDataSet.ID, Datasets.LINKDECL_CACHE_CREATOR);
    return dataSet.getLinkDeclarationByRole(role);
  }

  public SNode getMostSpecificLinkDeclarationByRole(String role) {
    LinkDeclarationsDataSet dataSet = (LinkDeclarationsDataSet) getDataSet(Datasets.LinkDeclarationsDataSet.ID, Datasets.LINKDECL_CACHE_CREATOR);
    return dataSet.getMostSpecificLinkDeclarationByRole(role);
  }

  public List<SNode> getLinkDeclarationsExcludingOverridden() {
    LinkDeclarationsDataSet dataSet = (LinkDeclarationsDataSet) getDataSet(Datasets.LinkDeclarationsDataSet.ID, Datasets.LINKDECL_CACHE_CREATOR);
    return dataSet.getLinkDeclarationsExcludingOverridden();
  }

  public SNode getConceptPropertyByName(String name) {
    ConceptPropertiesDataSet dataSet = (ConceptPropertiesDataSet) getDataSet(Datasets.ConceptPropertiesDataSet.ID, Datasets.CONCEPTPROPS_CACHE_CREATOR);
    return dataSet.getConceptPropertyByName(name);
  }
}
