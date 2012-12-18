package codeOrchestra.actionscript.wizards.newproject.fromexternal.idea;

import com.intellij.ide.wizard.CommitStepException;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalPanel;

import javax.swing.JLabel;

/**
 * @author Anton.I.Neverov
 */
public class ASIdeaAdditionalPanel extends ASExternalPanel {

  private ASIdeaSettings settings;

  public ASIdeaAdditionalPanel(ASIdeaSettings settings) {
    this.settings = settings;
    // TODO: implement
    JLabel label = new JLabel("idea additional panel");
    add(label);
  }

  @Override
  public void commit() {
    // TODO: implement
    System.out.println("Committed Idea additional step");
  }

  @Override
  public void check() throws CommitStepException {
    // TODO: implement
    System.out.println("Checked Idea additional step");
  }

  @Override
  public void init() {
    // TODO: implement
    System.out.println("Inited Idea additional step");
  }

  @Override
  protected void updateProjectName() {
    // TODO: implement
  }

}
