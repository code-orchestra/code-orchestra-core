package codeOrchestra.actionScript.index.stubs;

import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.util.indexing.FileBasedIndex.InputFilter;
import com.intellij.util.indexing.FileContent;
import com.intellij.util.indexing.ID;
import com.intellij.util.indexing.SingleEntryFileBasedIndexExtension;
import com.intellij.util.indexing.SingleEntryIndexer;
import com.intellij.util.io.DataExternalizer;
import codeOrchestra.actionscript.index.IndexIOProcessorException;
import codeOrchestra.actionscript.index.SingleEntryIndexIOProcessor;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import jetbrains.mps.fileTypes.MPSFileTypeFactory;
import jetbrains.mps.ide.vfs.IdeaFileSystemProvider;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.workbench.actions.goTo.index.ListEnumerator;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.w3c.dom.Element;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author Alexander Eliseyev
 * @deprecated use ASStubsDescriptorIndexer instead
 */
@Deprecated
public class ASStubsIndexer extends SingleEntryFileBasedIndexExtension<List<String>> {

  private static final Logger LOG = Logger.getLogger(ASStubsIndexer.class);

  @NonNls
  public static final ID<Integer, List<String>> NAME = ID.create("ASStubsIndexer");

  private final MyIndexer myIndexer = new MyIndexer();
  private DataExternalizer<List<String>> myValueExternalizer = new ListEnumerator<String>(new StringKeyDescriptor());

  @Override
  public SingleEntryIndexer<List<String>> getIndexer() {
    return myIndexer;
  }

  @Override
  public ID<Integer, List<String>> getName() {
    return NAME;
  }

  @Override
  public DataExternalizer<List<String>> getValueExternalizer() {
    return myValueExternalizer;
  }

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

  private class MyIndexer extends SingleEntryIndexer<List<String>> {
    private MyIndexer() {
      super(false);
    }

    @Override
    protected List<String> computeValue(final @NotNull FileContent inputData) {
      final List<String> stubsFqNames = new ArrayList<String>();

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

                for (SModelDescriptor modelDescriptor : solution.getOwnModelDescriptors()) {
                  SModel model = modelDescriptor.getSModel();
                  for (SNode sNode : model.roots()) {
                    String fqName = NameUtil.longNameFromNamespaceAndShortName(model.getLongName(), sNode.getName());
                    if (fqName == null) {
                      continue;
                    }

                    if (!stubsFqNames.contains(fqName)) {
                      stubsFqNames.add(fqName);
                    }
                  }
                }
              }
            });
          } catch (Exception e) {
            LOG.error("Cannot index module " + inputData.getFileName() + "; " + e.getMessage());
          }
        }
      });

      return stubsFqNames;
    }

    // RE-3949
    @Override
    protected SingleEntryIndexIOProcessor<List<String>> getSingleEntryIndexIOProcessor() {
      return new SingleEntryIndexIOProcessor<List<String>>() {
        @Override
        public String serialize(List<String> strings) {
          // Class is deprecated so this is a stub
          return "";
        }

        @Override
        public List<String> load(List<Element> elementList) throws IndexIOProcessorException {
          // Class is deprecated so this is a stub
          return Collections.emptyList();
        }
      };
    }

    @Override
    protected String getIndexName() {
      return "";
    }
  }

}
