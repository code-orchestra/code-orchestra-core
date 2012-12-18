package codeOrchestra.actionscript.wizards.newproject;

import com.intellij.ide.wizard.CommitStepException;
import jetbrains.mps.workbench.dialogs.project.newproject.icons.Icons;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URL;

/**
 * @author Alexander Eliseyev
 */
public class ASProjectSourceStep extends ASNewProjectStep {

  private ASNewProjectWizard wizard;
  private ASProjectSourceListener projectSourceListener;
  private ASProjectSource firstAvailableSource;

  public ASProjectSourceStep(ASProjectSourceListener projectSourceListener) {
    super();

    this.projectSourceListener = projectSourceListener;
  }

  void setWizard(ASNewProjectWizard wizard) {
    this.wizard = wizard;
  }

  @Override
  public boolean finishable() {
    return false;
  }

  public JComponent createControlComponent() {
    JPanel panel = new JPanel(new GridBagLayout());

    Insets buttonInsets = new Insets(3, 5, 3, 5);
    Insets labelInsets = new Insets(3, 18, 10, 10);

    ButtonGroup buttonGroup = new ButtonGroup();
    boolean setSelection = false;

    int i = 0;
    for (final ASProjectSource source : ASProjectSourceProvider.getInstance().getSources()) {
      GridBagConstraints c = new GridBagConstraints();
      c.fill = GridBagConstraints.BOTH;
      c.anchor = GridBagConstraints.NORTHEAST;
      c.insets = buttonInsets;
      c.gridx = 1;
      c.gridy = i++;
      c.weightx = 1;

      JRadioButton radioButton = new JRadioButton(source.getName());
      Font boldFont = radioButton.getFont().deriveFont(Font.BOLD);
      radioButton.setFont(boldFont);

      radioButton.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent e) {
          projectSourceListener.onSourceChange(source);
        }
      });

      buttonGroup.add(radioButton);
      radioButton.setEnabled(source.isEnabled());
      if (!setSelection && radioButton.isEnabled()) {
        firstAvailableSource = source;
        radioButton.setSelected(true);
        setSelection = true;
      }
      panel.add(radioButton, c);

      c = new GridBagConstraints();
      c.fill = GridBagConstraints.BOTH;
      c.anchor = GridBagConstraints.NORTHEAST;
      c.gridx = 1;
      c.insets = labelInsets;
      c.gridy = i++;
      c.weightx = 1;
      c.weighty = 0;      

      JLabel sourceDescLabel = new JLabel(source.getDescription());
      sourceDescLabel.setEnabled(radioButton.isEnabled());
      panel.add(sourceDescLabel, c);
    }

    GridBagConstraints c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.gridx = 1;
    c.gridy = i;
    c.weightx = 1;
    c.weighty = 1;

    panel.add(new JPanel(), c);

    return panel;
  }

  public void initFirstSource() {
    if (firstAvailableSource != null) {
      projectSourceListener.onSourceChange(firstAvailableSource);
    }
  }

  public URL getImageURL() {
    return Icons.NEW_PROJECT_IMAGE_URL;
  }

  @NotNull
  public String getImageText() {
    return "New Project";
  }

  @Nullable
  public String getURL() {
    return null;
  }

  public void _init() {
    super._init();

    /*
    myProjectName.setText(myOptions.getProjectName());
    myProjectPath.setPath(myOptions.getProjectPath());

    updateProjectPath();
    */
  }

  public void _check() throws CommitStepException {
    /*
    if (myProjectPath.getPath() == null) {
      throw new CommitStepException("Project path should be specified");
    }
    File projectDirFile = new File(myProjectPath.getPath());
    if (!(projectDirFile.isAbsolute())) {
      throw new CommitStepException("Path should be absolute");
    }
    if (myProjectName.getText().length() == 0) {
      throw new CommitStepException("Project name shouldn't be empty");
    }
    */
  }

  public void _commit(boolean finishChosen) throws CommitStepException {
    super._commit(finishChosen);

    /*
    myOptions.setProjectName(myProjectName.getText());
    myOptions.setProjectPath(myProjectPath.getPath());
    */
  }


}
