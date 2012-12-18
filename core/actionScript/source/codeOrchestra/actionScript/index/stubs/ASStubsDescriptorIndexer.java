package codeOrchestra.actionScript.index.stubs;

import com.intellij.openapi.util.text.StringUtil;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.util.indexing.FileBasedIndex.InputFilter;
import com.intellij.util.indexing.FileContent;
import com.intellij.util.indexing.ID;
import com.intellij.util.indexing.SingleEntryFileBasedIndexExtension;
import com.intellij.util.indexing.SingleEntryIndexer;
import com.intellij.util.io.DataExternalizer;
import codeOrchestra.actionScript.stubs.ASClassPathItemRegistry;
import codeOrchestra.actionscript.index.IndexIOProcessorException;
import codeOrchestra.actionscript.index.SingleEntryIndexIOProcessor;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import jetbrains.mps.fileTypes.MPSFileTypeFactory;
import jetbrains.mps.ide.vfs.IdeaFileSystemProvider;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.SModelRoot.ManagerNotFoundException;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.model.ModelRootManager;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.persistence.IModelRootManager;
import jetbrains.mps.stubs.BaseStubModelRootManager;
import jetbrains.mps.stubs.IStubRootNodeDescriptor;
import jetbrains.mps.stubs.StubLocation;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.workbench.actions.goTo.index.ListEnumerator;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.w3c.dom.Element;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ASStubsDescriptorIndexer extends SingleEntryFileBasedIndexExtension<List<ASStubsDescriptor>> {
  // RE-3949
  public static final String INDEX_NAME = "ASStubsDescriptorIndexer";
  private static final Logger LOG = Logger.getLogger(ASStubsDescriptorIndexer.class);

  @NonNls
  public static final ID<Integer, List<ASStubsDescriptor>> NAME = ID.create(INDEX_NAME);

  private final MyIndexer myIndexer = new MyIndexer();
  private DataExternalizer<List<ASStubsDescriptor>> myValueExternalizer = new ListEnumerator<ASStubsDescriptor>(new ASStubsDescriptorKeyDescriptor());

  @Override
  public SingleEntryIndexer<List<ASStubsDescriptor>> getIndexer() {
    return myIndexer;
  }

  @Override
  public ID<Integer, List<ASStubsDescriptor>> getName() {
    return NAME;
  }

  @Override
  public DataExternalizer<List<ASStubsDescriptor>> getValueExternalizer() {
    return myValueExternalizer;
  }

  @Override
  public InputFilter getInputFilter() {
    return new InputFilter() {
      public boolean acceptInput(VirtualFile file) {
        return file.getFileType().equals(MPSFileTypeFactory.SOLUTION_FILE_TYPE);
      }
    };
  }

  @Override
  public int getVersion() {
    return 3;
  }

  private class MyIndexer extends SingleEntryIndexer<List<ASStubsDescriptor>> {
    private MyIndexer() {
      super(false);
    }

    @Override
    protected List<ASStubsDescriptor> computeValue(final @NotNull FileContent inputData) {
      final List<ASStubsDescriptor> result = new ArrayList<ASStubsDescriptor>();

      ModelAccess.instance().runIndexing(new Runnable() {
        public void run() {
          try {
            final IFile moduleFile = new IdeaFileSystemProvider().getFile(inputData.getFile());

            ModelAccess.instance().tryRead(new Runnable() {
              @Override
              public void run() {
                Solution solution = (Solution) MPSModuleRepository.getInstance().getModuleByFile(moduleFile);
                if (solution == null) {
                  return;
                }
                if (!SolutionUtils.isStubSolution(solution)) {
                  return;
                }
                ModelRootManager stubModelRootManager = SolutionUtils.getStubModelRootManager(solution);
                if (stubModelRootManager == null) {
                  return;
                }

                IModelRootManager modelRootManager;
                try {
                  modelRootManager = BaseStubModelRootManager.create(stubModelRootManager.getModuleId(), stubModelRootManager.getClassName());
                } catch (ManagerNotFoundException e) {
                  LOG.error(e);
                  return;
                }

                if (modelRootManager instanceof BaseStubModelRootManager) {
                  StubLocation stubLocation = SolutionUtils.getStubLocation(solution);
                  if (stubLocation != null) {
                    for (IStubRootNodeDescriptor iStubRootNodeDescriptor : ((BaseStubModelRootManager) modelRootManager).getRootNodeDescriptors(stubLocation)) {
                      ASStubsDescriptor stubsDescriptor = new ASStubsDescriptor(
                        iStubRootNodeDescriptor.getName(),
                        NameUtil.nodeFQName(iStubRootNodeDescriptor.getConcept())
                      );

                      result.add(stubsDescriptor);
                    }

                    ASClassPathItemRegistry.clear();
                  }
                }

                /*
                for (SModelDescriptor modelDescriptor : solution.getOwnModelDescriptors()) {
                  IModelRootManager modelRootManager = modelDescriptor.getModelRootManager();
                  if (modelRootManager instanceof BaseStubModelRootManager) {
                    BaseStubModelRootManager stubModelRootManager = (BaseStubModelRootManager) modelRootManager;
                    StubLocation stubLocation = SolutionUtils.getStubLocation(solution);
                    if (stubLocation != null) {
                      for (IStubRootNodeDescriptor iStubRootNodeDescriptor : stubModelRootManager.getRootNodeDescriptors(stubLocation)) {
                        ASStubsDescriptor stubsDescriptor = new ASStubsDescriptor(
                          iStubRootNodeDescriptor.getName(),
                          NameUtil.nodeFQName(iStubRootNodeDescriptor.getConcept())
                        );

                        result.add(stubsDescriptor);
                      }

                      ASClassPathItemRegistry.clear();
                    }
                  }
                }
                */

              }
            });
          } catch (Exception e) {
            LOG.error("Cannot index module " + inputData.getFileName(), e);
          }
        }
      });

      return result;
    }

    // RE-3949
    @Override
    protected SingleEntryIndexIOProcessor<List<ASStubsDescriptor>> getSingleEntryIndexIOProcessor() {
      return new SingleEntryIndexIOProcessor<List<ASStubsDescriptor>>() {
        @Override
        public String serialize(List<ASStubsDescriptor> asStubsDescriptors) {
          StringBuilder builder = new StringBuilder();
          for (ASStubsDescriptor descriptor : asStubsDescriptors) {
            builder
              .append("\t<item r=\"")
              .append(descriptor.getRootFqName())
              .append("\" c=\"")
              .append(descriptor.getConceptFqName())
              .append("\"/>\n");
          }
          return builder.toString();
        }

        @Override
        public List<ASStubsDescriptor> load(List<Element> elementList) throws IndexIOProcessorException {
          List<ASStubsDescriptor> result = new ArrayList<ASStubsDescriptor>();

          for (Element element : elementList) {
            String rootFqName = element.getAttribute("r");
            String conceptFqName = element.getAttribute("c");

            if (StringUtil.isEmptyOrSpaces(rootFqName) || StringUtil.isEmptyOrSpaces(conceptFqName)) {
              throw new IndexIOProcessorException();
            }

            result.add(new ASStubsDescriptor(rootFqName, conceptFqName));
          }

          return result;
        }
      };
    }

    // RE-3949
    @Override
    protected String getIndexName() {
      return INDEX_NAME;
    }
  }


}
