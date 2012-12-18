package codeOrchestra.actionscript.yourkit;

import com.intellij.ide.BrowserUtil;

import javax.swing.JOptionPane;
import java.io.File;

/**
 * @author Anton.I.Neverov
 */
public class SavedSnapshotHandler {
  private static final String[] options = {"Send to Code Orchestra developers", "Browse to Profiling Data Folder", "OK"};

  private String path;
  private Type type;

  public SavedSnapshotHandler(String path, Type type) {
    this.path = path;
    this.type = type;
  }

  public void showDialogAndHandle() {
    int choice = JOptionPane.showOptionDialog(JOptionPane.getRootFrame(),
      type.message + path,
      "Success",
      JOptionPane.DEFAULT_OPTION,
      JOptionPane.INFORMATION_MESSAGE,
      null,
      options,
      options[0]);

    File file = new File(path);
    switch (choice) {
      case 0:
        AmazonS3Uploader.getInstance().uploadFile(file);
        break;
      case 1:
        BrowserUtil.launchBrowser(file.getParentFile().getAbsolutePath());
        break;
      case 2:
        // OK is pressed - do nothing
        break;
      default:
        // Do nothing
    }
  }

  public enum Type {
    CPU("CPU snapshot is saved to "),
    MEM("Memory dump is saved to ");

    public final String message;

    Type(String message) {
      this.message = message;
    }

  }
}
