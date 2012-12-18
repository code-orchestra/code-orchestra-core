package codeOrchestra.rgs.state.model.navigate;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.io.FileUtil;
import jetbrains.mps.ide.messages.FileWithLogicalPosition;

import java.io.File;
import java.io.Serializable;

/**
 * @author Alexander Eliseyev
 */
public class RelativePathFileWithPosition implements Serializable {

  public static RelativePathFileWithPosition fromFileWithLogicalPosition(FileWithLogicalPosition fileWithLogicalPosition, Project project) {
    File targetFile = new File(fileWithLogicalPosition.getFile().getPath());
    File projectDir = new File(project.getProjectFile().getParent().getPath());

    String relativePath = FileUtil.getRelativePath(projectDir, targetFile);

    return new RelativePathFileWithPosition(relativePath, fileWithLogicalPosition.getLine(), fileWithLogicalPosition.getColumn());
  }

  private String relativePath;
  private int myLine;
  private int myColumn;

  public RelativePathFileWithPosition(String relativePath, int line, int column) {
    this.relativePath = relativePath;
    myLine = line;
    myColumn = column;
  }

  public String getRelativePath() {
    return relativePath;
  }

  public int getLine() {
    return myLine;
  }

  public int getColumn() {
    return myColumn;
  }
}
