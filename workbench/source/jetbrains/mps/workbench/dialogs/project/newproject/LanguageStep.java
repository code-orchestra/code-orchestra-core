/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.workbench.dialogs.project.newproject;

import com.intellij.ide.wizard.CommitStepException;
import jetbrains.mps.ide.common.PathField;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.util.FileUtil;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.workbench.dialogs.project.newproject.icons.Icons;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.io.File;
import java.net.URL;

public class LanguageStep extends BaseStep {
  //for UI tests
  public static final String LANGUAGE_PATH = "Language Path";
  public static final String LANGUAGE_NAME = "Language Name";
  public static final String CREATE_CHECKBOX = "Create Checkbox";

  private ProjectOptions myOptions;

  private JTextField myNamespace;
  private PathField myPath;
  private JCheckBox myCreate;

  public LanguageStep(ProjectOptions options) {
    super();
    myOptions = options;
  }

  public JComponent createControlComponent() {
    JPanel panel = new JPanel(new GridLayout(5, 1));

    myCreate = new JCheckBox(new AbstractAction("Create new language") {
      public void actionPerformed(ActionEvent e) {
        setCreateLanguage(myCreate.isSelected());
      }
    });
    myCreate.setName(CREATE_CHECKBOX);
    panel.add(myCreate);

    JLabel namespaceLabel = new JLabel();
    namespaceLabel.setText("Language Namespace:");
    panel.add(namespaceLabel);

    myNamespace = new JTextField();
    myNamespace.setName(LANGUAGE_NAME);
    panel.add(myNamespace);

    JLabel pathLabel = new JLabel();
    pathLabel.setText("Language Path:");
    panel.add(pathLabel);

    myPath = new PathField();
    myPath.setName(LANGUAGE_PATH);
    panel.add(myPath);

    myNamespace.addCaretListener(new CaretListener() {
      public void caretUpdate(CaretEvent e) {
        updateLanguagePath();
      }
    });

    return panel;
  }

  public URL getImageURL() {
    return Icons.NEW_PROJECT_IMAGE_URL;
  }

  @NotNull
  public String getImageText() {
    return "New Language";
  }

  public String getCommentString() {
    return
      "In MPS, you create new languages and then use them to write code " +
        "in solutions. An MPS language describes the syntax, editor, generator and other aspects of the " +
        "new language.";
  }

  @Nullable
  public String getURL() {
    return "http://www.jetbrains.net/confluence/display/MPSD1/MPS+project+structure#MPSprojectstructure-languages";
  }

  public void _init() {
    super._init();

    if (myOptions.getLanguageNamespace() == null) {
      myOptions.setLanguageNamespace(myOptions.getProjectName());
      myCreate.doClick();
    }

    myNamespace.setText(myOptions.getLanguageNamespace());
    myPath.setPath(myOptions.getLanguagePath());

    updateLanguagePath();
  }

  private void updateLanguagePath() {
    String path = myOptions.getProjectPath();
    String prefix = path + File.separator + "languages" + File.separator;
    if (myPath.getPath() == null || myPath.getPath().startsWith(prefix)) {
      myPath.setPath(prefix + NameUtil.shortNameFromLongName(myNamespace.getText()));
    }
  }

  public void _check() throws CommitStepException {
    if (myOptions.getCreateNewLanguage()) {
      File dir = new File(myPath.getPath());
      if (!(dir.isAbsolute())) {
        throw new CommitStepException("Path should path");
      }
      if (myNamespace.getText().length() == 0) {
        throw new CommitStepException("Enter namespace");
      }
      if (MPSModuleRepository.getInstance().getModuleByUID(myNamespace.getText()) != null) {
        throw new CommitStepException("Language namespace already exists");
      }
      if (NameUtil.shortNameFromLongName(myNamespace.getText()).length() == 0) {
        throw new CommitStepException("Enter valid namespace");
      }
    }
  }

  public void _commit(boolean finishChosen) throws CommitStepException {
    super._commit(finishChosen);

    myOptions.setLanguageNamespace(myNamespace.getText());
    myOptions.setLanguagePath(myPath.getPath());
  }

  private void setCreateLanguage(boolean value) {
    myOptions.setCreateNewLanguage(value);
    myNamespace.setEnabled(value);
    myPath.setEnabled(value);
  }
}
