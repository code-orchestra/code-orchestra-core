package jetbrains.mps.ide.messages.navigation;

import com.intellij.openapi.editor.ScrollType;
import com.intellij.openapi.fileEditor.FileEditor;
import com.intellij.openapi.fileEditor.FileEditorManager;
import com.intellij.openapi.fileEditor.TextEditor;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.vfs.LocalFileSystem;
import com.intellij.openapi.vfs.VirtualFile;
import jetbrains.mps.make.FileWithPosition;

public class FileWithPositionNavigationHandler implements INavigationHandler<FileWithPosition> {
  public void navigate(Project project, FileWithPosition pos, boolean focus, boolean select) {
    VirtualFile vf = LocalFileSystem.getInstance().findFileByIoFile(pos.getFile());

    if (vf == null) return;

    FileEditor[] result = FileEditorManager.getInstance(project).openFile(vf, true);

    if (result.length == 1 && result[0] instanceof TextEditor) {
      TextEditor te = (TextEditor) result[0];
      int offset = pos.getOffset();
      int maxOff = te.getEditor().getDocument().getTextLength();
      te.getEditor().getCaretModel().moveToOffset(Math.min(offset, maxOff));
      te.getEditor().getScrollingModel().scrollToCaret(ScrollType.MAKE_VISIBLE);
    }
  }
}
