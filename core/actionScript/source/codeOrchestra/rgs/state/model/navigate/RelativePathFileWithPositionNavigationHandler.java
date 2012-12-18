package codeOrchestra.rgs.state.model.navigate;

import com.intellij.openapi.editor.Document;
import com.intellij.openapi.editor.LogicalPosition;
import com.intellij.openapi.editor.ScrollType;
import com.intellij.openapi.fileEditor.FileEditor;
import com.intellij.openapi.fileEditor.FileEditorManager;
import com.intellij.openapi.fileEditor.TextEditor;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.vfs.VirtualFile;
import jetbrains.mps.ide.messages.navigation.INavigationHandler;
import jetbrains.mps.ide.vfs.VirtualFileUtils;

import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public class RelativePathFileWithPositionNavigationHandler implements INavigationHandler<RelativePathFileWithPosition> {

  @Override
  public void navigate(Project project, RelativePathFileWithPosition fileWithPosition, boolean focus, boolean select) {
    String relativePath = fileWithPosition.getRelativePath();
    File localFile = new File(project.getProjectFile().getParent().getPath(), relativePath);

    if (localFile.exists()) {
      VirtualFile vf = VirtualFileUtils.getVirtualFile(localFile.getPath());

      if (vf == null) return;

      FileEditor[] result = FileEditorManager.getInstance(project).openFile(vf, true);

      if (result.length == 1 && result[0] instanceof TextEditor) {
        TextEditor te = (TextEditor) result[0];
        int line = fileWithPosition.getLine();
        int column = fileWithPosition.getColumn();
        Document document = te.getEditor().getDocument();
        int maxLines = document.getLineCount();
        line = Math.min(Math.max(0, line), Math.max(0, maxLines - 1)); // RF-617
        int lineWidth = document.getLineEndOffset(line) - document.getLineStartOffset(line);
        column = Math.min(Math.max(0, column), lineWidth);
        LogicalPosition position = new LogicalPosition(line, column);
        te.getEditor().getCaretModel().moveToLogicalPosition(position);
        te.getEditor().getScrollingModel().scrollToCaret(ScrollType.MAKE_VISIBLE);
      }
    }
  }

}
