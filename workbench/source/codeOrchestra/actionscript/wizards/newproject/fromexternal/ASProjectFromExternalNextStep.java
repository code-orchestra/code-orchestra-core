package codeOrchestra.actionscript.wizards.newproject.fromexternal;

import com.intellij.ide.wizard.CommitStepException;
import codeOrchestra.actionscript.wizards.newproject.ASNewProjectStep;
import jetbrains.mps.workbench.dialogs.project.newproject.icons.Icons;
import org.jetbrains.annotations.NotNull;

import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JPanel;
import java.net.URL;

/**
 * @author Anton.I.Neverov
 */
public abstract class ASProjectFromExternalNextStep extends ASNewProjectStep {

  protected ASProjectFromExternalSettings settings;

  // This is returned by createControlComponent() to wizard and cannot be changed after that
  protected JPanel myPanel;

  // This is a child panel that we can change. We do it in refreshControlComponent()
  protected ASExternalPanel myInnerPanel;

  public ASProjectFromExternalNextStep(ASProjectFromExternalSettings settings) {
    super();
    this.settings = settings;
  }

  @Override
  public JComponent createControlComponent() {
    if (myPanel == null) {
      myPanel = new JPanel();
      myPanel.add(new JLabel("Type was not selected"));
    }
    return myPanel;
  }

  @NotNull
  @Override
  public String getImageText() {
    return "Import Project";
  }

  @Override
  protected void _check() throws CommitStepException {
    // Use specific check
    myInnerPanel.check();
  }

  public URL getImageURL() {
    return Icons.NEW_PROJECT_IMAGE_URL;
  }

  public void _init() {
    super._init();
    if (myInnerPanel != null) {
      myInnerPanel.init();
    }
  }

  public void _commit(boolean finishChosen) throws CommitStepException {
    super._commit(finishChosen);

    // Use specific commit
    myInnerPanel.commit();

    // Promote generic fields to higher level ( assuming that they are set in myInnerPanel.commit() )
    settings.setProjectName(settings.getType().getProjectName());
    settings.setProjectPath(settings.getType().getProjectPath());
  }

}
