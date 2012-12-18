package codeOrchestra.actionscript.view.dialogs.library;

import jetbrains.mps.project.IModule;

import javax.swing.JComponent;
import java.awt.Frame;

/**
 * @author Anton.I.Neverov
 */
public class ASSwitchLibraryToSourcesDialog extends ASNewLibraryFromSourcesDialog {

  private String defaultName;
  private IModule oldModule;

  public ASSwitchLibraryToSourcesDialog(Frame frame, IModule oldModule, String defaultName) {
    super(frame, "Switch from SWC to Sources");
    this.defaultName = defaultName;
    this.oldModule = oldModule;
  }

  public IModule getOldModule() {
    return oldModule;
  }

  public JComponent getMainComponent() {
    if (this.myContentPane == null) {
      this.myContentPane = new ASSwitchLibraryToSourcesDialogContentPane(defaultName);
      this.myContentPane.setDialog(this);

    }
    return this.myContentPane;
  }

}
