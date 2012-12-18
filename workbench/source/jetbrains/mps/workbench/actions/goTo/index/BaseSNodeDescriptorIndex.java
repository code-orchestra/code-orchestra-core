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
package jetbrains.mps.workbench.actions.goTo.index;

import com.intellij.openapi.util.Key;
import com.intellij.openapi.util.text.StringUtil;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.util.indexing.FileBasedIndex;
import com.intellij.util.indexing.FileBasedIndex.InputFilter;
import com.intellij.util.indexing.FileContent;
import com.intellij.util.indexing.SingleEntryFileBasedIndexExtension;
import com.intellij.util.indexing.SingleEntryIndexer;
import com.intellij.util.io.DataExternalizer;
import codeOrchestra.actionscript.index.IndexIOProcessorException;
import codeOrchestra.actionscript.index.SingleEntryIndexIOProcessor;
import jetbrains.mps.fileTypes.MPSFileTypeFactory;
import jetbrains.mps.ide.vfs.IdeaFileSystemProvider;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.SNodeId.Foreign;
import jetbrains.mps.smodel.SNodeId.Regular;
import jetbrains.mps.smodel.persistence.def.ModelPersistence;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.workbench.actions.goTo.index.descriptor.BaseSNodeDescriptor;
import jetbrains.mps.workbench.actions.goTo.index.descriptor.SNodeDescriptor;
import org.jetbrains.annotations.NotNull;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import java.util.ArrayList;
import java.util.List;

public abstract class BaseSNodeDescriptorIndex extends SingleEntryFileBasedIndexExtension<List<BaseSNodeDescriptor>> {
  private static final Logger LOG = Logger.getLogger(BaseSNodeDescriptorIndex.class);
  private static final Key<SModel> PARSED_MODEL = new Key<SModel>("parsed-model");

  private final MyInputFilter myInputFilter = new MyInputFilter();
  private final MyIndexer myIndexer = new MyIndexer();
  private DataExternalizer<List<BaseSNodeDescriptor>> myValueExternalizer = new ListEnumerator<BaseSNodeDescriptor>(new EnumeratorSNodeDescriptor());

  public abstract Iterable<SNode> getRootsToIterate(SModel model);

  @Override
  public DataExternalizer<List<BaseSNodeDescriptor>> getValueExternalizer() {
    return myValueExternalizer;
  }

  @Override
  public SingleEntryIndexer<List<BaseSNodeDescriptor>> getIndexer() {
    return myIndexer;
  }

  public InputFilter getInputFilter() {
    return myInputFilter;
  }

  public boolean dependsOnFileContent() {
    return true;
  }

  public int getVersion() {
    return 6;
  }

  public int getCacheSize() {
    return DEFAULT_CACHE_SIZE;
  }

  public static SModel doModelParsing(FileContent inputData) {
    SModel model = inputData.getUserData(PARSED_MODEL);

    if (model == null) {
      //todo only roots loading
      IFile file = new IdeaFileSystemProvider().getFile(inputData.getFile());
      model = ModelPersistence.readModel(file, false);
      model.setLoading(true);
      inputData.putUserData(PARSED_MODEL, model);
    }
    return model;
  }

  // RE-3949
  @CodeOrchestraPatch
  public abstract String getNameString();

  // RE-3949
  @CodeOrchestraPatch
  private class MyIndexer extends SingleEntryIndexer<List<BaseSNodeDescriptor>> {
    private MyIndexer() {
      super(false);
    }

    protected List<BaseSNodeDescriptor> computeValue(@NotNull final FileContent inputData) {
      final List<BaseSNodeDescriptor> descriptors = new ArrayList<BaseSNodeDescriptor>();
      ModelAccess.instance().runIndexing(new Runnable() {
        public void run() {
          try {
            SModel model = doModelParsing(inputData);

            for (final SNode node : getRootsToIterate(model)) {
              String persistentName = node.getPersistentProperty(SNodeUtil.property_INamedConcept_name);
              String nodeName = (persistentName == null) ? "null" : persistentName;
              String conceptFqName = node.getConceptFqName();
              SModelReference modelRef = model.getSModelReference();
              SNodeId id = node.getSNodeId();
              BaseSNodeDescriptor value = SNodeDescriptor.fromModelReference(nodeName, conceptFqName, modelRef, id);
              descriptors.add(value);
            }
          } catch (Exception e) {
            LOG.error("Cannot index model file " + inputData.getFileName() + "; " + e.getMessage());
          }
        }
      });
      return descriptors;
    }

    @Override
    protected SingleEntryIndexIOProcessor<List<BaseSNodeDescriptor>> getSingleEntryIndexIOProcessor() {
      return new SingleEntryIndexIOProcessor<List<BaseSNodeDescriptor>>() {
        @Override
        public String serialize(List<BaseSNodeDescriptor> baseSNodeDescriptors) {
          StringBuilder builder = new StringBuilder();
          for (BaseSNodeDescriptor descr : baseSNodeDescriptors) {
            builder
              .append("\t<item>\n")
              .append("\t\t<name>")
              .append(descr.getNodeName())
              .append("</name>\n")
              .append("\t\t<msb>")
              .append(String.valueOf(descr.getMostSignificantBits()))
              .append("</msb>\n")
              .append("\t\t<lsb>")
              .append(String.valueOf(descr.getLeastSignificantBits()))
              .append("</lsb>\n")
              .append("\t\t<id>")
              .append(descr.getId().toString())
              .append("</id>\n")
              .append("\t\t<mr>")
              .append(descr.getModelReference().toString())
              .append("</mr>\n")
              .append("\t\t<cfqn>")
              .append(descr.getConceptFqName())
              .append("</cfqn>\n")
              .append("\t</item>\n");
          }
          return builder.toString();
        }

        @Override
        public List<BaseSNodeDescriptor> load(List<Element> elementList) throws IndexIOProcessorException {
          List<BaseSNodeDescriptor> descriptors = new ArrayList<BaseSNodeDescriptor>();

          for (Element element : elementList) {
            String name = null;
            String msb = null;
            String lsb = null;
            String id = null;
            String mr = null;
            String cfqn = null;

            for (int i = 0; i < element.getChildNodes().getLength(); i++) {
              Node node = element.getChildNodes().item(i);
              if (node instanceof Element) {
                Element prop = (Element) node;
                if ("name".equals(prop.getTagName())) {
                  name = prop.getTextContent();
                }
                if ("msb".equals(prop.getTagName())) {
                  msb = prop.getTextContent();
                }
                if ("lsb".equals(prop.getTagName())) {
                  lsb = prop.getTextContent();
                }
                if ("id".equals(prop.getTagName())) {
                  id = prop.getTextContent();
                }
                if ("mr".equals(prop.getTagName())) {
                  mr = prop.getTextContent();
                }
                if ("cfqn".equals(prop.getTagName())) {
                  cfqn = prop.getTextContent();
                }
              }
            }

            if (StringUtil.isEmptyOrSpaces(name)
              ||StringUtil.isEmptyOrSpaces(msb)
              ||StringUtil.isEmptyOrSpaces(lsb)
              ||StringUtil.isEmptyOrSpaces(id)
              ||StringUtil.isEmptyOrSpaces(mr)
              ||StringUtil.isEmptyOrSpaces(cfqn)) {
              throw new IndexIOProcessorException();
            }

            final String conceptFQName = cfqn;

            try {
              long msbLong = Long.parseLong(msb);
              long lsbLong = Long.parseLong(lsb);

              SNodeId sNodeId = SNodeId.fromString(id);
              if (sNodeId == null) {
                throw new IndexIOProcessorException();
              }

              final SModelReference sModelReference = SModelReference.fromString(mr);
              if (sModelReference.getSModelId() == null) {
                throw new IndexIOProcessorException();
              }

              // TODO: sModelRegerence is not fully checked!

              descriptors.add(new BaseSNodeDescriptor(name, msbLong, lsbLong, sNodeId) {
                @Override
                public String getConceptFqName() {
                  return conceptFQName;
                }

                @Override
                protected SModelReference calculateModelReference() {
                  return sModelReference;
                }
              });
            } catch (NumberFormatException e) {
              throw new IndexIOProcessorException();
            }
          }

          return descriptors;
        }
      };
    }

    @Override
    protected String getIndexName() {
      return getNameString();
    }
  }

  private static class MyInputFilter implements FileBasedIndex.InputFilter {
    public boolean acceptInput(VirtualFile file) {
      return (file.getFileType().equals(MPSFileTypeFactory.MODEL_FILE_TYPE));
    }
  }
}
