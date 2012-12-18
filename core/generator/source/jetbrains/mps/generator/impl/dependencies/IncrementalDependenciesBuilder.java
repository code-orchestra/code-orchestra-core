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
package jetbrains.mps.generator.impl.dependencies;

import jetbrains.mps.generator.IncrementalGenerationStrategy;
import jetbrains.mps.generator.ModelDigestHelper;
import jetbrains.mps.generator.impl.GenerationFailureException;
import jetbrains.mps.generator.impl.GeneratorMappings;
import jetbrains.mps.generator.impl.cache.BrokenCacheException;
import jetbrains.mps.generator.impl.cache.IntermediateModelsCache;
import jetbrains.mps.generator.impl.cache.MappingsMemento;
import jetbrains.mps.generator.impl.cache.TransientModelWithMetainfo;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodeId;
import org.jetbrains.annotations.Nullable;

import java.util.*;

/**
 * Dependencies collector. Created once per model generation.
 * <p/>
 * Evgeny Gryaznov, May 11, 2010
 */
public class IncrementalDependenciesBuilder implements DependenciesBuilder {

  private static final Logger LOG = Logger.getLogger(IncrementalDependenciesBuilder.class);

  /* generation data */
  private final Map<SNode, RootDependenciesBuilder> myRootBuilders = new HashMap<SNode, RootDependenciesBuilder>();
  private final String myModelHash;
  private final String myParametersHash;
  private final IntermediateModelsCache myCache;
  private RootDependenciesBuilder myConditionalsBuilder;
  private RootDependenciesBuilder[] myAllBuilders;

  /* next step input -> original */
  Map<SNode, SNode> nextStepToOriginalMap;

  /* current step data */
  Map<SNode, SNode> currentToOriginalMap;
  SModel originalInputModel;
  SModel currentInputModel;
  SModel currentOutputModel;
  private TransientModelWithMetainfo myCachedModel;
  private int myMajorStep = -1;
  private int myMinorStep = -1;

  /* make data */
  private Map<String, SNode> myUnchangedSet;
  private Map<String, SNode> myRequiredSet;

  public IncrementalDependenciesBuilder(SModel originalInputModel, @Nullable Map<String, String> generationHashes,
                                        String parametersHash, IntermediateModelsCache cache) {
    this.originalInputModel = currentInputModel = originalInputModel;
    myParametersHash = parametersHash;
    myCache = cache;
    currentOutputModel = null;
    myModelHash = generationHashes == null ? null : generationHashes.get(ModelDigestHelper.FILE);
    initData(getRoots(originalInputModel), generationHashes);
  }

  private void initData(SNode[] roots, Map<String, String> generationHashes) {
    myConditionalsBuilder = new RootDependenciesBuilder(null, this, generationHashes != null ? generationHashes.get(ModelDigestHelper.HEADER) : "");
    currentToOriginalMap = new HashMap<SNode, SNode>(roots.length * 3 / 2);
    myAllBuilders = new RootDependenciesBuilder[roots.length + 1];
    int e = 0;
    myAllBuilders[e++] = myConditionalsBuilder;
    for (SNode root : roots) {
      myAllBuilders[e] = new RootDependenciesBuilder(root, this, generationHashes != null ? generationHashes.get(root.getId()) : null);
      myRootBuilders.put(root, myAllBuilders[e++]);
      currentToOriginalMap.put(root, root);
    }
  }

  public void propagateDependencies(Set<SNode> unchangedRoots, Set<SNode> requiredRoots, boolean conditionalsUnchanged, boolean conditionalsRequired, GenerationDependencies saved) {
    myUnchangedSet = new HashMap<String, SNode>(unchangedRoots.size() + 1);
    myRequiredSet = new HashMap<String, SNode>(requiredRoots.size() + 1);
    for (SNode root : unchangedRoots) {
      propagateDependencies(getRootBuilder(root), saved.getDependenciesFor(root.getId()), false);
    }
    for (SNode root : requiredRoots) {
      propagateDependencies(getRootBuilder(root), saved.getDependenciesFor(root.getId()), true);
    }
    if (conditionalsUnchanged || conditionalsRequired) {
      propagateDependencies(getRootBuilder(null), saved.getDependenciesFor(ModelDigestHelper.HEADER), conditionalsRequired);
    }
  }

  private void propagateDependencies(RootDependenciesBuilder builder, GenerationRootDependencies deps, boolean isRequired) {
    assert deps.getHash().equals(builder.getHash());
    builder.loadDependencies(deps);
    SNode root = builder.getOriginalRoot();
    (isRequired ? myRequiredSet : myUnchangedSet).put(root != null ? root.getId() : TransientModelWithMetainfo.CONDITIONALS_ID, root);
  }

  private static SNode[] getRoots(SModel model) {
    SNode[] result = new SNode[model.rootsCount()];
    Iterator<SNode> iter = model.rootsIterator();
    for (int i = 0; i < result.length; i++) {
      result[i] = iter.next();
    }
    return result;
  }

  @Override
  public void scriptApplied(SModel newmodel) {
    Map<SNodeId, SNode> oldidsToOriginal = new HashMap<SNodeId, SNode>();
    for (Map.Entry<SNode, SNode> entry : currentToOriginalMap.entrySet()) {
      oldidsToOriginal.put(entry.getKey().getSNodeId(), entry.getValue());
    }
    currentToOriginalMap = new HashMap<SNode, SNode>();
    for (SNode root : newmodel.roots()) {
      SNodeId id = root.getSNodeId();
      SNode original = oldidsToOriginal.get(id);
      if(original == null) {
        // TODO if original is null -> new root added, warning/error(strict)?
        LOG.debug("script created a new node");
      }
      currentToOriginalMap.put(root, original);
    }
    currentInputModel = newmodel;
    currentOutputModel = null;
  }

  @Override
  public void registerRoot(SNode outputRoot, SNode inputNode) {
    if (nextStepToOriginalMap == null) {
      nextStepToOriginalMap = new HashMap<SNode, SNode>();
    }
    if (inputNode == null) {
      nextStepToOriginalMap.put(outputRoot, null);
      return;
    }
    SNode originalRoot = currentToOriginalMap.get(inputNode.getTopmostAncestor());
//    if(originalRoot == null && !currentToOriginalMap.containsKey(inputNode.getTopmostAncestor())) {
//      LOG.warning("consistency problem in dependencies map");
//    }
    nextStepToOriginalMap.put(outputRoot, originalRoot);
  }

  public void rootReplaced(SNode oldOutputRoot, SNode newOutputRoot) {
    if(nextStepToOriginalMap != null && nextStepToOriginalMap.containsKey(oldOutputRoot)) {
        SNode original = nextStepToOriginalMap.remove(oldOutputRoot);
      nextStepToOriginalMap.put(newOutputRoot, original);
    }
  }

  @Override
  public void updateModel(SModel newInputModel) {
    if (nextStepToOriginalMap != null) {
      currentToOriginalMap = nextStepToOriginalMap;

//      for(SNode newroot : newInputModel.roots()) {
//        if(!currentToOriginalMap.containsKey(newroot)) {
//          LOG.warning("unknown root in model " + newInputModel);
//        }
//      }

      nextStepToOriginalMap = null;
    } else {
      currentToOriginalMap = new HashMap<SNode, SNode>();
    }
    currentInputModel = newInputModel;
    currentOutputModel = null;
  }

  @Override
  public void dropModel() {
    nextStepToOriginalMap = null;
    currentOutputModel = null;
  }

  public void setOutputModel(SModel model, int majorStep, int minorStep) {
    currentOutputModel = model;
    myMajorStep = majorStep;
    myMinorStep = minorStep;
    myCachedModel = null;
  }

  public SNode getOriginalForOutput(SNode outputNode) {
    if (nextStepToOriginalMap == null) {
      return null;
    }
    return nextStepToOriginalMap.get(outputNode);
  }

  @Override
  public SNode getOriginalForInput(SNode inputNode) {
    if (currentToOriginalMap == null) {
      return null;
    }
    return currentToOriginalMap.get(inputNode);
  }

  @Override
  public RootDependenciesBuilder getRootBuilder(SNode inputNode) {
    if (inputNode == null || !inputNode.isRegistered()) {
      return myConditionalsBuilder;
    }
    inputNode = inputNode.getTopmostAncestor();
    SNode originalRoot = currentToOriginalMap.get(inputNode);
    if (originalRoot != null) {
      return myRootBuilders.get(originalRoot);
    } else if (currentToOriginalMap.containsKey(inputNode)) {
      return myConditionalsBuilder;
    }
    // shouldn't happen
    LOG.error("consistency problem in dependencies map", new IllegalStateException());
    return null;
  }

  @Override
  public GenerationDependencies getResult(IOperationContext operationContext, IncrementalGenerationStrategy incrementalStrategy) {
    return GenerationDependencies.fromIncremental(currentToOriginalMap, myAllBuilders, myModelHash, myParametersHash, operationContext, incrementalStrategy, myUnchangedSet.size(), myRequiredSet.size());
  }

  /* working with cache */

  private void loadCachedModel() throws BrokenCacheException {
    // TODO if(myMinorStep >= stepCount) copy from current input model
    int stepsCount = myCache.getMinorCount(myMajorStep);
    TransientModelWithMetainfo model = myCache.load(myMajorStep, myMinorStep >= stepsCount ? stepsCount - 1 : myMinorStep, currentOutputModel.getSModelReference());
    if (model == null) {
      throw new BrokenCacheException(currentOutputModel);
    }
    myCachedModel = model;
  }

  @Override
  public boolean isStepRequired() {
    return myCache != null && myMinorStep < myCache.getMinorCount(myMajorStep);
  }

  @Override
  public void reloadRequired(GeneratorMappings mappings) throws GenerationFailureException {
    if (myRequiredSet.isEmpty()) {
      return;
    }

    loadCachedModel();

    List<SNode> toCopy = new ArrayList<SNode>(myRequiredSet.size() * 2 + 16);
    List<MappingsMemento> toImport = new ArrayList<MappingsMemento>(myRequiredSet.size() * 2);

    for (SNode root : myCachedModel.getRoots()) {
      String originalId = myCachedModel.getOriginal(root);
      if (myRequiredSet.containsKey(originalId)) {
        SNode originalRoot = myRequiredSet.get(originalId);
        if (nextStepToOriginalMap == null) {
          nextStepToOriginalMap = new HashMap<SNode, SNode>();
        }
        nextStepToOriginalMap.put(root, originalRoot);
        toCopy.add(root);
        MappingsMemento val = myCachedModel.getMappingsMemento(originalId);
        if (val != null) {
          toImport.add(val);
        }
      }
    }

    for (SNode node : toCopy) {
      currentOutputModel.addRoot(node);
    }
    for (MappingsMemento val : toImport) {
      mappings.importPersisted(val, currentInputModel, currentOutputModel);
    }
  }

  @Override
  public void updateUnchanged(TransientModelWithMetainfo model) throws GenerationFailureException {
    if (myCache == null || myUnchangedSet.isEmpty() || currentOutputModel == null /* do not update after script */) {
      return;
    }

    if (myCachedModel == null) {
      loadCachedModel();
    }

    for (SNode root : myCachedModel.getRoots()) {
      String originalId = myCachedModel.getOriginal(root);
      if (myUnchangedSet.containsKey(originalId)) {
        model.getRoots().add(root);
        model.setOriginal(root.getSNodeId(), originalId);
        MappingsMemento mappingsMemento = myCachedModel.getMappingsMemento(originalId);
        if (mappingsMemento != null) {
          model.updateMappings(originalId, mappingsMemento);
        }
      }
    }
  }
}
