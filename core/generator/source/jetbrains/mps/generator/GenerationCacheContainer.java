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

import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.util.FileUtil;
import org.jetbrains.annotations.NotNull;

import java.io.*;

/**
 * Evgeny Gryaznov, Sep 21, 2010
 */
public interface GenerationCacheContainer {

  ModelCacheContainer getCache(@NotNull SModelDescriptor descriptor, String hash, boolean create);

  public interface ModelCacheContainer {

    @NotNull
    InputStream openStream(String name) throws IOException;

    @NotNull
    OutputStream createStream(String name) throws IOException;

    void commit();

    void revert();
  }

  public static class FileBasedGenerationCacheContainer implements GenerationCacheContainer {

    private static final Logger LOG = Logger.getLogger(FileBasedGenerationCacheContainer.class);

    @NotNull
    private File myGeneratorCaches;

    public FileBasedGenerationCacheContainer(@NotNull File generatorCaches) {
      this.myGeneratorCaches = generatorCaches;
    }

    @Override
    public ModelCacheContainer getCache(@NotNull SModelDescriptor descriptor, String hash, boolean create) {
      String modelId = descriptor.getSModelReference().getSModelId().toString();
      if(modelId == null || modelId.isEmpty()) {
        LOG.error("bad model id: " + modelId);
        return null;
      }

      modelId = modelId.replaceAll(":", "-");
      File modelCacheDir = new File(myGeneratorCaches, modelId);
      if(!modelCacheDir.exists()) {
        if(!create) {
          return null;
        }
        if(!modelCacheDir.mkdirs()) {
          LOG.error("generator cache: cannot create " + modelCacheDir.getAbsolutePath());
          return null;
        }
      }

      File hashDir = new File(modelCacheDir, create ? hash + ".gen" : hash);
      if(!hashDir.exists()) {
        if(!create) {
          return null;
        }
        if(!hashDir.mkdirs()) {
          LOG.error("generator cache: cannot create " + hashDir.getAbsolutePath());
          return null;
        }
      }
      if(create) {
        for(File file : hashDir.listFiles()) {
          file.delete();
        }
      }
      return new FileBasedModelCacheContainer(modelCacheDir, hashDir, hash, !create);
    }
  }

  public static class FileBasedModelCacheContainer implements ModelCacheContainer {

    private static final Logger LOG = Logger.getLogger(FileBasedModelCacheContainer.class);

    private final File myFolder;
    private final File myHashDir;
    private final String myHash;
    private final boolean myReadOnly;

    private FileBasedModelCacheContainer(File folder, File hashDir, String hash, boolean readOnly) {
      myFolder = folder;
      myHashDir = hashDir;
      myHash = hash;
      myReadOnly = readOnly;
    }

    @Override
    @NotNull
    public InputStream openStream(String name) throws IOException {
      return new FileInputStream(new File(myHashDir, name));
    }

    @Override
    @NotNull
    public OutputStream createStream(String name) throws IOException {
      if(myReadOnly) {
        throw new IOException("cannot create stream in read-only cache");
      }
      return new FileOutputStream(new File(myHashDir, name));
    }

    @Override
    public void commit() {
      if(myReadOnly) {
        return;
      }
      try {
        for (File child : myFolder.listFiles()) {
          if(!myHashDir.getName().equals(child.getName())) {
            FileUtil.delete(child);
          }
        }

        if(!myHashDir.renameTo(new File(myFolder, myHash))) {
          LOG.error("cannot rename " + myHashDir.getAbsolutePath() + " to " + myHash);
        }
      } catch(SecurityException ex) {
        LOG.error(ex);
      }
    }

    @Override
    public void revert() {
      if(myReadOnly) {
        return;
      }
      try {
        FileUtil.delete(myHashDir);
      } catch(SecurityException ex) {
        LOG.error(ex);
      }
    }
  }

}
