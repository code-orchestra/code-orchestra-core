package codeOrchestra.actionscript.view.dialogs.library;

import jetbrains.mps.ide.dialogs.BaseDialog;
import java.awt.Frame;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings;
import javax.swing.JComponent;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;

/**
 * @author Alexander Eliseyev
 */
public class ASNewLibraryDialog extends BaseDialog {
  public ASNewLibraryDialogContentPane myContentPane;

  public ASNewLibraryDialog(Frame frame) {
    super(frame, "New Library");
  }

  public DialogDimensionsSettings.DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensionsSettings.DialogDimensions(100, 100, 600, 160);
  }

  public JComponent getMainComponent() {
    if (this.myContentPane == null) {
      this.myContentPane = new ASNewLibraryDialogContentPane();
      this.myContentPane.setDialog(this);
    }
    return this.myContentPane;
  }

  public boolean stretchMainComponent() {
    return false;
  }

  public String getSwcFilePath() {
    this.getMainComponent();
    return this.myContentPane.getSwcFilePath();
  }

  public boolean getCompileInMPS() {
    this.getMainComponent();
    return this.myContentPane.getCompileInMPS();
  }

  public MPSProject getProject() {
    this.getMainComponent();
    return this.myContentPane.getProject();
  }

  public Solution getResult() {
    this.getMainComponent();
    return this.myContentPane.getResult();
  }

  public void setSwcFilePath(String newValue) {
    this.getMainComponent();
    this.myContentPane.setSwcFilePath(newValue);
  }

  public void setCompileInMPS(boolean newValue) {
    this.getMainComponent();
    this.myContentPane.setCompileInMPS(newValue);
  }

  public void setProject(MPSProject newValue) {
    this.getMainComponent();
    this.myContentPane.setProject(newValue);
  }

  public void setResult(Solution newValue) {
    this.getMainComponent();
    this.myContentPane.setResult(newValue);
  }

  @Button(name = "_OK", position = 0, defaultButton = true)
  public void buttonMethod0() {
    myContentPane.onOk();
  }

  @Button(name = "_Cancel", position = 1, defaultButton = false)
  public void buttonMethod1() {
    myContentPane.onCancel();
  }
}
