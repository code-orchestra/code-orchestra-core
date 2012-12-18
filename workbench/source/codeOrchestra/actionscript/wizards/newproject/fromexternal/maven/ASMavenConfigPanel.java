package codeOrchestra.actionscript.wizards.newproject.fromexternal.maven;

import com.intellij.ide.wizard.CommitStepException;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalPanel;

import javax.swing.JLabel;
import javax.swing.JPanel;

/**
 * @author Anton.I.Neverov
 */
public class ASMavenConfigPanel extends ASExternalPanel {

  private ASMavenSettings settings;

  public ASMavenConfigPanel(ASMavenSettings settings) {
    this.settings = settings;
    // TODO: implement
    JLabel label = new JLabel("maven config panel");
    add(label);
  }

  @Override
  public void commit() {
    // TODO: implement
    System.out.println("Committed Maven config step");
  }

  @Override
  public void check() throws CommitStepException {
    // TODO: implement
    System.out.println("Checked Maven config step");
  }

  @Override
  public void init() {
    // TODO: implement
    System.out.println("Inited Maven config step");
  }

  @Override
  protected void updateProjectName() {
    // TODO: implement
  }

}
