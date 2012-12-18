package codeOrchestra.actionscript.index;

import com.intellij.ide.caches.CacheUpdater;
import com.intellij.openapi.progress.EmptyProgressIndicator;
import com.intellij.openapi.project.CacheUpdateRunner;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.roots.ContentIterator;
import com.intellij.openapi.roots.impl.ProjectRootManagerImpl;
import com.intellij.openapi.util.registry.Registry;
import com.intellij.openapi.util.registry.RegistryValue;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.openapi.vfs.newvfs.NewVirtualFile;
import com.intellij.psi.impl.cache.impl.id.IdIndex;
import com.intellij.psi.search.FilenameIndex;
import com.intellij.util.indexing.FileBasedIndex;
import com.intellij.util.io.storage.HeavyProcessLatch;
import codeOrchestra.actionScript.index.ASClassifierSuccessorsIndexer;
import codeOrchestra.actionScript.index.stubs.ASStubsDescriptorIndexer;
import jetbrains.mps.baseLanguage.index.ClassifierSuccessorsIndexer;
import jetbrains.mps.ide.findusages.caches.MPSUnindexedFilesUpdater;
import jetbrains.mps.ide.generator.index.ModelDigestIndex;
import jetbrains.mps.workbench.actions.goTo.index.RootNodeNameIndex;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class IndexIOUtil {

  public static final List<String> INDICES = new ArrayList<String>() {{
    add(ASStubsDescriptorIndexer.INDEX_NAME);
    add(ASClassifierSuccessorsIndexer.INDEX_NAME);
    add(IdIndex.INDEX_NAME);
    add(ClassifierSuccessorsIndexer.INDEX_NAME);
    add(ModelDigestIndex.INDEX_NAME);
    add(RootNodeNameIndex.INDEX_NAME);
  }};

  public static void rebuildAndSave(Project project) {
    FileBasedIndex fileBasedIndex = FileBasedIndex.getInstance();
    ProjectRootManagerImpl rootManagerImpl = ProjectRootManagerImpl.getInstanceImpl(project);
    final MPSUnindexedFilesUpdater mpsUnindexedFilesUpdater = new MPSUnindexedFilesUpdater(fileBasedIndex, rootManagerImpl);

    // Replace index files with empty ones
    fileBasedIndex.clearAllIndices();

    // Iterate over indexable files and make them not processed in terms of the FileBasedIndex
    mpsUnindexedFilesUpdater.iterateIndexableFiles(new ContentIterator() {
      @Override
      public boolean processFile(VirtualFile fileOrDir) {
        if (!fileOrDir.isDirectory() && fileOrDir instanceof NewVirtualFile) {
          // Flag:
          // com.intellij.util.indexing.FileBasedIndex
          // private static final int ALREADY_PROCESSED = 0x02
          ((NewVirtualFile) fileOrDir).setFlag(0x02, false);
        }
        return true;
      }
    });

    // Start indexer session when index data is dumped to xml-s
    IODataIndexer.enterSaveMode();

    // We process large number of files, so this code is extracted
    // from com.intellij.openapi.project.DumbServiceImpl.scheduleCacheUpdate()
    // in order to do it synchronously with this action anyway

    final CacheUpdateRunner runner = new CacheUpdateRunner(project, new ArrayList<CacheUpdater>() {{ add(mpsUnindexedFilesUpdater); }});

    EmptyProgressIndicator i = new EmptyProgressIndicator();

    // FileBasedIndex iterates over indexable files and finds that they are not processed
    runner.queryNeededFiles(i);

    // Set single-threaded way of indexing
    // It is used here: com.intellij.openapi.project.CacheUpdateRunner.processSomeFilesWhileUserIsInactive()
    RegistryValue registryValue = Registry.get("caches.indexerThreadsCount");
    int initialThreadsCount = registryValue.asInteger();
    registryValue.setValue(1);

    try {
      HeavyProcessLatch.INSTANCE.processStarted();

      // Do indexing synchronously
      runner.processFiles(i, false);
      runner.updatingDone();
    }
    finally {
      HeavyProcessLatch.INSTANCE.processFinished();

      // Restore previous value
      registryValue.setValue(initialThreadsCount);

      // Flush xml-s, close writers, finish session
      IODataIndexer.exitSaveMode();
    }
  }

  public static boolean loadFlagOn() {
    return "load".equals(System.getProperty("dataIndexerMode"));
  }

  public static boolean saveFlagOn() {
    return "save".equals(System.getProperty("dataIndexerMode"));
  }

}
