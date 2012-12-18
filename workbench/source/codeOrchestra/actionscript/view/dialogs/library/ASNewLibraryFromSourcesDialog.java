package codeOrchestra.actionscript.view.dialogs.library;

import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;

import javax.swing.JComponent;
import java.awt.Frame;

/**
 * @author Alexander Eliseyev
 */
public class ASNewLibraryFromSourcesDialog extends BaseDialog {
  public ASNewLibraryFromSourcesDialogContentPane myContentPane;

  public ASNewLibraryFromSourcesDialog(Frame frame) {
    super(frame, "New Library from Sources");
  }

  public ASNewLibraryFromSourcesDialog(Frame frame, String name) {
    super(frame, name);
  }

  public DialogDimensionsSettings.DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensionsSettings.DialogDimensions(100, 100, 600, 260);
  }

  public JComponent getMainComponent() {
    if (this.myContentPane == null) {
      this.myContentPane = new ASNewLibraryFromSourcesDialogContentPane();
      this.myContentPane.setDialog(this);
    }
    return this.myContentPane;
  }

  public boolean stretchMainComponent() {
    return false;
  }

  public String getSwcFilePath() {
    this.getMainComponent();
    return this.myContentPane.getSourcesPath();
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
    this.myContentPane.setSourcesPath(newValue);
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
