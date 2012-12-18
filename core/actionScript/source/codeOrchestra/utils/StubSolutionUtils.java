package codeOrchestra.utils;

import com.intellij.util.indexing.FileBasedIndex;
import codeOrchestra.actionScript.index.stubs.ASStubsDescriptorIndexer;
import codeOrchestra.actionscript.stubs.SWCStubsRegistry;
import jetbrains.mps.ide.vfs.VirtualFileUtils;
import jetbrains.mps.project.Solution;

/**
 * @author Anton.I.Neverov
 */
public class StubSolutionUtils {

  public static void invalidateStubSolutionCaches(Solution solution) {
    SWCStubsRegistry.getInstance().invalidateCache();
    FileBasedIndex.getInstance().requestReindex(VirtualFileUtils.getVirtualFile(solution.getDescriptorFile()));
    //FileBasedIndex.requestRebuild(ASStubsDescriptorIndexer.NAME);
  }

}
