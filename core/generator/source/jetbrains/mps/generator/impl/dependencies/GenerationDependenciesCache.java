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

import com.intellij.openapi.application.ApplicationManager;
import codeOrchestra.generator.CodeOrchestraGenerateManager;
import codeOrchestra.generator.CodeOrchestraGenerationContext;
import jetbrains.mps.cleanup.CleanupListener;
import jetbrains.mps.cleanup.CleanupManager;
import jetbrains.mps.generator.GenerationStatus;
import jetbrains.mps.generator.ModelGenerationStatusManager;
import jetbrains.mps.generator.cache.XmlBasedModelCache;
import jetbrains.mps.generator.cache.XmlBasedModelCacheEx;
import jetbrains.mps.generator.fileGenerator.FileGenerationUtil;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.IFile;
import org.jdom.Element;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.Arrays;

/**
 * Evgeny Gryaznov, May 14, 2010
 */
public class GenerationDependenciesCache extends XmlBasedModelCacheEx<GenerationDependencies> {
  private final CleanupManager myCleanupManager;

  public GenerationDependenciesCache(SModelRepository modelRepository, CleanupManager cleanupManager) {
    super(modelRepository);
    myCleanupManager = cleanupManager;
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "Generation Dependencies Cache";
  }

  @Override
  public void initComponent() {
    super.initComponent();
    myCleanupManager.addCleanupListener(new CleanupListener() {
      public void performCleanup() {
        cleanup();
      }
    });
  }

  public String getCacheFileName() {
    return "generated";
  }

  @Nullable
  @Override
  @CodeOrchestraPatch
  public GenerationDependencies get(@NotNull SModelDescriptor modelDescriptor) {
    synchronized (myCache) {
      // RE-3103
      CodeOrchestraGenerationContext codeOrchestraGenerationContext = CodeOrchestraGenerateManager.getSharedContext();
      if (codeOrchestraGenerationContext == null) {
        if (myCache.containsKey(modelDescriptor)) {
          return myCache.get(modelDescriptor);
        }
      }

      myFilesToModels.put(getCacheFile(modelDescriptor), modelDescriptor);
      GenerationDependencies cache = readCache(modelDescriptor);
      myCache.put(modelDescriptor, cache);

      return cache;
    }
  }

  @Nullable
  @Override
  @CodeOrchestraPatch
  protected IFile getCacheFile(SModelDescriptor modelDescriptor) {
    IModule m = null;

    // RE-3103
    CodeOrchestraGenerationContext codeOrchestraGenerationContext = CodeOrchestraGenerateManager.getSharedContext();
    if (codeOrchestraGenerationContext != null && codeOrchestraGenerationContext.isSingleOutputContext()) {
      m = MPSModuleRepository.getInstance().getModule(codeOrchestraGenerationContext.getRootModule());
    } else {
      m = modelDescriptor.getModule();
    }

    IFile cachesModuleDir = getCachesDirInternal(m, m.getOutputFor(modelDescriptor));
    if (cachesModuleDir == null) return null;
    IFile cachesDir = FileGenerationUtil.getDefaultOutputDir(modelDescriptor, cachesModuleDir);
    if (cachesDir == null) return null;

    return cachesDir.getDescendant(getCacheFileName(modelDescriptor));
  }

  protected Element toXml(GenerationDependencies dependencies) {
    return dependencies.toXml();
  }

  protected GenerationDependencies fromXml(Element e) {
    return GenerationDependencies.fromXml(e);
  }

  protected GenerationDependencies generateCache(GenerationStatus status) {
    return status.getDependencies();
  }

  @Override
  public SModelDescriptor invalidateCacheForFile(IFile file) {
    SModelDescriptor md = super.invalidateCacheForFile(file);
    if (md != null && md.getModule() != null) {
      ModelGenerationStatusManager.getInstance().invalidateData(Arrays.asList(md));
    }
    return md;
  }

  public static GenerationDependenciesCache getInstance() {
    return ApplicationManager.getApplication().getComponent(GenerationDependenciesCache.class);
  }
}
