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

import jetbrains.mps.generator.impl.dependencies.GenerationDependencies;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModelDescriptor;
import org.jetbrains.annotations.NotNull;

import java.util.Collections;
import java.util.Map;

/**
 * Evgeny Gryaznov, Apr 26, 2010
 */
public class GenerationOptions {

  public static final int TRACE_OFF = 0;
  public static final int TRACE_STEPS = 1;
  public static final int TRACE_LANGS = 2;
  public static final int TRACE_TYPES = 3;

  public static /*final*/ boolean USE_PARALLEL_POOL = true;

  private final boolean mySaveTransientModels;
  private final boolean myStrictMode;
  private final boolean myRebuildAll;

  private final IncrementalGenerationStrategy myIncrementalStrategy;
  private final GenerationParametersProvider myParametersProvider;
  private boolean myKeepOutputModel;

  private final boolean myGenerateInParallel;
  private final int myNumberOfThreads;
  private final int myTracingMode;

  private final boolean myShowInfo;
  private final boolean myShowWarnings;
  private final boolean myKeepModelsWithWarnings;
  private final boolean myShowBadChildWarning;
  private final int myNumberOfModelsToKeep;

  private IGenerationTracer myGenerationTracer;

  private GenerationOptions(boolean strictMode, boolean saveTransientModels, boolean rebuildAll,
                            boolean generateInParallel, int numberOfThreads, int tracingMode, boolean showInfo,
                            boolean showWarnings, boolean keepModelsWithWarnings, int numberOfModelsToKeep,
                            @NotNull IGenerationTracer generationTracer, IncrementalGenerationStrategy incrementalStrategy,
                            GenerationParametersProvider parametersProvider, boolean keepOutputModel, boolean showBadChildWarning) {
    mySaveTransientModels = saveTransientModels;
    myGenerateInParallel = generateInParallel;
    myStrictMode = strictMode;
    myRebuildAll = rebuildAll;
    myNumberOfThreads = numberOfThreads;
    myTracingMode = tracingMode;
    myNumberOfModelsToKeep = numberOfModelsToKeep;
    myShowInfo = showInfo;
    myShowWarnings = showWarnings;
    myKeepModelsWithWarnings = keepModelsWithWarnings;
    myGenerationTracer = generationTracer;
    myIncrementalStrategy = incrementalStrategy;
    myParametersProvider = parametersProvider;
    myKeepOutputModel = keepOutputModel;
    myShowBadChildWarning = showBadChildWarning;
  }

  public boolean isSaveTransientModels() {
    return mySaveTransientModels;
  }

  public boolean isGenerateInParallel() {
    return myGenerateInParallel && myStrictMode && !myGenerationTracer.isTracing();
  }

  public boolean isStrictMode() {
    return myStrictMode;
  }

  public boolean isRebuildAll() {
    return myRebuildAll;
  }

  public boolean isShowErrorsOnly() {
    return !myShowInfo && !myShowWarnings;
  }

  public IncrementalGenerationStrategy getIncrementalStrategy() {
    return myIncrementalStrategy;
  }

  public IGenerationTracer getGenerationTracer() {
    return myGenerationTracer;
  }

  public int getNumberOfThreads() {
    return myNumberOfThreads;
  }

  public int getTracingMode() {
    if (isGenerateInParallel() && myTracingMode > TRACE_STEPS) {
      return TRACE_STEPS;
    }
    return myTracingMode;
  }

  public boolean isShowInfo() {
    return myShowInfo;
  }

  public boolean isShowWarnings() {
    return myShowWarnings;
  }

  public boolean isKeepModelsWithWarnings() {
    return myKeepModelsWithWarnings;
  }

  public boolean isShowBadChildWarning() {
    return myShowBadChildWarning;
  }

  public int getNumberOfModelsToKeep() {
    return myNumberOfModelsToKeep;
  }

  public GenerationParametersProvider getParametersProvider() {
    return myParametersProvider;
  }

  public static OptionsBuilder getDefaults() {
    return new OptionsBuilder();
  }

  public static OptionsBuilder fromSettings(IGenerationSettings settings) {
    return new OptionsBuilder().
      strictMode(settings.isStrictMode()).
      generateInParallel(settings.isParallelGenerator(), settings.getNumberOfParallelThreads()).
      reporting(settings.isShowInfo(), settings.isShowWarnings(), settings.isKeepModelsWithWarnings(), settings.getNumberOfModelsToKeep()).
      showBadChildWarning(settings.isShowBadChildWarning());
  }


  public boolean isKeepOutputModel() {
    return myKeepOutputModel;
  }

  /**
   * Options builder
   * Usage:
   * GenerationOptions.getDefaults().saveTransientModels(true).reporting(true, true, true, 4);
   */
  public static class OptionsBuilder {

    private boolean mySaveTransientModels = false;
    private boolean myStrictMode = false;
    private boolean myRebuildAll = true;
    private IncrementalGenerationStrategy myIncrementalStrategy = new IncrementalGenerationStrategy() {
      @Override
      public Map<String, String> getModelHashes(SModelDescriptor sm, IOperationContext operationContext) {
        return Collections.EMPTY_MAP;
      }

      @Override
      public GenerationCacheContainer getContainer() {
        return null;
      }

      @Override
      public GenerationDependencies getDependencies(SModelDescriptor sm) {
        return null;
      }

      @Override
      public boolean isIncrementalEnabled() {
        return false;
      }
    };
    private boolean myGenerateInParallel = false;
    private int myNumberOfThreads = 4;
    private int myTracingMode = TRACE_OFF;

    private boolean myShowInfo = false;
    private boolean myShowWarnings = true;
    private boolean myKeepModelsWithWarnings = true;
    private boolean myShowBadChildWarning = true;
    private int myNumberOfModelsToKeep = 16;

    private GenerationParametersProvider myParametersProvider = null;

    private IGenerationTracer myGenerationTracer = null;
    private boolean myKeepOutputModel;

    private OptionsBuilder() {
    }

    public GenerationOptions create() {
      if(myIncrementalStrategy == null) {
        throw new IllegalArgumentException("incremental strategy is not set");
      }

      return new GenerationOptions(myStrictMode, mySaveTransientModels, myRebuildAll,
        myGenerateInParallel, myNumberOfThreads, myTracingMode, myShowInfo, myShowWarnings,
        myKeepModelsWithWarnings, myNumberOfModelsToKeep,
        myGenerationTracer == null ? NullGenerationTracer.INSTANCE : myGenerationTracer,
        myIncrementalStrategy, myParametersProvider, myKeepOutputModel, myShowBadChildWarning);
    }

    public OptionsBuilder saveTransientModels(boolean saveTransientModels) {
      mySaveTransientModels = saveTransientModels;
      return this;
    }

    public OptionsBuilder parameters(GenerationParametersProvider parametersProvider) {
      myParametersProvider = parametersProvider;
      return this;
    }

    public OptionsBuilder strictMode(boolean strictMode) {
      myStrictMode = strictMode;
      return this;
    }

    public OptionsBuilder showBadChildWarning(boolean value) {
      myShowBadChildWarning = value;
      return this;
    }

    public OptionsBuilder rebuildAll(boolean rebuildAll) {
      myRebuildAll = rebuildAll;
      return this;
    }

    public OptionsBuilder incremental(@NotNull IncrementalGenerationStrategy incrementalStrategy) {
      myIncrementalStrategy = incrementalStrategy;
      return this;
    }

    public OptionsBuilder generateInParallel(boolean generateInParallel, int numberOfThreads) {
      myGenerateInParallel = generateInParallel;
      myNumberOfThreads = numberOfThreads;
      return this;
    }

    public OptionsBuilder reporting(boolean showInfo, boolean showWarnings, boolean keepModelsWithWarnings, int numberOfModelsToKeep) {
      myShowInfo = showInfo;
      myShowWarnings = showWarnings;
      myKeepModelsWithWarnings = keepModelsWithWarnings;
      myNumberOfModelsToKeep = numberOfModelsToKeep;
      return this;
    }

    public OptionsBuilder tracing(int tracingMode, IGenerationTracer generationTracer) {
      myTracingMode = tracingMode;
      myGenerationTracer = generationTracer;
      return this;
    }

    public OptionsBuilder keepOutputModel(boolean keepOutputModel) {
      myKeepOutputModel = keepOutputModel;
      return this;
    }
  }
}
