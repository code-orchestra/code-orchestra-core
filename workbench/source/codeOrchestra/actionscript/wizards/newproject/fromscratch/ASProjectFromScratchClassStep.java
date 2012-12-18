package codeOrchestra.actionscript.wizards.newproject.fromscratch;

import codeOrchestra.actionscript.wizards.newproject.ASNewProjectStep;
import com.intellij.ide.wizard.CommitStepException;
import jetbrains.mps.workbench.dialogs.project.newproject.icons.Icons;
import org.apache.commons.lang.StringUtils;
import org.jetbrains.annotations.NotNull;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.TitledBorder;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URL;
import java.util.List;
import java.util.ArrayList;
import java.util.regex.Pattern;

/**
 * @author Alexander Eliseyev
 */
public class ASProjectFromScratchClassStep extends ASNewProjectStep {

  private static final Pattern VALID_IDENTIFIER_PATTERN = Pattern.compile("[a-zA-Z[_]][a-zA-Z0-9[_]]*");
  private static final String DEFAULT_CLASS_NAME = "Main";

  private ASProjectFromScratchSettings settings;

  private JCheckBox createClassCheckBox;
  private List<JComponent> classControls;
  private JTextField classNameField;
  private JTextField packageNameField;

  public ASProjectFromScratchClassStep(ASProjectFromScratchSettings settings) {
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

    createClassCheckBox.setEnabled(settings.isCreateModule());

    if (!createClassCheckBox.isEnabled()) {
      createClassCheckBox.setSelected(false);
    }

    updateControls();
  }

  @Override
  public JComponent createControlComponent() {
    JPanel panel = new JPanel(new GridBagLayout());

    Insets defaultInsets = new Insets(0, 5, 0, 5);
    Insets tfInsets = new Insets(0, 5, 4, 5);

    GridBagConstraints c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = tfInsets;
    c.gridx = 0;
    c.gridy = 0;
    c.weightx = 1;
    createClassCheckBox = new JCheckBox("Create main class");
    createClassCheckBox.setSelected(true);
    createClassCheckBox.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        updateControls();
      }
    });
    panel.add(createClassCheckBox, c);

    c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = tfInsets;
    c.gridx = 0;
    c.gridy = 1;
    c.weightx = 1;
    panel.add(createClassPanel(), c);

    // Spacer
    c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = tfInsets;
    c.gridx = 0;
    c.gridy = 2;
    c.weightx = 1;
    c.weighty = 1;
    panel.add(new JPanel(), c);

    return panel;
  }

  private void updateControls() {
    for (JComponent component : classControls) {
      component.setEnabled(createClassCheckBox.isSelected());
    }
  }

  private JComponent createClassPanel() {
    JPanel classPanel = new JPanel(new GridBagLayout());
    classPanel.setBorder(createBorder("Main Class Settings"));

    Insets defaultInsets = new Insets(0, 5, 0, 5);
    Insets tfInsets = new Insets(0, 5, 4, 5);

    classControls = new ArrayList<JComponent>();

    GridBagConstraints c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = defaultInsets;
    c.gridx = 0;
    c.gridy = 0;
    c.weightx = 1;
    JLabel nameLabel = new JLabel();
    nameLabel.setText("Class name:");
    classPanel.add(nameLabel, c);
    classControls.add(nameLabel);

    c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = tfInsets;
    c.gridx = 0;
    c.gridy = 1;
    c.weightx = 1;
    classNameField = new JTextField();
    classNameField.setText(DEFAULT_CLASS_NAME);
    classPanel.add(classNameField, c);
    classControls.add(classNameField);

    c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = defaultInsets;
    c.gridx = 0;
    c.gridy = 2;
    c.weightx = 1;
    JLabel packageNameLabel = new JLabel();
    packageNameLabel.setText("Package name:");
    classPanel.add(packageNameLabel, c);
    classControls.add(packageNameLabel);

    c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = tfInsets;
    c.gridx = 0;
    c.gridy = 3;
    c.weightx = 1;
    packageNameField = new JTextField();
    packageNameField.setText("com.example");
    classPanel.add(packageNameField, c);
    classControls.add(packageNameField);

    return classPanel;
  }

  public void _commit(boolean finishChosen) throws CommitStepException {
    super._commit(finishChosen);

    settings.setCreateMainClass(createClassCheckBox.isSelected());
    settings.setMainClassName(classNameField.getText());

    if (packageNameField.getText() == null) {
      settings.setPackageName(StringUtils.EMPTY);
    } else {
      settings.setPackageName(packageNameField.getText());
    }
  }

  public void _check() throws CommitStepException {
    if (createClassCheckBox.isSelected()) {
      if (StringUtils.isEmpty(classNameField.getText())) {
        throw new CommitStepException("Class name shouldn't be empty");
      }

      if (!VALID_IDENTIFIER_PATTERN.matcher(classNameField.getText()).matches()) {
        throw new CommitStepException("Class name must be a valid identifier");
      }
    }
  }

  @Override
  public boolean finishable() {
    return true;
  }

  private Border createBorder(String title) {
    return new CompoundBorder(new TitledBorder(title), new EmptyBorder(5, 5, 5, 5));
  }

}
