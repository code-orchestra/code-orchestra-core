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
package jetbrains.mps.ide.generator;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.options.ConfigurationException;
import com.intellij.openapi.options.SearchableConfigurable;
import jetbrains.mps.generator.GenerationOptions;
import jetbrains.mps.generator.IGenerationSettings;
import jetbrains.mps.ide.generator.GenerationSettings.MyState;
import org.jetbrains.annotations.Nls;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import javax.swing.JComponent;


@State(
  name = "GenerationSettings",
  storages = {
    @Storage(
      id = "other",
      file = "$APP_CONFIG$/generationSettings.xml"
    )
  }
)
public class GenerationSettings implements PersistentStateComponent<MyState>, ApplicationComponent, SearchableConfigurable, IGenerationSettings {

  public static GenerationSettings getInstance() {
    return ApplicationManager.getApplication().getComponent(GenerationSettings.class);
  }

  private MyState myState = new MyState();
  private GenerationSettingsPreferencesPage myPreferences;

  @NotNull
  public String getComponentName() {
    return "Generation Settings";
  }

  public void initComponent() {

  }

  public void disposeComponent() {

  }

  public MyState getState() {
    return myState;
  }

  public void loadState(MyState state) {
    myState = state;
  }

  @Nls
  public String getDisplayName() {
    return "Generator";
  }

  @Nullable
  public Icon getIcon() {
    return null;
  }

  @Nullable
  @NonNls
  public String getHelpTopic() {
    return "Generator";
  }

  public JComponent createComponent() {
    return getPreferences().getComponent();
  }

  public boolean isModified() {
    return getPreferences().isModified();
  }

  public void apply() throws ConfigurationException {
    getPreferences().commit();
  }

  public void reset() {
    getPreferences().update();
  }

  public void disposeUIResources() {

  }

  public String getId() {
    return "generator.manager";
  }

  public Runnable enableSearch(String option) {
    return null;
  }

  private GenerationSettingsPreferencesPage getPreferences() {
    if (myPreferences == null) {
      myPreferences = new GenerationSettingsPreferencesPage(this);
    }
    return myPreferences;
  }


  public boolean isSaveTransientModels() {
    return myState.mySaveTransientModels;
  }

  public void setSaveTransientModels(boolean saveTransientModels) {
    myState.mySaveTransientModels = saveTransientModels;
  }

  @Deprecated
  public boolean isGenerateRequirements() {
    return myState.myGenerateRequirements;
  }

  @Deprecated
  public void setGenerateRequirements(boolean generateRequirements) {
    myState.myGenerateRequirements = generateRequirements;
  }

  public GenerateRequirementsPolicy getGenerateRequirementsPolicy() {
    return myState.myGenerateRequirementsPolicy;
  }

  public void setGenerateRequirementsPolicy(GenerateRequirementsPolicy generateRequirementsPolicy) {
    myState.myGenerateRequirementsPolicy = generateRequirementsPolicy;
  }

  public boolean isCheckModelsBeforeGeneration() {
    return myState.myCheckModelsBeforeGeneration;
  }

  public void setCheckModelsBeforeGeneration(boolean checkModelsBeforeGeneration) {
    myState.myCheckModelsBeforeGeneration = checkModelsBeforeGeneration;
  }

  @Override
  public boolean isParallelGenerator() {
    return myState.myParallelGenerator;
  }

  public void setParallelGenerator(boolean useNewGenerator) {
    myState.myParallelGenerator = useNewGenerator;
  }

  @Override
  public boolean isStrictMode() {
    return myState.myStrictMode;
  }

  public void setStrictMode(boolean strictMode) {
    myState.myStrictMode = strictMode;
  }

  @Override
  public int getNumberOfParallelThreads() {
    return myState.myNumberOfParallelThreads;
  }

  public void setNumberOfParallelThreads(int coreNumber) {
    myState.myNumberOfParallelThreads = coreNumber;
  }

  @Override
  public int getPerformanceTracingLevel() {
    return myState.myPerformanceTracingLevel;
  }

  public void setPerformanceTracingLevel(int performanceTracingLevel) {
    myState.myPerformanceTracingLevel = performanceTracingLevel;
  }

  @Override
  public int getNumberOfModelsToKeep() {
    return myState.myNumberOfModelsToKeep;
  }

  public void setNumberOfModelsToKeep(int numberOfModelsToKeep) {
    myState.myNumberOfModelsToKeep = numberOfModelsToKeep;
  }

  @Override
  public boolean isShowInfo() {
    return myState.myShowInfo;
  }

  public void setShowInfo(boolean showInfo) {
    myState.myShowInfo = showInfo;
  }

  @Override
  public boolean isShowWarnings() {
    return myState.myShowWarnings;
  }

  public void setShowWarnings(boolean showWarnings) {
    myState.myShowWarnings = showWarnings;
  }

  @Override
  public boolean isKeepModelsWithWarnings() {
    return myState.myKeepModelsWithWarnings;
  }

  public void setKeepModelsWithWarnings(boolean keepModelsWithWarnings) {
    myState.myKeepModelsWithWarnings = keepModelsWithWarnings;
  }

  @Override
  public boolean isIncremental() {
    return myState.myIncremental;
  }

  public void setIncremental(boolean isIncremental) {
    myState.myIncremental = isIncremental;
  }

  @Override
  public boolean isIncrementalUseCache() {
    return myState.myIncrementalUseCache;
  }

  public void setIncrementalUseCache(boolean incrementalUseCache) {
    myState.myIncrementalUseCache = incrementalUseCache;
  }

  @Override
  public boolean isFailOnMissingTextGen() {
    return myState.myFailOnMissingTextGen;
  }

  public void setFailOnMissingTextGen(boolean fail) {
    myState.myFailOnMissingTextGen = fail;
  }

  public boolean isGenerateDebugInfo() {
    return myState.myGenerateDebugInfo;
  }

  public void setGenerateDebugInfo(boolean generateDebugInfo) {
    myState.myGenerateDebugInfo = generateDebugInfo;
  }

  public boolean isShowBadChildWarning() {
    return myState.myShowBadChildWarning;
  }

  public void setShowBadChildWarning(boolean showBadChildWarning) {
    myState.myShowBadChildWarning = showBadChildWarning;
  }

  public enum GenerateRequirementsPolicy {
    ALWAYS("Always generate"), ASK("Ask"), NEVER("Never generate");

    private String myRepresentation;

    private GenerateRequirementsPolicy(String representation) {
      myRepresentation = representation;
    }

    public String toString() {
      return myRepresentation;
    }
  }

  public static class MyState {
    private boolean mySaveTransientModels;
    private boolean myShowErrorsOnly;
    // This is and outdated
    @Deprecated
    private boolean myGenerateRequirements = true;
    private GenerateRequirementsPolicy myGenerateRequirementsPolicy = GenerateRequirementsPolicy.ASK;
    private boolean myCheckModelsBeforeGeneration = false;
    private boolean myParallelGenerator = false;
    private boolean myStrictMode = true;
    private int myNumberOfParallelThreads = 2;
    private int myPerformanceTracingLevel = GenerationOptions.TRACE_OFF;
    private int myNumberOfModelsToKeep = -1;
    private boolean myShowInfo = false;
    private boolean myShowWarnings = true;
    private boolean myKeepModelsWithWarnings = true;
    private boolean myIncremental = true;
    private boolean myIncrementalUseCache = false;
    private boolean myFailOnMissingTextGen = false;
    private boolean myGenerateDebugInfo = true;
    private boolean myShowBadChildWarning = true;

    public int getNumberOfModelsToKeep() {
      return myNumberOfModelsToKeep;
    }

    public void setNumberOfModelsToKeep(int numberOfModelsToKeep) {
      myNumberOfModelsToKeep = numberOfModelsToKeep;
    }

    public boolean isShowInfo() {
      return myShowInfo;
    }

    public void setShowInfo(boolean showInfo) {
      myShowInfo = showInfo;
    }

    public boolean isShowWarnings() {
      return myShowWarnings;
    }

    public void setShowWarnings(boolean showWarnings) {
      myShowWarnings = showWarnings;
    }

    public boolean isKeepModelsWithWarnings() {
      return myKeepModelsWithWarnings;
    }

    public void setKeepModelsWithWarnings(boolean keepModelsWithWarnings) {
      myKeepModelsWithWarnings = keepModelsWithWarnings;
    }

    public boolean isSaveTransientModels() {
      return mySaveTransientModels;
    }

    public void setSaveTransientModels(boolean saveTransientModels) {
      mySaveTransientModels = saveTransientModels;
    }

    public boolean isShowErrorsOnly() {
      return myShowErrorsOnly;
    }

    public void setShowErrorsOnly(boolean showErrorsOnly) {
      myShowErrorsOnly = showErrorsOnly;
    }

    public GenerateRequirementsPolicy getGenerateRequirementsPolicy() {
      return myGenerateRequirementsPolicy;
    }

    public void setGenerateRequirementsPolicy(GenerateRequirementsPolicy generateRequirementsPolicy) {
      myGenerateRequirementsPolicy = generateRequirementsPolicy;
    }

    public boolean isCheckModelsBeforeGeneration() {
      return myCheckModelsBeforeGeneration;
    }

    public void setCheckModelsBeforeGeneration(boolean checkModelsBeforeGeneration) {
      myCheckModelsBeforeGeneration = checkModelsBeforeGeneration;
    }

    public boolean isParallelGenerator() {
      return myParallelGenerator;
    }

    public void setParallelGenerator(boolean parallelGenerator) {
      myParallelGenerator = parallelGenerator;
    }

    public boolean isStrictMode() {
      return myStrictMode;
    }

    public void setStrictMode(boolean strictMode) {
      myStrictMode = strictMode;
    }

    public int getNumberOfParallelThreads() {
      return myNumberOfParallelThreads;
    }

    public void setNumberOfParallelThreads(int numberOfParallelThreads) {
      myNumberOfParallelThreads = numberOfParallelThreads;
    }

    public int getPerformanceTracingLevel() {
      return myPerformanceTracingLevel;
    }

    public void setPerformanceTracingLevel(int performanceTracingLevel) {
      myPerformanceTracingLevel = performanceTracingLevel;
    }

    public boolean isIncremental() {
      return myIncremental;
    }

    public void setIncremental(boolean incremental) {
      myIncremental = incremental;
    }

    public boolean isIncrementalUseCache() {
      return myIncrementalUseCache;
    }

    public void setIncrementalUseCache(boolean incrementalUseCache) {
      myIncrementalUseCache = incrementalUseCache;
    }

    public boolean isFailOnMissingTextGen() {
      return myFailOnMissingTextGen;
    }

    public void setFailOnMissingTextGen(boolean failOnMissingTextGen) {
      myFailOnMissingTextGen = failOnMissingTextGen;
    }

    public boolean isGenerateDebugInfo() {
      return myGenerateDebugInfo;
    }

    public void setGenerateDebugInfo(boolean generateDebugInfo) {
      myGenerateDebugInfo = generateDebugInfo;
    }

    public boolean isShowBadChildWarning() {
      return myShowBadChildWarning;
    }

    public void setShowBadChildWarning(boolean showBadChildWarning) {
      myShowBadChildWarning = showBadChildWarning;
    }
  }
}
