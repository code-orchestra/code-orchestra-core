package jetbrains.mps.vcs.changesmanager;

/*Generated by MPS */

import com.intellij.openapi.vcs.impl.FileStatusProvider;
import com.intellij.openapi.project.Project;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import com.intellij.openapi.vcs.FileStatus;
import com.intellij.openapi.vfs.VirtualFile;
import jetbrains.mps.workbench.nodesFs.MPSNodeVirtualFile;
import jetbrains.mps.baseLanguage.closures.runtime.Wrappers;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.workbench.editors.MPSEditorUtil;
import jetbrains.mps.smodel.ModelAccess;
import com.intellij.openapi.editor.Document;

public class ChangesManagerFileStatusProvider implements FileStatusProvider {
  private Project myProject;
  private RootNodeFileStatusManager myRootNodeFileStatusProvider;

  public ChangesManagerFileStatusProvider(@NotNull Project project, @NotNull RootNodeFileStatusManager rootNodeFileStatusProvider) {
    myProject = project;
    myRootNodeFileStatusProvider = rootNodeFileStatusProvider;
  }

  @Nullable
  public FileStatus getFileStatus(final VirtualFile file) {
    if (file instanceof MPSNodeVirtualFile) {
      final MPSNodeVirtualFile nodeFile = (MPSNodeVirtualFile) file;
      final Wrappers._T<SNode> root = new Wrappers._T<SNode>(MPSEditorUtil.getCurrentEditedNode(myProject, nodeFile));
      if (root.value == null) {
        ModelAccess.instance().runReadAction(new Runnable() {
          public void run() {
            root.value = nodeFile.getNode();
          }
        });
      }
      if (root.value != null) {
        return myRootNodeFileStatusProvider.getStatus(root.value);
      }
    }
    return null;
  }

  public void refreshFileStatusFromDocument(VirtualFile file, Document doc) {
  }
}
