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
package jetbrains.mps.ide.findusages.caches;

import com.intellij.ide.caches.CacheUpdater;
import com.intellij.ide.caches.FileContent;
import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.roots.CollectingContentIterator;
import com.intellij.openapi.roots.ContentIterator;
import com.intellij.openapi.roots.ex.ProjectRootManagerEx;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.util.containers.HashSet;
import com.intellij.util.indexing.FileBasedIndex;
import com.intellij.util.indexing.IndexingStamp;
import codeOrchestra.actionscript.index.IODataIndexer;
import codeOrchestra.actionscript.index.IODataIndexerException;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.util.List;
import java.util.Set;

public class MPSUnindexedFilesUpdater implements CacheUpdater {
  private final FileBasedIndex myIndex;
  private ProjectRootManagerEx myManager;

  // RE-3949
  @CodeOrchestraPatch
  private boolean loadIndexMode = false;

  public MPSUnindexedFilesUpdater(FileBasedIndex index, ProjectRootManagerEx manager) {
    myIndex = index;
    myManager = manager;
  }

  // RE-3949
  @CodeOrchestraPatch
  public MPSUnindexedFilesUpdater(FileBasedIndex index, ProjectRootManagerEx manager, boolean loadIndex) {
    this(index, manager);
    loadIndexMode = loadIndex;

    if (loadIndexMode) {
      try {
        IODataIndexer.enterLoadMode();
      } catch (IODataIndexerException e) {
        // We should not try to exit load mode in updatingDone() and canceled() if we failed to enter it
        // We can get here if something is wrong with MPS.index
        // Also this class is instantiated twice on new project creation
        loadIndexMode = false;
      }
    }
  }

  public int getNumberOfPendingUpdateJobs() {
    return myIndex.getNumberOfPendingInvalidations();
  }

  public VirtualFile[] queryNeededFiles() {
    final CollectingContentIterator finder = myIndex.createContentIterator();

    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        iterateIndexableFiles(finder);
      }
    });
    final List<VirtualFile> files = finder.getFiles();
    return files.toArray(new VirtualFile[files.size()]);
  }

  public void processFile(final FileContent fileContent) {
    myIndex.indexFileContent(null, fileContent);
    IndexingStamp.flushCache();
  }

  // RE-3949
  // Changed private to public
  @CodeOrchestraPatch
  public void iterateIndexableFiles(final ContentIterator processor) {
    ProgressIndicator indicator = ProgressManager.getInstance().getProgressIndicator();
    if (indicator != null) {
      indicator.setText("Scanning files to index");
    }

    Set<VirtualFile> visitedRoots = new HashSet<VirtualFile>();
    for (VirtualFile root : CacheUtil.getIndexableRoots()) {
      if (visitedRoots.contains(root)) continue;
      visitedRoots.add(root);
      iterateRecursively(root, processor, indicator);
    }
  }

  private void iterateRecursively(final VirtualFile root, final ContentIterator processor, ProgressIndicator indicator) {
    if (root == null) return;
    if (!CacheUtil.checkFile(root,myManager)) return;

    if (indicator != null) {
      indicator.setText2(root.getPresentableUrl());
    }

    for (VirtualFile file : root.getChildren()) {
      if (file.isDirectory()) {
        iterateRecursively(file, processor, indicator);
      } else {
        processor.processFile(file);
      }
    }
  }

  @CodeOrchestraPatch
  public void updatingDone() {
    // RE-3949
    if (loadIndexMode) {
      IODataIndexer.exitLoadMode();
      loadIndexMode = false;
    }
  }

  @CodeOrchestraPatch
  public void canceled() {
    // RE-3949
    if (loadIndexMode) {
      IODataIndexer.exitLoadMode();
      loadIndexMode = false;
    }
  }
}
