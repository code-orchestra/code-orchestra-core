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
package jetbrains.mps.generator;

import com.intellij.openapi.project.Project;
import com.intellij.util.containers.ConcurrentHashSet;
import jetbrains.mps.generator.impl.plan.GenerationPlan;
import jetbrains.mps.project.StandaloneMPSContext;
import jetbrains.mps.smodel.*;
import org.jetbrains.annotations.NotNull;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Igor Alshannikov
 * Sep 19, 2005
 */
public class GenerationSessionContext extends StandaloneMPSContext {

  private static final Object COPYED_ROOTS = new Object();

  private SModel myOriginalInputModel;

  private final IOperationContext myInvocationContext;
  private final IGenerationTracer myGenerationTracer;
  private final TransientModelsModule myTransientModule;
  private final GenerationPlan myGenerationPlan;
  private final Map<String, Object> myParameters;

  private final Object NULL_OBJECT = new Object();

  private Map<Object, Object> myTransientObjects = new ConcurrentHashMap<Object, Object>();
  // objects survive between transient models but not between generation steps 
  private Map<Object, Object> myStepObjects = new ConcurrentHashMap<Object, Object>();
  // objects survive between transient models and between generation steps
  private Map<Object, Object> mySessionObjects = new ConcurrentHashMap<Object, Object>();

  // these objects survive through all steps of generation
  private Set<String> myUsedNames = new ConcurrentHashSet<String>();

  public GenerationSessionContext(IOperationContext invocationContext,
                                  IGenerationTracer generationTracer,
                                  TransientModelsModule transientModule,
                                  SModel inputModel,
                                  GenerationPlan generationPlan,
                                  Map<String, Object> parameters,
                                  GenerationSessionContext prevContext) {

    myInvocationContext = invocationContext;
    myGenerationTracer = generationTracer;
    myTransientModule = transientModule;
    myGenerationPlan = generationPlan;
    myParameters = parameters;

    if (prevContext != null) {
      myOriginalInputModel = prevContext.myOriginalInputModel;
      mySessionObjects = prevContext.mySessionObjects;
      myUsedNames = prevContext.myUsedNames;
    }

    if (!(inputModel instanceof TransientSModel)) {
      // new original input model
      myOriginalInputModel = inputModel;
      // forget history
      mySessionObjects.clear();
      myUsedNames.clear();
    }
  }

  public void clearTransientObjects() {
    myTransientObjects.clear();
  }

  public SModel getOriginalInputModel() {
    return myOriginalInputModel;
  }

  public <T> T getComponent(@NotNull Class<T> clazz) {
    return myInvocationContext.getComponent(clazz);
  }

  @NotNull
  public TransientModelsModule getModule() {
    return myTransientModule;
  }

  @NotNull
  public Project getProject() {
    return myInvocationContext.getProject();
  }

  @NotNull
  public IScope getScope() {
    return getModule().getScope();
  }

  public IOperationContext getInvocationContext() {
    return myInvocationContext;
  }

  public String toString() {
    return getClass().getName() + "-> " + "<auto-plan>" + "\ninvoked from: " + myInvocationContext;
  }

  public void putTransientObject(Object key, Object o) {
    myTransientObjects.put(key, o != null ? o : NULL_OBJECT);
  }

  public Object getTransientObject(Object key) {
    Object result = myTransientObjects.get(key);
    return result == NULL_OBJECT ? null : result;
  }

  public void putStepObject(Object key, Object o) {
    myStepObjects.put(key, o != null ? o : NULL_OBJECT);
  }

  public Object getStepObject(Object key) {
    Object result = myStepObjects.get(key);
    return result == NULL_OBJECT ? null : result;
  }

  public void putSessionObject(Object key, Object o) {
    mySessionObjects.put(key, o != null ? o : NULL_OBJECT);
  }

  public Object getSessionObject(Object key) {
    Object result = mySessionObjects.get(key);
    return result == NULL_OBJECT ? null : result;
  }

  private static String nodeUniqueId(SNode node) {
    StringBuilder sb = new StringBuilder();
    SNode parent = node.getParent();

    boolean sym = true;
    while (parent != null) {
      int index = parent.getIndexOfChild(node);
      if (index == 0) {
        sb.append(sym ? 'a' : '0');
      }
      while (index > 0) {
        int curr = sym ? 'a' + (index % 26) : '0' + (index % 10);
        index /= sym ? 26 : 10;
        sb.appendCodePoint(curr);
      }
      sym = !sym;
      node = parent;
      parent = node.getParent();
    }
    return sb.toString();
  }

  boolean useOldStyleUniqueName = "true".equals(System.getProperty("mps.olduniquename"));

  public String createUniqueNameOldStyle(String roughName, SNode contextNode) {
    if (contextNode != null) {
      // find topmost 'named' ancestor
      SNode topmostNamed = null;
      SNode node_ = contextNode;
      while (node_ != null) {
        if (node_.isInstanceOfConcept(SNodeUtil.concept_INamedConcept)) {
          topmostNamed = node_;
        }
        node_ = node_.getParent();
      }

      if (topmostNamed != null) {
        String name = topmostNamed.getName();
        if (name != null) {
          String contextSuffix = String.valueOf(name.hashCode());
          if (contextSuffix.length() > 4) {
            contextSuffix = contextSuffix.substring(contextSuffix.length() - 4); // make it a bit shorter
          }
          // modify roughName
          roughName = roughName + contextSuffix + "_";
        }
      }
    } // if(contextNode != null)

    String uniqueName;
    int count = 0;
    while (true) {
      uniqueName = roughName + (count++);
      if (!myUsedNames.contains(uniqueName)) break;
    }
    myUsedNames.add(uniqueName);
    return uniqueName;
  }

  public String createUniqueName(String roughName, SNode contextNode, SNode inputNode) {
    if (useOldStyleUniqueName) {
      return createUniqueNameOldStyle(roughName, contextNode);
    }

    String uniqueSuffix = null;

    if (contextNode != null) {
      // find topmost 'named' ancestor
      SNode topmostNamed = null;
      SNode node_ = contextNode;
      while (node_ != null) {
        if (node_.isInstanceOfConcept(SNodeUtil.concept_INamedConcept)) {
          topmostNamed = node_;
        }
        node_ = node_.getParent();
      }

      if (topmostNamed != null) {
        String name = topmostNamed.getName();
        if (name != null) {
          uniqueSuffix = Integer.toString(name.hashCode() >>> 1, Character.MAX_RADIX);
        }
      }
    } // if(contextNode != null)

    if (inputNode != null) {
      if (uniqueSuffix == null) {
        uniqueSuffix = nodeUniqueId(inputNode);
      } else {
        uniqueSuffix = uniqueSuffix + "_" + nodeUniqueId(inputNode);
      }
    }

    if (uniqueSuffix != null) {
      roughName = roughName.endsWith("_") ? roughName + uniqueSuffix : roughName + "_" + uniqueSuffix;
    }
    String uniqueName = roughName;

    if (uniqueSuffix == null || myUsedNames.contains(uniqueName)) {
      roughName += "_";
      for (int count = 0; ; count++) {
        uniqueName = roughName + count;
        if (!myUsedNames.contains(uniqueName)) break;
      }
    }
    myUsedNames.add(uniqueName);
    return uniqueName;
  }


  public GenerationPlan getGenerationPlan() {
    return myGenerationPlan;
  }

  public void clearCopiedRootsSet() {
    Set<SNode> set = (Set<SNode>) getStepObject(COPYED_ROOTS);
    if (set != null) {
      set.clear();
    }
  }

  public void registerCopiedRoot(SNode outputRootNode) {
    Set<SNode> set = (Set<SNode>) getStepObject(COPYED_ROOTS);
    if (set == null) {
      set = new HashSet<SNode>();
      putStepObject(COPYED_ROOTS, set);
    }
    set.add(outputRootNode);
  }

  public boolean isCopiedRoot(SNode inputNode) {
    Set<SNode> set = (Set<SNode>) getStepObject(COPYED_ROOTS);
    if (set == null) return false;
    return set.contains(inputNode);
  }

  public IGenerationTracer getGenerationTracer() {
    return myGenerationTracer;
  }

  private boolean keepTransientForMessageNavigation() {
    return !myInvocationContext.isTestMode();
  }

  public boolean keepTransientModel(SModel model, boolean force) {
    if (model instanceof TransientSModel && (force || keepTransientForMessageNavigation())) {
      return getModule().addModelToKeep(model, force);
    }
    return false;
  }

  public boolean isTransientModelToKeep(SModel model) {
    return getModule().isModelToKeep(model);
  }

  public void clearTransientModels() {
    getModule().clearUnused();
  }

  public Object getGenerationParameter(String name) {
    return myParameters == null ? null : myParameters.get(name);
  }
}
