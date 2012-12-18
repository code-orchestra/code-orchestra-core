package codeOrchestra.actionscript.wizards.newproject.fromexternal.idea;

import com.intellij.ide.wizard.CommitStepException;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalPanel;
import jetbrains.mps.ide.common.PathField;
import org.apache.commons.lang.StringUtils;

import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.io.File;

/**
 * @author Anton.I.Neverov
 */
public class ASIdeaConfigPanel extends ASExternalPanel {

  private ASIdeaSettings settings;

  private PathField externalProjectField;
  private String externalProjectFieldPrevText;
  private JTextField projectNameField;
  private String projectNameFieldPrevText;
  private PathField projectPathField;

  public ASIdeaConfigPanel(ASIdeaSettings settings) {
    this.settings = settings;

    myImporter = new ASIdeaImporter();

    setLayout(new GridBagLayout());

    Insets defaultInsets = new Insets(0, 5, 0, 5);
    Insets tfInsets = new Insets(0, 5, 4, 5);

    GridBagConstraints c = createConstraints(defaultInsets, 0, 0);
    JLabel externalProjectPathLabel = new JLabel();
    externalProjectPathLabel.setText("Path to project directory:");
    add(externalProjectPathLabel, c);

    c = createConstraints(tfInsets, 0, 1);
    externalProjectField = createExternalProjectField();
    add(externalProjectField, c);

    c = createConstraints(defaultInsets, 0, 2);
    JLabel nameLabel = new JLabel();
    nameLabel.setText("New project name:");
    add(nameLabel, c);

    c = createConstraints(tfInsets, 0, 3);
    projectNameField = new JTextField();
    add(projectNameField, c);

    projectNameField.addCaretListener(new CaretListener() {
      public void caretUpdate(CaretEvent e) {
        updateProjectPath();
      }
    });

    projectNameField.addPropertyChangeListener(new PropertyChangeListener() {
      @Override
      public void propertyChange(PropertyChangeEvent evt) {
        updateProjectPath();
      }
    });

    c = createConstraints(defaultInsets, 0, 4);
    JLabel pathLabel = new JLabel();
    pathLabel.setText("New project path:");
    add(pathLabel, c);

    c = createConstraints(tfInsets, 0, 5);
    projectPathField = new PathField();
    add(projectPathField, c);

    c = createConstraints(defaultInsets, 0, 6);
    add(createCopyLibsCheckbox(), c);

    c = createConstraints(defaultInsets, 0, 7);
    add(createCopyConfigsCheckbox(), c);
  }

  @Override
  public void commit() {
    settings.setProjectName(projectNameField.getText());
    settings.setProjectPath(projectPathField.getPath());
    settings.setImporter(myImporter);
  }

  @Override
  public void check() throws CommitStepException {
    if (StringUtils.isEmpty(externalProjectField.getPath())) {
      throw new CommitStepException("Project path is empty");
    }
    if (!myImporter.projectIsFound()) {
      throw new CommitStepException("Project is not found in path " + externalProjectField.getPath());
    }
  }

  @Override
  public void init() {
    updateProjectPath();
    updateProjectName();
  }
  
  private GridBagConstraints createConstraints(Insets insets, int gridx, int gridy) {

    GridBagConstraints c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = insets;
    c.gridx = gridx;
    c.gridy = gridy;
    c.weightx = 1;
    
    return c;
  }

  private void updateProjectPath() {
    if (projectNameFieldPrevText == null || !(projectNameFieldPrevText.equals(projectNameField.getText()))) {

      String projectsPath = getProjectsDir();
      if (projectPathField.getPath() == null || projectPathField.getPath().length() == 0 || projectPathField.getPath().startsWith(projectsPath)) {
        projectPathField.setPath(projectsPath + File.separator + projectNameField.getText());
      }

      projectNameFieldPrevText = projectNameField.getText();
    }
  }

  protected void updateProjectName() {
    if (externalProjectFieldPrevText == null || !(externalProjectFieldPrevText.equals(externalProjectField.getPath()))) {

      String s = myImporter.getProjectName();
      if (s != null) {
        projectNameField.setText(createValidProjectName(s));
      } else if (projectNameField.getText() == null || projectNameField.getText().length() == 0) {
        projectNameField.setText(getDefaultProjectName());
      }

      externalProjectFieldPrevText = externalProjectField.getPath();
    }
  }

}
