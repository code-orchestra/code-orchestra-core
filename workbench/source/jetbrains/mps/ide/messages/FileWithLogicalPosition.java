package jetbrains.mps.ide.messages;

import jetbrains.mps.vfs.IFile;

/**
 * Created by IntelliJ IDEA.
 * User: Sinchuk Sergey
 * Date: 13.06.2010
 * Time: 0:53:07
 * To change this template use File | Settings | File Templates.
 */
public class FileWithLogicalPosition {
  private IFile myFile;
  private int myLine;
  private int myColumn;

  public FileWithLogicalPosition(IFile file, int line, int column) {
    myFile = file;
    myLine = line;
    myColumn = column;
  }

  public IFile getFile() {
    return myFile;
  }

  public int getLine() {
    return myLine;
  }

  public int getColumn() {
    return myColumn;
  }
}
