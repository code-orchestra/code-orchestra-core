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
package jetbrains.mps.generator.cache;

import jetbrains.mps.generator.fileGenerator.FileGenerationUtil;
import jetbrains.mps.generator.generationTypes.StreamHandler;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.util.JDOMUtil;
import jetbrains.mps.vfs.IFile;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.JDOMParseException;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.xml.sax.SAXParseException;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

public abstract class XmlBasedModelCache<T> extends BaseModelCache<T> {
  private static final Logger LOG = Logger.getLogger(XmlBasedModelCache.class);

  protected XmlBasedModelCache(SModelRepository modelRepository) {
    super(modelRepository);
  }

  protected abstract Element toXml(T t);

  protected abstract T fromXml(Element e);

  @Override
  @Nullable
  protected T readCache(SModelDescriptor sm) {
    IFile cacheFile = getCacheFile(sm);

    if (cacheFile == null || !cacheFile.exists()) return null;

    InputStream is = null;
    try {
      is = cacheFile.openInputStream();
      return load(is);
    } catch (FileNotFoundException e) {
      // ignoring it - VFS was not refreshed, file doesn't exists.
    } catch (IOException e) {
      /* not a valid XML? ignore */
      if (!(e.getCause() instanceof SAXParseException) && !(e.getCause() instanceof JDOMParseException)) {
        LOG.error(e);
      }
    } finally {
      try {
        if (is != null) {
          is.close();
        }
      } catch (IOException e) {
        LOG.error(e);
      }
    }
    return null;
  }

  @Override
  protected void saveCache(@NotNull T cache, SModelDescriptor model, StreamHandler handler) {
    handler.saveStream(getCacheFileName(), toXml(cache), isCache());
  }

  /**
   * Returns true iff this cache should be stored in source_gen.caches
   */
  protected boolean isCache() {
    return true;
  }

  protected T load(InputStream is) throws IOException {
    try {
      Document doc = JDOMUtil.loadDocument(is);
      return fromXml(doc.getRootElement());
    } catch (JDOMException e) {
      throw new IOException(e);
    }
  }

  @Nullable
  protected IFile getCacheFile(SModelDescriptor modelDescriptor) {
    IModule m = modelDescriptor.getModule();
    IFile cachesModuleDir = getCachesDirInternal(m, m.getOutputFor(modelDescriptor));
    if (cachesModuleDir == null) return null;
    IFile cachesDir = FileGenerationUtil.getDefaultOutputDir(modelDescriptor, cachesModuleDir);
    if (cachesDir == null) return null;

    return cachesDir.getDescendant(getCacheFileName());
  }
}
