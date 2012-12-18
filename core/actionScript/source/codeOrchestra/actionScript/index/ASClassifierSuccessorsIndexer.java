package codeOrchestra.actionScript.index;

import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.util.indexing.*;
import com.intellij.util.io.DataExternalizer;
import com.intellij.util.io.KeyDescriptor;
import codeOrchestra.actionscript.index.IODataIndexer;
import codeOrchestra.actionscript.index.IndexIOProcessor;
import codeOrchestra.actionscript.index.IndexIOProcessorException;
import jetbrains.mps.fileTypes.MPSFileTypeFactory;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SReference;
import jetbrains.mps.workbench.actions.goTo.index.BaseSNodeDescriptorIndex;
import org.jetbrains.annotations.NotNull;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class ASClassifierSuccessorsIndexer extends FileBasedIndexExtension<SNodeId, List<SNodeId>> {
  // RE-3949
  public static final String INDEX_NAME = "codeOrchestra.ASClassifierSuccessorsIndexer";
  public static final ID<SNodeId, List<SNodeId>> NAME = ID.create(INDEX_NAME);

  private FileBasedIndex.InputFilter myInputFilter = new InputFilter();
  private KeyDescriptor<SNodeId> myKeyDescriptor = new SNodeIdDescriptor();
  private DataExternalizer<List<SNodeId>> myDataExternalizer = new ListExternalizer(myKeyDescriptor);
  private DataIndexer<SNodeId, List<SNodeId>, FileContent> myIndexer = new Indexer();

  public ID<SNodeId, List<SNodeId>> getName() {
    return NAME;
  }

  public int getVersion() {
    return 1;
  }

  public boolean dependsOnFileContent() {
    return true;
  }

  public FileBasedIndex.InputFilter getInputFilter() {
    return myInputFilter;
  }

  public KeyDescriptor<SNodeId> getKeyDescriptor() {
    return myKeyDescriptor;
  }

  public DataExternalizer<List<SNodeId>> getValueExternalizer() {
    return myDataExternalizer;
  }

  public DataIndexer<SNodeId, List<SNodeId>, FileContent> getIndexer() {
    return myIndexer;
  }

  private static class InputFilter implements FileBasedIndex.InputFilter {
    public boolean acceptInput(VirtualFile file) {
      return MPSFileTypeFactory.MODEL_FILE_TYPE.equals(file.getFileType());
    }
  }

  // RE-3949
  private static class Indexer extends IODataIndexer<SNodeId, List<SNodeId>> {

    @NotNull
    public Map<SNodeId, List<SNodeId>> mapInternal(final FileContent inputData) {
      final Map<SNodeId, List<SNodeId>> result = new HashMap();
      ModelAccess.instance().runIndexing(new Runnable() {
        public void run() {
          final SModel smodel = BaseSNodeDescriptorIndex.doModelParsing(inputData);
          if (smodel == null) {
            return;
          }

          int attemptsLeft = 7;
          final boolean[] successful = new boolean[1];

          // RE-2678
          // RE-2932
          while (!ModelAccess.instance().tryRead(new Runnable() {
            @Override
            public void run() {
              for (SNode nextNode : smodel.nodes()) {
                if (SNodeOperations.isInstanceOf(nextNode, "codeOrchestra.actionScript.structure.ClassConcept")) {
                  final SNode clazz = SNodeOperations.cast(nextNode, "codeOrchestra.actionScript.structure.ClassConcept");

                  // Superclass
                  SNode superclassClassifierType = SLinkOperations.getTarget(clazz, "superclass", true);
                  if ((superclassClassifierType != null)) {
                    safeMap(superclassClassifierType, clazz);
                  }

                  // Implemented interfaces
                  List<SNode> implementedInterfaces = SLinkOperations.getTargets(clazz, "implementedInterface", true);
                  for (SNode implementedInterface : implementedInterfaces) {
                    safeMap(implementedInterface, clazz);
                  }
                } else if (SNodeOperations.isInstanceOf(nextNode, "codeOrchestra.actionScript.structure.Interface")) {
                  // Extended interfaces
                  final SNode interfaze = SNodeOperations.cast(nextNode, "codeOrchestra.actionScript.structure.Interface");
                  List<SNode> extendedInterfaces = SLinkOperations.getTargets(interfaze, "extendedInterface", true);
                  for (SNode extendedInterface : extendedInterfaces) {
                    safeMap(extendedInterface, interfaze);
                  }
                }
              }

              successful[0] = true;
            }
          }) && attemptsLeft-- > 0) {
            Logger.getLogger(getClass()).warning("Attempting reindexing " + inputData.getFileName() + ": " + (attemptsLeft + 1));
            try {
              Thread.sleep(1000);
            } catch (InterruptedException e) {
              // ignore
            }
          }

          // CO-4808
          if (!successful[0]) {
            // Try to reindex it later
            FileBasedIndex.getInstance().requestReindex(inputData.getFile());
            Logger.getLogger(getClass()).warning("Couldn't reindex " + inputData.getFile().getPath() + " due to read lock being unavailable. Rescheduled");
          }
        }

        public void safeMap(SNode classifierType, SNode node) {
          if (SNodeOperations.isInstanceOf(classifierType, "codeOrchestra.actionScript.structure.DynamicClassifierType")) {
            return;
          }
          SReference sReference = classifierType.getReference("reference");
          safeMap(sReference, node);
        }

        private void safeMap(SReference reference, SNode node) {
          SNodeId key = SNodeId.createSNodeId(reference);
          if (key == null) {
            return;
          }
          List<SNodeId> successors = result.get(key);
          if (successors == null) {
            successors = new ArrayList();
            result.put(key, successors);
          }
          successors.add(new SNodeId(node));
        }
      });

      return result;
    }

    @Override
    protected IndexIOProcessor<SNodeId, List<SNodeId>> getIndexIOProcessor() {
      return new IndexIOProcessor<SNodeId, List<SNodeId>>() {
        @Override
        public String serialize(Map<SNodeId, List<SNodeId>> sNodeIdListMap) {
          StringBuilder builder = new StringBuilder();
          for (SNodeId key : sNodeIdListMap.keySet()) {
            builder.append("\t<item>\n\t\t<key>\n");
            appendSNodeIdData(builder, key);
            builder.append("\t\t</key>\n");
            for (SNodeId value : sNodeIdListMap.get(key)) {
              builder.append("\t\t<val>\n");
              appendSNodeIdData(builder, value);
              builder.append("\t\t</val>\n");
            }
            builder
              .append("\t</item>\n");
          }
          return builder.toString();
        }

        private void appendSNodeIdData(StringBuilder builder, SNodeId sNodeId) {
          builder
            .append("\t\t\t<ref>")
            .append(sNodeId.getModelReference())
            .append("</ref>\n\t\t\t<id>")
            .append(sNodeId.getNodeId())
            .append("</id>\n");
        }

        @Override
        public Map<SNodeId, List<SNodeId>> load(List<Element> elementList, FileContent inputData) throws IndexIOProcessorException {
          Map<SNodeId, List<SNodeId>> result = new HashMap<SNodeId, List<SNodeId>>();

          for (Element element : elementList) {
            SNodeId keyID = null;
            List<SNodeId> valueIDs = new ArrayList<SNodeId>();

            for (int i = 0; i < element.getChildNodes().getLength(); i++) {
              Node node = element.getChildNodes().item(i);
              if (node instanceof Element) {
                Element keyOrValue = (Element) node;
                if ("key".equals(keyOrValue.getTagName())) {
                  keyID = getSNodeId(keyOrValue);
                }
                if ("val".equals(keyOrValue.getTagName())) {
                  valueIDs.add(getSNodeId(keyOrValue));
                }
              }
            }

            if (keyID == null || valueIDs.isEmpty()) {
              throw new IndexIOProcessorException();
            }

            result.put(keyID, valueIDs);
          }

          return result;
        }

        private SNodeId getSNodeId(Element element) throws IndexIOProcessorException {
          String modelReference = null;
          String nodeId = null;
          for (int i = 0; i < element.getChildNodes().getLength(); i++) {
            Node node = element.getChildNodes().item(i);
            if (node instanceof Element) {
              Element refOrId = (Element) node;
              if ("ref".equals(refOrId.getTagName())) {
                modelReference = refOrId.getTextContent();
              }
              if ("id".equals(refOrId.getTagName())) {
                nodeId = refOrId.getTextContent();
              }
            }
          }

          if (modelReference == null || nodeId ==null) {
            throw new IndexIOProcessorException();
          }

          return new SNodeId(modelReference, nodeId);
        }
      };
    }

    @Override
    protected String getIndexName() {
      return INDEX_NAME;
    }
  }
}
