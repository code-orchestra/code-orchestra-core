/*
 * Copyright 2000-2009 JetBrains s.r.o.
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

package com.intellij.util.indexing;

import codeOrchestra.actionscript.index.IODataIndexer;
import codeOrchestra.actionscript.index.IndexIOProcessor;
import codeOrchestra.actionscript.index.IndexIOProcessorException;
import codeOrchestra.actionscript.index.SingleEntryIndexIOProcessor;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.w3c.dom.Element;

import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * Simplifies API and ensures that data key will always be equal to virtual file id
 *
 * @author Eugene Zhuravlev
 *         Date: Feb 18, 2009
 */
public abstract class SingleEntryIndexer<V> extends IODataIndexer<Integer, V> {
  private final boolean myAcceptNullValues;

  protected SingleEntryIndexer(boolean acceptNullValues) {
    myAcceptNullValues = acceptNullValues;
  }

  // RE-3949
  @CodeOrchestraPatch
  @NotNull
  public final Map<Integer, V> mapInternal(FileContent inputData) {
    if (inputData == null) {
      return Collections.emptyMap();
    }
    final V value = computeValue(inputData);
    if (value == null && !myAcceptNullValues) {
      return Collections.emptyMap();
    }
    final int key = Math.abs(FileBasedIndex.getFileId(inputData.getFile()));
    return Collections.singletonMap(key, value);
  }

  // RE-3949
  @CodeOrchestraPatch
  @Override
  protected IndexIOProcessor<Integer, V> getIndexIOProcessor() {
    return new IndexIOProcessor<Integer, V>() {
      @Override
      public String serialize(Map<Integer, V> integerVMap) {
        if (integerVMap.values().isEmpty()) {
          throw new RuntimeException("Empty map");
        }
        // Here we are sure that we work with SingletonMap that is not empty
        return getSingleEntryIndexIOProcessor().serialize(integerVMap.values().iterator().next());
      }

      @Override
      public Map<Integer, V> load(List<Element> elementList, FileContent inputData) throws IndexIOProcessorException {
        V result = getSingleEntryIndexIOProcessor().load(elementList);
        if (result == null) {
          throw new IndexIOProcessorException();
        }
        final int key = Math.abs(FileBasedIndex.getFileId(inputData.getFile()));
        return Collections.singletonMap(key, result);
      }
    };
  }

  // RE-3949
  @CodeOrchestraPatch
  protected abstract SingleEntryIndexIOProcessor<V> getSingleEntryIndexIOProcessor();

  protected abstract @Nullable V computeValue(@NotNull FileContent inputData);
}
