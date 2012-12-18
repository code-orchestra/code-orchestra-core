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

package com.intellij.psi.impl.cache.impl.id;

import com.intellij.ide.impl.ProjectUtil;
import com.intellij.lang.cacheBuilder.CacheBuilderRegistry;
import com.intellij.openapi.fileTypes.FileType;
import com.intellij.openapi.fileTypes.LanguageFileType;
import com.intellij.openapi.fileTypes.impl.AbstractFileType;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.util.indexing.*;
import com.intellij.util.io.DataExternalizer;
import com.intellij.util.io.InlineKeyDescriptor;
import com.intellij.util.io.KeyDescriptor;
import codeOrchestra.actionscript.index.IODataIndexer;
import codeOrchestra.actionscript.index.IndexIOProcessor;
import codeOrchestra.actionscript.index.IndexIOProcessorException;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.w3c.dom.Element;

import java.io.*;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Eugene Zhuravlev
 *         Date: Jan 16, 2008
 */
public class IdIndex extends FileBasedIndexExtension<IdIndexEntry, Integer> {
  // RE-3949
  @CodeOrchestraPatch
  public static final String INDEX_NAME = "IdIndex";
  @NonNls public static final ID<IdIndexEntry, Integer> NAME = ID.create(INDEX_NAME);

  private final FileBasedIndex.InputFilter myInputFilter = new FileBasedIndex.InputFilter() {
    public boolean acceptInput(final VirtualFile file) {
      final FileType fileType = file.getFileType();
      return isIndexable(fileType) && !ProjectUtil.isProjectOrWorkspaceFile(file, fileType);
    }
  };

  private final DataExternalizer<Integer> myValueExternalizer = new DataExternalizer<Integer>() {
    public void save(final DataOutput out, final Integer value) throws IOException {
      out.writeByte(value.intValue());
    }

    public Integer read(final DataInput in) throws IOException {
      return Integer.valueOf(in.readByte());
    }
  };

  private final KeyDescriptor<IdIndexEntry> myKeyDescriptor = new InlineKeyDescriptor<IdIndexEntry>() {
    public IdIndexEntry fromInt(int n) {
      return new IdIndexEntry(n);
    }

    public int toInt(IdIndexEntry idIndexEntry) {
      return idIndexEntry.getWordHashCode();
    }
  };

  // RE-3949
  @CodeOrchestraPatch
  private final DataIndexer<IdIndexEntry, Integer, FileContent> myIndexer = new IODataIndexer<IdIndexEntry, Integer>() {
    @NotNull
    @Override
    public Map<IdIndexEntry, Integer> mapInternal(final FileContent inputData) {
      final FileTypeIdIndexer indexer = IdTableBuilding.getFileTypeIndexer(inputData.getFileType());
      if (indexer != null) {
        return indexer.map(inputData);
      }
      return Collections.emptyMap();
    }

    @Override
    protected IndexIOProcessor<IdIndexEntry, Integer> getIndexIOProcessor() {
      return new IndexIOProcessor<IdIndexEntry, Integer>() {
        @Override
        public String serialize(Map<IdIndexEntry, Integer> idIndexEntryIntegerMap) {
          StringBuilder builder = new StringBuilder();
          for (IdIndexEntry entry : idIndexEntryIntegerMap.keySet()) {
            builder
              .append("\t<item e=\"")
              .append(String.valueOf(entry.getWordHashCode()))
              .append("\" i=\"")
              .append(String.valueOf(idIndexEntryIntegerMap.get(entry)))
              .append("\"/>\n");
          }
          return builder.toString();
        }

        @Override
        public Map<IdIndexEntry, Integer> load(List<Element> elementList, FileContent inputData) throws IndexIOProcessorException {
          if (elementList.isEmpty()) {
            return Collections.emptyMap();
          }

          Map<IdIndexEntry, Integer> result = new HashMap<IdIndexEntry, Integer>();

          for (Element element : elementList) {
            String eString = element.getAttribute("e");
            String iString = element.getAttribute("i");
            try {
              int eInteger = Integer.parseInt(eString);
              int iInteger = Integer.parseInt(iString);

              result.put(new IdIndexEntry(eInteger), iInteger);
            } catch (NumberFormatException e) {
              throw new IndexIOProcessorException();
            }
          }

          return result;
        }
      };
    }

    @Override
    protected String getIndexName() {
      return INDEX_NAME;
    }
  };

  public int getVersion() {
    return 9; // TODO: version should enumerate all word scanner versions and build version upon that set
  }

  public boolean dependsOnFileContent() {
    return true;
  }

  public ID<IdIndexEntry,Integer> getName() {
    return NAME;
  }

  public DataIndexer<IdIndexEntry, Integer, FileContent> getIndexer() {
    return myIndexer;
  }

  public DataExternalizer<Integer> getValueExternalizer() {
    return myValueExternalizer;
  }

  public KeyDescriptor<IdIndexEntry> getKeyDescriptor() {
    return myKeyDescriptor;
  }

  public FileBasedIndex.InputFilter getInputFilter() {
    return myInputFilter;
  }

  private static boolean isIndexable(FileType fileType) {
    return fileType instanceof LanguageFileType ||
      fileType instanceof AbstractFileType ||
      IdTableBuilding.isIdIndexerRegistered(fileType) ||
      CacheBuilderRegistry.getInstance().getCacheBuilder(fileType) != null;
  }

}
