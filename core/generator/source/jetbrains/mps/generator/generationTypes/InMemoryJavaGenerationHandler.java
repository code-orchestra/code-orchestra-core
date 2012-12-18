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
package jetbrains.mps.generator.generationTypes;

import com.intellij.openapi.progress.EmptyProgressIndicator;
import jetbrains.mps.compiler.CompilationResultAdapter;
import jetbrains.mps.compiler.CompilationResultListener;
import jetbrains.mps.compiler.JavaCompiler;
import jetbrains.mps.generator.GenerationCanceledException;
import jetbrains.mps.generator.GenerationStatus;
import jetbrains.mps.generator.IGeneratorLogger;
import jetbrains.mps.ide.progress.ITaskProgressHelper;
import jetbrains.mps.ide.progress.util.ModelsProgressUtil;
import jetbrains.mps.project.AbstractModule;
import jetbrains.mps.project.IModule;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.CompositeClassPathItem;
import jetbrains.mps.reloading.IClassPathItem;
import jetbrains.mps.smodel.*;
import jetbrains.mps.textGen.TextGenerationResult;
import jetbrains.mps.textGen.TextGenerationUtil;
import jetbrains.mps.util.Condition;
import jetbrains.mps.util.ConditionalIterable;
import jetbrains.mps.util.JavaNameUtil;
import jetbrains.mps.util.Pair;
import org.eclipse.jdt.core.compiler.CategorizedProblem;
import org.eclipse.jdt.internal.compiler.CompilationResult;
import org.jetbrains.annotations.Nullable;

import java.io.IOException;
import java.util.*;

/**
 * Keeps generation result in memory, compiles and optionally reloads.
 * <p/>
 * Evgeny Gryaznov, Jan 21, 2010
 */
public class InMemoryJavaGenerationHandler extends GenerationHandlerBase {
  private final boolean myReloadClasses;
  private final boolean myKeepSources;
  private JavaCompiler myCompiler;
  private List<CompilationResult> myResult;

  private final Map<String, String> mySources = new HashMap<String, String>();
  private final Set<String> myJavaSources = new HashSet<String>();
  private Set<IModule> myContextModules = new HashSet<IModule>();

  public InMemoryJavaGenerationHandler(boolean reloadClasses, boolean keepSources) {
    myReloadClasses = reloadClasses;
    myKeepSources = keepSources;
  }

  public InMemoryJavaGenerationHandler(boolean reloadClasses) {
    this(reloadClasses, false);
  }

  @Override
  public boolean canHandle(SModelDescriptor inputModel) {
    return SModelStereotype.isUserModel(inputModel);
  }

  @Override
  public void startGeneration(IGeneratorLogger logger) {
    super.startGeneration(logger);
    info("generating classes (in-memory)");
  }

  @Override
  public boolean handleOutput(IModule module, SModelDescriptor inputModel, GenerationStatus status, IOperationContext invocationContext, ITaskProgressHelper progressHelper) {
    info("handling output...");

    SModel outputModel = status.getOutputModel();
    if (outputModel != null) {
      boolean result = collectSources(module, inputModel, invocationContext, outputModel);

      if (!result) {
        info("there were errors.");
        return false;
      }
    }
    return true;
  }

  public void startModule(IModule module, List<SModelDescriptor> inputModels, IOperationContext operationContext, ITaskProgressHelper progressHelper) {
    progressHelper.setText2("module " + module);
  }

  public boolean compile(IOperationContext operationContext, List<Pair<IModule, List<SModelDescriptor>>> input, boolean generationOK, ITaskProgressHelper progressHelper) throws IOException, GenerationCanceledException {
    return compile(progressHelper);
  }

  @Override
  public long estimateCompilationMillis(List<Pair<IModule, List<SModelDescriptor>>> input) {
    long totalJob = 0;
    for (Pair<IModule, List<SModelDescriptor>> pair : input) {
      IModule module = pair.o1;
      if (module != null) {
        long jobTime = ModelsProgressUtil.estimateCompilationMillis(!module.isCompileInMPS());
        totalJob += jobTime;
      }
    }
    if (myReloadClasses) {
      totalJob += ModelsProgressUtil.estimateReloadAllTimeMillis();
    }
    return totalJob;
  }

  protected boolean collectSources(IModule module, SModelDescriptor inputModel, IOperationContext context, SModel outputModel) {
    boolean wereErrors = false;

    myContextModules.add(context.getModule());
    Iterable<SNode> iterable = new ConditionalIterable<SNode>(outputModel.roots(),new Condition<SNode>() {
      public boolean met(SNode node) {
        return node.getName() != null;
      }
    });
    for (SNode root : iterable) {
      INodeAdapter outputNode = BaseAdapter.fromNode(root);
      TextGenerationResult genResult = TextGenerationUtil.generateText(context, root);
      wereErrors |= genResult.hasErrors();
      String key = getKey(outputModel.getSModelReference(), root);
      Object result = genResult.getResult();
      if(result instanceof String) {
        mySources.put(key, (String) result);
        if (isJavaSource(outputNode)) {
          myJavaSources.add(key);
        }
      } else {
        // do we need binary files?
      }
    }

    return !wereErrors;
  }

  protected String getJavaNameFromKey(String key) {
    return key;
  }

  protected String getKey(SModelReference modelReference, SNode root) {
    return JavaNameUtil.packageNameForModelUID(modelReference) + "." + root.getName();
  }

  private static boolean isJavaSource(INodeAdapter outputNode) {
    String concept = outputNode.getConceptFQName();
    return concept.equals(BootstrapLanguages.concept_baseLanguage_ClassConcept) || concept.equals(BootstrapLanguages.concept_baseLanguage_Interface) ||
      concept.equals(BootstrapLanguages.concept_baseLanguage_EnumClass) || concept.equals(BootstrapLanguages.concept_baseLanguage_Annotation);
  }

  @Deprecated
  public boolean compile(ITaskProgressHelper progress) {
    return compile(progress, null);
  }

  public boolean compile(ITaskProgressHelper progress, @Nullable CompilationResultListener listener) {
    myCompiler = createJavaCompiler();

    for (String key : myJavaSources) {
      myCompiler.addSource(getJavaNameFromKey(key), mySources.get(key));
    }

    progress.setText2("Compiling...");
    MyCompilationResultListener innerListener = new MyCompilationResultListener();
    myCompiler.addCompilationResultListener(innerListener);
    if (listener != null) {
      myCompiler.addCompilationResultListener(listener);
    }
    myCompiler.compile(getClassPath(myContextModules));
    if (listener != null) {
      myCompiler.removeCompilationResultListener(listener);
    }
    myCompiler.removeCompilationResultListener(innerListener);
    progress.setText2("Compilation finished.");

    if (!myKeepSources) {
      mySources.clear();
      myJavaSources.clear();
    }
    myContextModules.clear();

    progress.setText2("reloading MPS classes...");
    if (myReloadClasses && !innerListener.hasErrors()) {
      ClassLoaderManager.getInstance().reloadAll(new EmptyProgressIndicator());
    }

    return !innerListener.hasErrors();
  }

  public List<CompilationResult> getCompilationResult() {
    return myResult;
  }

  public Map<String, String> getSources() {
    return mySources;
  }

  public JavaCompiler getCompiler() {
    return myCompiler;
  }

  protected JavaCompiler createJavaCompiler() {
    return new JavaCompiler();
  }

  protected CompositeClassPathItem getClassPath(Set<IModule> contextModules) {
    Set<IModule> notNullModules = new HashSet<IModule>();
    for (IModule m : contextModules) {
      if (m != null) {
        notNullModules.add(m);
      }
    }
    CompositeClassPathItem result = (CompositeClassPathItem) AbstractModule.getDependenciesClasspath(notNullModules, true);

    StringBuffer sb = new StringBuffer();
    sb.append("compiling with classpath : ");
    sb.append("\n");
    for (IClassPathItem item : result.getChildren()) {
      sb.append(item.toString());
      sb.append("\n");
    }
    sb.append("\n\n");
    LOG.info(sb.toString());

    return result;
  }

  public void clean() {
    mySources.clear();
    myJavaSources.clear();
    myContextModules.clear();
    myResult = null;
  }

  private class MyCompilationResultListener extends CompilationResultAdapter {
    private boolean myHasErrors = false;

    public void onCompilationResult(CompilationResult cr) {
      if (!cr.hasErrors()) return;
      myHasErrors = true;
      CategorizedProblem[] categorizedProblems = cr.getErrors();
      for (int i = 0; i < 3 && i < categorizedProblems.length; i++) {
        error("" + categorizedProblems[i]);
      }
      info("Compilation finished with errors.");
    }

    @Override
    public void onFatalError(String error) {
      myHasErrors = true;
      error("Fatal error: "+error);
      info("Compilation aborted.");
    }

    public boolean hasErrors() {
      return myHasErrors;
    }
  }
}
