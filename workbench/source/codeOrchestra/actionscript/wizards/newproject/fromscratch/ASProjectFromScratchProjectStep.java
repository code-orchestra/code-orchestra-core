package codeOrchestra.actionscript.wizards.newproject.fromscratch;

import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.actionscript.wizards.newproject.ASNewProjectStep;
import com.intellij.ide.wizard.CommitStepException;
import codeOrchestra.actionscript.wizards.newproject.NewProjectPathHelper;
import codeOrchestra.actionscript.wizards.settings.ASNewProjectRootSettings;
import jetbrains.mps.ide.common.PathField;
import jetbrains.mps.util.FileUtil;
import jetbrains.mps.workbench.dialogs.project.newproject.icons.Icons;
import org.jetbrains.annotations.NotNull;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.TitledBorder;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.io.File;
import java.net.URL;
import java.util.List;
import java.util.ArrayList;

/**
 * @author Alexander Eliseyev
 */
public class ASProjectFromScratchProjectStep extends ASNewProjectStep {

  private ASProjectFromScratchSettings settings;

  private JTextField projectNameField;
  private PathField projectPathField;
  private JTextField moduleNameField;
  private PathField modulePathField;

  private String prevProjectPath;

  private List<JComponent> moduleSettingsComponents;
  private JCheckBox createModuleCheckBox;

  public ASProjectFromScratchProjectStep(ASProjectFromScratchSettings settings) {
    super();
    this.settings = settings;
  }

  public URL getImageURL() {
    return Icons.NEW_PROJECT_IMAGE_URL;
  }

  @NotNull
  public String getImageText() {
    return "From Scratch";
  }

  @Override
  public void _init() {
    super._init();

    updateProjectPath();
    //updateModulePath();
  }

  public void _check() throws CommitStepException {
    // Project
    if (projectPathField.getPath() == null) {
      throw new CommitStepException("Project path should be specified");
    }
    File projectDirFile = new File(projectPathField.getPath());
    if (!(projectDirFile.isAbsolute())) {
      throw new CommitStepException("Project path should be absolute");
    }
    if (projectNameField.getText().length() == 0) {
      throw new CommitStepException("Project name shouldn't be empty");
    }

    // RE-2567 - Check if the project already exists under the path specified
    File projectFile = new File(NewProjectPathHelper.getProjectFilePath(projectPathField.getPath(), projectNameField.getText()));
    if (projectFile.exists()) {
      throw new CommitStepException("Project already exists under the path specified");
    }

    // Module
    if (createModuleCheckBox.isSelected()) {
      if (modulePathField.getPath() == null) {
        throw new CommitStepException("Module path should be specified");
      }
      File moduleDirFile = new File(modulePathField.getPath());
      if (!(moduleDirFile.isAbsolute())) {
        throw new CommitStepException("Module path should be absolute");
      }
      String moduleName = moduleNameField.getText();
      // RE-3532
      if (!SolutionUtils.isValidModuleName(moduleName)) {
        throw new CommitStepException("Invalid module name");
      }
      if (moduleName.length() == 0) {
        throw new CommitStepException("Module name shouldn't be empty");
      }

      // RE-2567 - Check if the module already exists under the path specified
      File moduleFile = new File(NewProjectPathHelper.getSolutionFilePath(modulePathField.getPath(), moduleNameField.getText()));
      if (moduleFile.exists()) {
        throw new CommitStepException("Module already exists under the path specified");
      }
    }
  }

  public void _commit(boolean finishChosen) throws CommitStepException {
    super._commit(finishChosen);

    settings.setProjectName(projectNameField.getText());
    settings.setProjectPath(projectPathField.getPath());
    settings.setCreateModule(createModuleCheckBox.isSelected());

    settings.setModuleName(moduleNameField.getText());
    settings.setModulePath(modulePathField.getPath());
  }

  @Override
  public JComponent createControlComponent() {
    JPanel panel = new JPanel(new GridBagLayout());

    Insets defaultInsets = new Insets(0, 5, 0, 5);
    Insets tfInsets = new Insets(0, 5, 4, 5);

    GridBagConstraints c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = defaultInsets;
    c.gridx = 0;
    c.gridy = 0;
    c.weightx = 1;
    JLabel nameLabel = new JLabel();
    nameLabel.setText("Project name:");
    panel.add(nameLabel, c);

    c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = tfInsets;
    c.gridx = 0;
    c.gridy = 1;
    c.weightx = 1;
    projectNameField = new JTextField();
    projectNameField.setText(getDefaultProjectName());
    panel.add(projectNameField, c);

    c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = defaultInsets;
    c.gridx = 0;
    c.gridy = 2;
    c.weightx = 1;
    JLabel pathLabel = new JLabel();
    pathLabel.setText("Project path:");
    panel.add(pathLabel, c);

    c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = tfInsets;
    c.gridx = 0;
    c.gridy = 3;
    c.weightx = 1;
    projectPathField = new PathField();
    panel.add(projectPathField, c);

    c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = tfInsets;
    c.gridx = 0;
    c.gridy = 4;
    c.weightx = 1;
    createModuleCheckBox = new JCheckBox("Create module");
    createModuleCheckBox.setSelected(true);
    createModuleCheckBox.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        for (JComponent component : moduleSettingsComponents) {
          component.setEnabled(createModuleCheckBox.isSelected());
        }
      }
    });
    panel.add(createModuleCheckBox, c);

    c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = tfInsets;
    c.gridx = 0;
    c.gridy = 5;
    c.weightx = 1;
    panel.add(createModulePanel(), c);

    // Spacer
    c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = tfInsets;
    c.gridx = 0;
    c.gridy = 6;
    c.weightx = 1;
    c.weighty = 1;
    panel.add(new JPanel(), c);

    projectNameField.addCaretListener(new CaretListener() {
      public void caretUpdate(CaretEvent e) {
        updateProjectPath();
      }
    });
    projectPathField.addPropertyChangeListener("path", new PropertyChangeListener() {
      public void propertyChange(PropertyChangeEvent evt) {
        updateModulePath();
      }
    });

    return panel;
  }

  private JComponent createModulePanel() {
    JPanel modulePanel = new JPanel(new GridBagLayout());
    modulePanel.setBorder(createBorder("Module Settings"));

    Insets defaultInsets = new Insets(0, 5, 0, 5);
    Insets tfInsets = new Insets(0, 5, 4, 5);

    moduleSettingsComponents = new ArrayList<JComponent>();

    GridBagConstraints c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = defaultInsets;
    c.gridx = 0;
    c.gridy = 0;
    c.weightx = 1;
    JLabel nameLabel = new JLabel();
    nameLabel.setText("Module name:");
    modulePanel.add(nameLabel, c);
    moduleSettingsComponents.add(nameLabel);

    c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = tfInsets;
    c.gridx = 0;
    c.gridy = 1;
    c.weightx = 1;
    moduleNameField = new JTextField();
    moduleNameField.setText(projectNameField.getText());
    modulePanel.add(moduleNameField, c);
    moduleSettingsComponents.add(moduleNameField);

    c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = defaultInsets;
    c.gridx = 0;
    c.gridy = 2;
    c.weightx = 1;
    JLabel pathLabel = new JLabel();
    pathLabel.setText("Module path:");
    modulePanel.add(pathLabel, c);
    moduleSettingsComponents.add(pathLabel);

    c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = tfInsets;
    c.gridx = 0;
    c.gridy = 3;
    c.weightx = 1;
    modulePathField = new PathField();
    modulePanel.add(modulePathField, c);
    moduleSettingsComponents.add(modulePathField);

    moduleNameField.addCaretListener(new CaretListener() {
      public void caretUpdate(CaretEvent e) {
        updateModulePath();
      }
    });

    return modulePanel;
  }

  private void updateModulePath() {
    try {
      String path = FileUtil.getCanonicalPath(projectPathField.getPath());
      String prefix = path + File.separator + "modules" + File.separator;
      modulePathField.setPath(prefix + moduleNameField.getText());
    } catch (Throwable t) {
      // Ignore
    }
  }

  private String getDefaultProjectName() {
    int n = 1;
    while (true) {
      String projectName = "Project" + n;
      if (!(new File(getProjectsDir(), projectName).exists())) {
        return projectName;
      }
      n = n + 1;
    }
  }

  private void updateProjectPath() {
    String projectsPath = getProjectsDir();
    String newProjectPath = null;

    if (projectPathField.getPath() == null || projectPathField.getPath().length() == 0 || projectPathField.getPath().startsWith(projectsPath)) {
      newProjectPath = projectsPath + File.separator + projectNameField.getText();
      projectPathField.setPath(newProjectPath);
    }

    /*
    if (newProjectPath != null && modulePathField != null) {
      if (modulePathField.getPath() != null && modulePathField.getPath().length() != 0 && prevProjectPath != null) {
        String modulePath = modulePathField.getPath();
        if (modulePath.startsWith(prevProjectPath)) {
          modulePath = modulePath.replace(prevProjectPath, newProjectPath);
          modulePathField.setPath(modulePath);
        }
      }
    }
    */

    this.prevProjectPath = projectPathField.getPath();
  }

  private String getProjectsDir() {
    return ASNewProjectRootSettings.getInstance().getProjectRoot();
  }

  private Border createBorder(String title) {
    return new CompoundBorder(new TitledBorder(title), new EmptyBorder(5, 5, 5, 5));
  }

  public boolean finishable() {
    return false;
  }
}
