package codeOrchestra.actionscript;

import com.intellij.openapi.fileTypes.FileType;
import com.intellij.openapi.vfs.VirtualFile;
import jetbrains.mps.ide.projectPane.Icons;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;

/**
 * @author Alexander Eliseyev
 */
public class ASFileType implements FileType {

  @NotNull
  public String getName() {
    return "AS";
  }

  @NotNull
  public String getDescription() {
    return "ActionScript source file";
  }

  @NotNull
  public String getDefaultExtension() {
    return "as";
  }

  public Icon getIcon() {
    return Icons.TEXT_ICON;
  }

  public boolean isBinary() {
    return false;
  }

  public boolean isReadOnly() {
    return false;
  }

  public String getCharset(@NotNull VirtualFile virtualFile, byte[] bytes) {
    return null;
  }
}
