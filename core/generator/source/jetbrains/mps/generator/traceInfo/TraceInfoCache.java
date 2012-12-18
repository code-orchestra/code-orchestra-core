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
package jetbrains.mps.generator.traceInfo;

import com.intellij.ide.plugins.IdeaPluginDescriptor;
import com.intellij.ide.plugins.PluginManager;
import com.intellij.openapi.application.ApplicationManager;
import jetbrains.mps.InternalFlag;
import jetbrains.mps.cleanup.CleanupListener;
import jetbrains.mps.cleanup.CleanupManager;
import jetbrains.mps.generator.GenerationStatus;
import jetbrains.mps.generator.cache.XmlBasedModelCache;
import jetbrains.mps.generator.cache.XmlBasedModelCacheEx;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.reloading.ClassPathFactory;
import jetbrains.mps.reloading.IClassPathItem;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.traceInfo.DebugInfo;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jdom.Element;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

public class TraceInfoCache extends XmlBasedModelCacheEx<DebugInfo> {
  private static Logger LOG = Logger.getLogger(TraceInfoCache.class);

  public static final String TRACE_FILE_NAME = "trace.info";
  private final CleanupManager myCleanupManager;

  public TraceInfoCache(SModelRepository modelRepository, CleanupManager cleanupManager) {
    super(modelRepository);
    myCleanupManager = cleanupManager;
  }

  public static TraceInfoCache getInstance() {
    return ApplicationManager.getApplication().getComponent(TraceInfoCache.class);
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "Debug Info Cache";
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

  @Deprecated
  public String getCacheFileName() {
    return TRACE_FILE_NAME;
  }

  protected DebugInfo generateCache(GenerationStatus status) {
    return status.getDebugInfo();
  }

  @Nullable
  public DebugInfo get(@NotNull SModelDescriptor modelDescriptor) {
    // we do not want to acquire myModelsLock inside of myCache lock, so we get module here
    // see MPS-13899
    final IModule module = modelDescriptor.getModule();
    synchronized (myCache) {
      if (myCache.containsKey(modelDescriptor)) {
        return myCache.get(modelDescriptor);
      }

      myFilesToModels.put(getCacheFile(modelDescriptor), modelDescriptor);
      DebugInfo cache = readCache(modelDescriptor, module);
      myCache.put(modelDescriptor, cache);

      return cache;
    }
  }

  /**
   * @param modelDescriptor model descriptor to clear the cache for
   * @return whether the cached debug info was removed
   */
  @CodeOrchestraPatch
  public boolean clearCacheFor(@NotNull SModelDescriptor modelDescriptor) {
    synchronized (myCache) {
      return myCache.remove(modelDescriptor) != null;
    }
  }

  @Override
  protected DebugInfo readCache(SModelDescriptor sm) {
    LOG.warning("Should not use readCache method since it may cause a deadlock.\nSee MPS-13899", new RuntimeException());
    return readCache(sm, sm.getModule());
  }

  @CodeOrchestraPatch
  protected DebugInfo readCache(SModelDescriptor sm, IModule module) {
    // RF-809
    if (!(sm instanceof EditableSModelDescriptor)) {
      return null;
    }
    EditableSModelDescriptor editableSModelDescriptor = (EditableSModelDescriptor) sm;
    if (((EditableSModelDescriptor) sm).isPackaged()) {
      return null;
    }

    // RE-2693
    IClassPathItem classPathItem = null;
    String modelOutputPath = module.getOutputFor(sm);
    if (modelOutputPath != null) {
      try {
        classPathItem = ClassPathFactory.getInstance().createFromPath(modelOutputPath, module.getModuleFqName()); 
      } catch (IOException e) {
        // ignore
      }
    }
    if (classPathItem == null) {
      return null;
    }

    DebugInfo info = getCacheFromClassPathItem(sm, classPathItem);
    if (info == null) {
      if (InternalFlag.isInternalMode() && !(module.isCompileInMPS())) {
        for (IdeaPluginDescriptor plugin : PluginManager.getPlugins()) {
          info = TraceInfoCache.getInstance().getCacheFromClassloader(sm, plugin.getPluginClassLoader());
          if (info != null) {
            return info;
          }
        }
      }
    }
    return info;
  }

  @Nullable
  public DebugInfo getCacheFromClassPathItem(@NotNull SModelDescriptor sm, @NotNull IClassPathItem classPathItem) {
    URL url = classPathItem.getResource(traceInfoResourceName(sm));
    if (url == null) return null;
    InputStream stream = null;
    try {
      stream = url.openStream();
      if (stream == null) return null;
      return load(stream);
    } catch (IOException e) {
      return null;
    } finally {
      try {
        if (stream != null) {
          stream.close();
        }
      } catch (IOException e) {
        LOG.error(e);
      }
    }
  }

  @Nullable
  public DebugInfo getCacheFromClassloader(@NotNull SModelDescriptor sm, @NotNull ClassLoader classLoader) {
    InputStream stream = classLoader.getResourceAsStream(traceInfoResourceName(sm));
    if (stream == null) return null;
    try {
      return load(stream);
    } catch (IOException e) {
      return null;
    } finally {
      try {
        stream.close();
      } catch (IOException e) {
        LOG.error(e);
      }
    }
  }

  @CodeOrchestraPatch
  private String traceInfoResourceName(SModelDescriptor sm) {
    try {
      String moduleName = sm.getModule().toString();
      return sm.getLongName().replace(".", "/") + "/" + moduleName + "." + TRACE_FILE_NAME;
    } catch (Throwable t) {
      return sm.getLongName().replace(".", "/") + "/" + TRACE_FILE_NAME;
    }
  }

  @Override
  protected boolean isCache() {
    return false;
  }

  @Override
  protected Element toXml(DebugInfo debugInfo) {
    return debugInfo.toXml();
  }

  @Override
  protected DebugInfo fromXml(Element e) {
    return DebugInfo.fromXml(e);
  }
}
