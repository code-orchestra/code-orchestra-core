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
package jetbrains.mps.generator.impl;

import com.intellij.openapi.progress.ProgressIndicator;
import jetbrains.mps.generator.GenerationCanceledException;
import jetbrains.mps.generator.GenerationOptions;
import jetbrains.mps.generator.GenerationSessionContext;
import jetbrains.mps.generator.IGeneratorLogger;
import jetbrains.mps.generator.impl.IGenerationTaskPool.GenerationTask;
import jetbrains.mps.generator.impl.IGenerationTaskPool.ITaskPoolProvider;
import jetbrains.mps.generator.impl.dependencies.DependenciesBuilder;
import jetbrains.mps.generator.runtime.TemplateCreateRootRule;
import jetbrains.mps.generator.runtime.TemplateExecutionEnvironment;
import jetbrains.mps.generator.runtime.TemplateRootMappingRule;
import jetbrains.mps.generator.template.DefaultQueryExecutionContext;
import jetbrains.mps.generator.template.ITemplateGenerator;
import jetbrains.mps.generator.template.QueryExecutionContext;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.Pair;
import jetbrains.mps.util.performance.IPerformanceTracer;
import org.jetbrains.annotations.NotNull;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Evgeny Gryaznov, Feb 25, 2010
 */
public class ParallelTemplateGenerator extends TemplateGenerator {

  private static final boolean ROOT_PER_THREAD = true;

  private IGenerationTaskPool myPool;
  private List<RootGenerationTask> myTasks;
  private Map<Pair<SNode, SNode>, RootGenerationTask> myInputToTask;
  private Map<SNode, RootBasedQueryExectionContext> myRootContext;
  private Map<QueryExecutionContext, CompositeGenerationTask> contextToTask = new HashMap<QueryExecutionContext, CompositeGenerationTask>();

  public ParallelTemplateGenerator(ITaskPoolProvider taskPoolProvider, GenerationSessionContext operationContext, ProgressIndicator progressMonitor,
                                   IGeneratorLogger logger, RuleManager ruleManager,
                                   SModel inputModel, SModel outputModel, GenerationOptions options,
                                   DependenciesBuilder dependenciesBuilder, IPerformanceTracer performanceTracer) {
    super(operationContext, progressMonitor, logger, ruleManager, inputModel, outputModel, options, dependenciesBuilder, performanceTracer);
    myTasks = new ArrayList<RootGenerationTask>();
    myInputToTask = new ConcurrentHashMap<Pair<SNode, SNode>, RootGenerationTask>();
    myPool = taskPoolProvider.getTaskPool();
  }

  @Override
  protected void applyReductions(boolean isPrimary)
    throws GenerationCanceledException, GenerationFailureException {
    super.applyReductions(isPrimary);

    myPool.waitForCompletion();
    contextToTask = null;
    myRootContext = null;
    for (RootGenerationTask task : myTasks) {
      task.registerGeneratedRoot();
    }
  }

  @Override
  protected void createRootNodeByRule(final TemplateCreateRootRule rule, final TemplateExecutionEnvironment environment) throws GenerationCanceledException, GenerationFailureException {
    pushTask(new RootGenerationTask() {
      @Override
      public void run() throws GenerationCanceledException, GenerationFailureException {
        ParallelTemplateGenerator.super.createRootNodeByRule(rule, environment);
      }
    }, new Pair(null, rule.getRuleNode()), environment.getReductionContext().getQueryExecutor());
  }

  @Override
  protected void createRootNodeByRule(final TemplateRootMappingRule rule, final SNode inputNode, final boolean copyRootOnFailure, final TemplateExecutionEnvironment environment) throws GenerationCanceledException, GenerationFailureException {
    pushTask(new RootGenerationTask() {
      @Override
      public void run() throws GenerationCanceledException, GenerationFailureException {
        ParallelTemplateGenerator.super.createRootNodeByRule(rule, inputNode, copyRootOnFailure, environment);
      }
    }, new Pair(inputNode, rule.getRuleNode()), environment.getReductionContext().getQueryExecutor());
  }

  @Override
  protected void copyRootNodeFromInput(@NotNull final SNode inputRootNode, @NotNull final TemplateExecutionEnvironment environment) throws GenerationFailureException, GenerationCanceledException {
    pushTask(new RootGenerationTask() {
      @Override
      public void run() throws GenerationCanceledException, GenerationFailureException {
        ParallelTemplateGenerator.super.copyRootNodeFromInput(inputRootNode, environment);
      }
    }, new Pair(inputRootNode, null), environment.getReductionContext().getQueryExecutor());
  }

  @Override
  protected QueryExecutionContext getDefaultExecutionContext(SNode inputNode) {
    if (ROOT_PER_THREAD) {
      if (inputNode == null || !inputNode.isRegistered()) {
        return super.getDefaultExecutionContext(null);
      }
      inputNode = inputNode.getTopmostAncestor();
      if (inputNode.getModel() == getInputModel()) {
        RootBasedQueryExectionContext context;
        if (myRootContext == null) {
          myRootContext = new HashMap<SNode, RootBasedQueryExectionContext>();
          context = null;
        } else {
          context = myRootContext.get(inputNode);
        }
        if (context == null) {
          context = new RootBasedQueryExectionContext(inputNode, this);
          myRootContext.put(inputNode, context);
        }
        return context;
      }
    }
    return super.getDefaultExecutionContext(inputNode);
  }

  private void pushTask(RootGenerationTask task, Pair<SNode, SNode> pair, QueryExecutionContext executionContext) {
    myInputToTask.put(pair, task);
    myTasks.add(task);
    if (executionContext.isMultithreaded()) {
      myPool.addTask(task);
    } else {
      runTaskWithContext(task, executionContext);
    }
  }

  private void runTaskWithContext(RootGenerationTask task, QueryExecutionContext executionContext) {
    CompositeGenerationTask compositeTask;
    synchronized (contextToTask) {
      compositeTask = contextToTask.get(executionContext);
      if (compositeTask != null && compositeTask.addTask(task)) {
        return;
      }
      compositeTask = new CompositeGenerationTask();
      compositeTask.addTask(task);
      contextToTask.put(executionContext, compositeTask);
    }
    myPool.addTask(compositeTask);
  }

  @Override
  protected void registerInModel(SNode outputRoot, SNode inputNode, SNodePointer templateNode) {
    RootGenerationTask task = myInputToTask.get(new Pair(inputNode, templateNode));
    if (task == null) {
      showErrorMessage(inputNode, templateNode.getNode(), "internal: cannot find task for generated root");
    } else {
      task.addGeneratedRoot(outputRoot);
    }
  }

  @Override
  protected void checkGenerationCanceledFast() throws GenerationCanceledException {
    if (myPool.isCancelled()) throw new GenerationCanceledException();
  }

  @Override
  protected void checkMonitorCanceled() throws GenerationCanceledException {
    super.checkMonitorCanceled();
    if (myPool.isCancelled()) throw new GenerationCanceledException();
  }

  public abstract class RootGenerationTask implements GenerationTask {

    List<SNode> generated = null;

    @Override
    public boolean requiresReadAccess() {
      return true;
    }

    public void addGeneratedRoot(SNode root) {
      if (generated == null) {
        generated = Collections.singletonList(root);
      } else if (generated.size() == 1) {
        generated = new ArrayList<SNode>(generated);
        generated.add(root);
      } else {
        generated.add(root);
      }
    }

    public void registerGeneratedRoot() {
      if (generated == null) {
        return;
      }
      for (SNode root : generated) {
        myOutputRoots.add(root);
      }
    }
  }

  public static class CompositeGenerationTask implements GenerationTask {

    private Queue<RootGenerationTask> list = new LinkedList<RootGenerationTask>();
    private boolean isInShutdownMode = false;

    public synchronized boolean addTask(RootGenerationTask task) {
      if (isInShutdownMode) {
        return false;
      }
      return list.add(task);
    }

    private synchronized RootGenerationTask next() {
      if (list.isEmpty()) {
        isInShutdownMode = true;
        return null;
      }
      return list.remove();
    }

    @Override
    public void run() throws GenerationCanceledException, GenerationFailureException {
      RootGenerationTask next;
      while ((next = next()) != null) {
        next.run();
      }
    }

    @Override
    public boolean requiresReadAccess() {
      return true;
    }
  }

  private static class RootBasedQueryExectionContext extends DefaultQueryExecutionContext {

    public RootBasedQueryExectionContext(SNode root, ITemplateGenerator generator) {
      super(generator);
    }

    @Override
    public boolean isMultithreaded() {
      return false;
    }
  }
}
