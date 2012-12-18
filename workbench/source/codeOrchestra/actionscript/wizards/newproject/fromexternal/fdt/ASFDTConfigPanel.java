package codeOrchestra.actionscript.wizards.newproject.fromexternal.fdt;

import com.intellij.ide.wizard.CommitStepException;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalPanel;

import javax.swing.JLabel;
import javax.swing.JPanel;

/**
 * @author Anton.I.Neverov
 */
public class ASFDTConfigPanel extends ASExternalPanel {

  private ASFDTSettings settings;

  public ASFDTConfigPanel(ASFDTSettings settings) {
    this.settings = settings;
    // TODO: implement
    JLabel label = new JLabel("fdt config panel");
    add(label);
  }

  @Override
  public void commit() {
    // TODO: implement
    System.out.println("Committed FDT config step");
  }

  @Override
  public void check() throws CommitStepException {
    // TODO: implement
    System.out.println("Checked FDT config step");
  }

  @Override
  public void init() {
    // TODO: implement
    System.out.println("Inited FDT config step");
  }

  @Override
  protected void updateProjectName() {
    // TODO: implement
  }

}
