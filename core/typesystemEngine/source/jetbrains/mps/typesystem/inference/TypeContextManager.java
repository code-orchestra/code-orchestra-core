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

import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.util.Computable;
import gnu.trove.THashMap;
import gnu.trove.THashSet;
import jetbrains.mps.lang.typesystem.runtime.performance.TypeCheckingContext_Tracer;
import jetbrains.mps.newTypesystem.TypeCheckingContextNew;
import jetbrains.mps.newTypesystem.TypesUtil;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.event.SModelListener;
import jetbrains.mps.smodel.event.SModelListener.SModelListenerPriority;
import jetbrains.mps.util.Pair;
import jetbrains.mps.util.performance.IPerformanceTracer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.*;

public class TypeContextManager implements ApplicationComponent {

  private static final jetbrains.mps.logging.Logger LOG = jetbrains.mps.logging.Logger.getLogger(TypeContextManager.class);

  private static TypeContextManager INSTANCE;
  private static boolean myReported = false;

  private final Object myLock = new Object();
  private Set<SModelDescriptor> myListeningForModels = new THashSet<SModelDescriptor>();
  private Map<SNode, Pair<TypeCheckingContext, List<ITypeContextOwner>>> myTypeCheckingContexts = new THashMap<SNode, Pair<TypeCheckingContext, List<ITypeContextOwner>>>(); //todo cleanup on reload (temp solution)
  private boolean myComputeInNormalMode = false;
  private ThreadLocal<Stack<Object>> myResolveStack = new ThreadLocal<Stack<Object>>();

  private TypeChecker myTypeChecker;
  private ClassLoaderManager myClassLoaderManager;

  private ThreadLocal<Set<SNode>> myResolveNodes = new ThreadLocal<Set<SNode>>();

  private SModelListener myModelListener = new SModelAdapter(SModelListenerPriority.PLATFORM) {
    public void beforeModelDisposed(SModel sm) {
      synchronized (myLock) {
        for (SNode node : new ArrayList<SNode>(myTypeCheckingContexts.keySet())) {
          if (sm == node.getModel()) {
            removeContextForNode(node);
          }
        }
      }
    }

    public void modelReplaced(SModelDescriptor md) {
      SModelReference modelRef = md.getSModelReference();
      synchronized (myLock) {
        for (SNode node : new ArrayList<SNode>(myTypeCheckingContexts.keySet())) {
          if (node.shouldHaveBeenDisposed() || modelRef == node.getModel().getSModelReference()) {
            removeContextForNode(node);
          }
        }
      }
    }
  };

  private SModelRepositoryAdapter mySModelRepositoryListener = new SModelRepositoryAdapter() {
    public void modelDeleted(SModelDescriptor modelDescriptor) {
      myListeningForModels.remove(modelDescriptor);
    }

    public void modelRemoved(SModelDescriptor modelDescriptor) {
      myListeningForModels.remove(modelDescriptor);
    }
  };

  private ReloadAdapter myReloadHandler = new ReloadAdapter() {
    public void unload() {
      clearForClassesUnload();
    }
  };

  @NotNull
  public String getComponentName() {
    return "Type Context Manager";
  }

  public static TypeContextManager getInstance() {
    return INSTANCE;
  }

  public TypeContextManager(TypeChecker typeChecker, ClassLoaderManager classLoaderManager) {
    myTypeChecker = typeChecker;
    myClassLoaderManager = ClassLoaderManager.getInstance();
  }

  public void initComponent() {
    if (INSTANCE != null) {
      throw new IllegalStateException("double initialization");
    }

    INSTANCE = this;
    myClassLoaderManager.addReloadHandler(myReloadHandler);
    SModelRepository.getInstance().addModelRepositoryListener(mySModelRepositoryListener);
  }

  public void disposeComponent() {
    SModelRepository.getInstance().removeModelRepositoryListener(mySModelRepositoryListener);
    myClassLoaderManager.removeReloadHandler(myReloadHandler);
    INSTANCE = null;
  }

  public void runResolveAction(Runnable r) {
    Object o = new Object();
    Stack<Object> stack = myResolveStack.get();
    if (stack == null) {
      stack = new Stack<Object>();
      myResolveStack.set(stack);
    }
    stack.push(o);
    try {
      r.run();
    } finally {
      Object popped = stack.pop();
      assert o == popped;
    }
  }

  public <T> T runResolveAction(Computable<T> computable) {
    Object o = new Object();
    Stack<Object> stack = myResolveStack.get();
    if (stack == null) {
      stack = new Stack<Object>();
      myResolveStack.set(stack);
    }
    stack.push(o);
    try {
      return computable.compute();
    } finally {
      Object popped = stack.pop();
      assert o == popped;
    }
  }

  public TypeCheckingContext createTypeCheckingContext(SNode node) {
    return new TypeCheckingContextNew(node, myTypeChecker);
  }

  public TypeCheckingContext createTracingTypeCheckingContext(SNode node) {
    return new TypeCheckingContext_Tracer(node, myTypeChecker);
  }

  public TypeCheckingContext getOrCreateContext(SNode node, ITypeContextOwner owner, boolean createIfAbsent) {
    if (node == null) return null;
    synchronized (myLock) {
      Pair<TypeCheckingContext, List<ITypeContextOwner>> contextWithOwners = myTypeCheckingContexts.get(node);
      if (contextWithOwners == null) {
        if (createIfAbsent) {
          TypeCheckingContext newTypeCheckingContext = createTypeCheckingContext(node);
          addModelListener(node);
          List<ITypeContextOwner> owners = new ArrayList<ITypeContextOwner>(1);
          contextWithOwners = new Pair<TypeCheckingContext, List<ITypeContextOwner>>(newTypeCheckingContext, owners);
          owners.add(owner);
          if (owners.size() > 100) {
            if (!myReported) {
              myReported = true;
              LOG.warning("Type checking context for node " + node.getPresentation() + " has too much owners");
            }
          }
          myTypeCheckingContexts.put(node, contextWithOwners);
          return newTypeCheckingContext;
        } else {
          return null;
        }
      } else {
        TypeCheckingContext context = contextWithOwners.o1;
        if (!contextWithOwners.o2.contains(owner)) {
          contextWithOwners.o2.add(owner);
        }
        return context;
      }
    }
  }

  public void removeOwnerForRootNodeContext(SNode node, ITypeContextOwner owner) {
    synchronized (myLock) {
      Pair<TypeCheckingContext, List<ITypeContextOwner>> contextWithOwners = myTypeCheckingContexts.get(node);
      if (contextWithOwners != null) {
        List<ITypeContextOwner> owners = contextWithOwners.o2;
        owners.remove(owner);
        if (owners.isEmpty()) {
          contextWithOwners.o1.dispose();
          myTypeCheckingContexts.remove(node);
        }
      }
    }
  }

  public void removeContextForNode(SNode node) {
    synchronized (myLock) {
      Pair<TypeCheckingContext, List<ITypeContextOwner>> contextWithOwners = myTypeCheckingContexts.get(node);
      if (contextWithOwners != null) {
        contextWithOwners.o1.dispose();
        myTypeCheckingContexts.remove(node);
      }
    }
  }

  public void clearForClassesUnload() {
    synchronized (myLock) {
      for (Pair<TypeCheckingContext, List<ITypeContextOwner>> context : myTypeCheckingContexts.values()) {
        context.o1.clear();
      }
    }
  }

  private void addModelListener(SNode node) {
    SModel sModel = node.getModel();
    SModelDescriptor descriptor = sModel.getModelDescriptor();
    if (descriptor != null && !myListeningForModels.contains(descriptor)) {
      descriptor.addModelListener(myModelListener);
      myListeningForModels.add(descriptor);
    }
  }

  private TypeCheckingContext createTypeCheckingContextForResolve(SNode node) {
    SNode root = node.getContainingRoot();
    if (root == null) {
      root = node.getTopmostAncestor();
    }
    return new TypeCheckingContextNew(root, myTypeChecker, true);
  }

  private Stack<Object> getMyResolveStack() {
    Stack<Object> resolve = myResolveStack.get();
    if (resolve == null) {
      resolve = new Stack<Object>();
      myResolveStack.set(resolve);
    }
    return resolve;
  }

  private Set<SNode> getMyResolveNodes() {
    Set<SNode> nodes = myResolveNodes.get();
    if (nodes == null) {
      nodes = new HashSet<SNode>();
      myResolveNodes.set(nodes);
    }
    return nodes;
  }

  @Nullable
  public SNode getTypeOf(final SNode node, boolean generationMode, IPerformanceTracer tracer) {
    if (node == null) return null;
    ITypeContextOwner owner = new ITypeContextOwner() {
    };
    SNode root = node.getContainingRoot();
    Stack<Object> resolve = getMyResolveStack();
    Set<SNode> resolveNodes = getMyResolveNodes();
    if (!resolve.isEmpty()) {
      if (resolveNodes.contains(node)) {
        return TypesUtil.createRuntimeErrorType();
      }
      resolveNodes.add(node);
      if (resolveNodes.size() > 10) {
        LOG.warning("There are too many nodes in resolve");
        resolveNodes.clear();
      }
    }
    try {
      if (generationMode) {
        TypeCheckingContext context = tracer == null ? createTypeCheckingContext(node) : createTracingTypeCheckingContext(node);
        if (context == null) return null;
        try {
          return context.getTypeOf_generationMode(node);
        } finally {
          context.dispose();
        }
      }
      //now we are not in generation mode

      TypeCheckingContext context = getOrCreateContext(root, owner, true);
      try {
        if (myComputeInNormalMode && context != null && context.isCheckedRoot(false)) {
          myComputeInNormalMode = false;
          SNode type = context.getTypeOf_normalMode(node);
          myComputeInNormalMode = true;
          return type;
        }
        if (!resolve.isEmpty()) {
          if (context == null || !context.isNonTypesystemComputation()) {
            TypeCheckingContext resolveContext = createTypeCheckingContextForResolve(node);
            SNode type = resolveContext.getTypeOf(node, myTypeChecker);
            resolveContext.dispose();
            return type;
          }
        }

        if (context == null) return null;
        return context.getTypeOf(node, myTypeChecker);
      } finally {
        removeOwnerForRootNodeContext(root, owner);
      }
    } finally {
      resolveNodes.remove(node);
    }
  }

  public void setComputeInNormalMode(boolean computeInNormalMode) {
    myComputeInNormalMode = computeInNormalMode;
  }
}
