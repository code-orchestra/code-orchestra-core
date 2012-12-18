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
package jetbrains.mps.ide.generator.index;

import com.intellij.openapi.util.text.StringUtil;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.util.indexing.FileBasedIndex.InputFilter;
import com.intellij.util.indexing.FileContent;
import com.intellij.util.indexing.ID;
import com.intellij.util.indexing.SingleEntryFileBasedIndexExtension;
import com.intellij.util.indexing.SingleEntryIndexer;
import com.intellij.util.io.DataExternalizer;
import com.intellij.util.io.EnumeratorStringDescriptor;
import codeOrchestra.actionscript.index.IndexIOProcessor;
import codeOrchestra.actionscript.index.IndexIOProcessorException;
import codeOrchestra.actionscript.index.SingleEntryIndexIOProcessor;
import jetbrains.mps.fileTypes.MPSFileTypeFactory;
import jetbrains.mps.generator.ModelDigestUtil;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.apache.commons.lang.StringUtils;
import org.jetbrains.annotations.NotNull;
import org.w3c.dom.Element;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ModelDigestIndex extends SingleEntryFileBasedIndexExtension<Map<String, String>> {
  // RE-3949
  @CodeOrchestraPatch
  public static final String INDEX_NAME = "ModelDigest";
  public static final ID<Integer, Map<String, String>> NAME = ID.create(INDEX_NAME);

  public ID<Integer, Map<String, String>> getName() {
    return NAME;
  }

  @Override
  public DataExternalizer<Map<String, String>> getValueExternalizer() {
    return new MapStringStringExternalizer();
  }

  // RE-3949
  @CodeOrchestraPatch
  @Override
  public SingleEntryIndexer<Map<String, String>> getIndexer() {
    return new SingleEntryIndexer<Map<String, String>>(false) {
      @Override
      protected Map<String, String> computeValue(@NotNull FileContent inputData) {
        final byte[] content = inputData.getContent();
        return ModelDigestUtil.getDigestMap(content);
      }

      @Override
      protected SingleEntryIndexIOProcessor<Map<String, String>> getSingleEntryIndexIOProcessor() {
        return new SingleEntryIndexIOProcessor<Map<String, String>>() {
          @Override
          public String serialize(Map<String, String> stringStringMap) {
            StringBuilder builder = new StringBuilder();
            for (String key : stringStringMap.keySet()) {
              builder
                .append("\t<item s1=\"")
                .append(key)
                .append("\" s2=\"")
                .append(stringStringMap.get(key))
                .append("\"/>\n");
            }
            return builder.toString();
          }

          @Override
          public Map<String, String> load(List<Element> elementList) throws IndexIOProcessorException {
            if (elementList.isEmpty()) {
              throw new IndexIOProcessorException();
            }

            Map<String, String> result = new HashMap<String, String>();

            for (Element element : elementList) {
              String str1 = element.getAttribute("s1");
              String str2 = element.getAttribute("s2");

              if (StringUtil.isEmptyOrSpaces(str1) || StringUtil.isEmptyOrSpaces(str2)) {
                throw new IndexIOProcessorException();
              }

              result.put(str1, str2);
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
  }

  public InputFilter getInputFilter() {
    return new InputFilter() {
      public boolean acceptInput(VirtualFile file) {
        return file.getFileType().equals(MPSFileTypeFactory.MODEL_FILE_TYPE);
      }
    };
  }

  public boolean dependsOnFileContent() {
    return true;
  }

  public int getVersion() {
    return 7;
  }

  public class MapStringStringExternalizer implements DataExternalizer<Map<String, String>> {
    private DataExternalizer<String> myInnerExternalizer = new EnumeratorStringDescriptor();

    public void save(DataOutput output, Map<String, String> map) throws IOException {
      output.writeInt(map.size());
      for (Map.Entry<String, String> entry : map.entrySet()) {
        myInnerExternalizer.save(output, entry.getKey());
        myInnerExternalizer.save(output, entry.getValue());
      }
    }

    public Map<String, String> read(DataInput input) throws IOException {
      Map<String, String> result = new HashMap<String, String>();
      for (int i = input.readInt(); i > 0; i--) {
        result.put(myInnerExternalizer.read(input), myInnerExternalizer.read(input));
      }
      return result;
    }
  }
}
