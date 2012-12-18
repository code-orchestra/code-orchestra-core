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
package jetbrains.mps.workbench.dialogs;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.ui.DialogWrapper;
import com.intellij.openapi.ui.TextFieldWithBrowseButton;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.openapi.fileChooser.FileChooserDialog;
import com.intellij.openapi.fileChooser.FileChooserFactory;
import com.intellij.openapi.fileChooser.FileChooserDescriptor;
import com.intellij.ui.IdeBorderFactory;
import jetbrains.mps.ide.vfs.VirtualFileUtils;
import jetbrains.mps.vfs.FileSystem;

import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MoveFileDialog extends DialogWrapper {
  private JLabel myLabel;
  private TextFieldWithBrowseButton myDirectoryField = new TextFieldWithBrowseButton();

  public MoveFileDialog(final Project project, final String initialText, boolean isDirectory) {
    super(project);
    setTitle("Move");
    myDirectoryField.setText(initialText);
    myDirectoryField.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        SwingUtilities.invokeLater(new Runnable() {
          public void run() {
            FileChooserDescriptor chooser = new FileChooserDescriptor(false, true, false, false, false, false);
            FileChooserDialog dialog = FileChooserFactory.getInstance().createFileChooser(chooser, getOwner());
            VirtualFile[] selectedFiles = dialog.choose(VirtualFileUtils.getVirtualFile(FileSystem.getInstance().getFileByPath(initialText)), project);
            if (selectedFiles.length > 0 && selectedFiles[0] != null) {
              myDirectoryField.setText(selectedFiles[0].getPath());
            }
          }
        });
      }
    });
    String type = (isDirectory)? "directory" : "file";
    myLabel = new JLabel("Move " + type + " " + initialText);
    init();
  }

  @Override
  protected JComponent createCenterPanel() {
    final JPanel centerComponent = new JPanel(new BorderLayout());
    JPanel panel = new JPanel();
    panel.setLayout(new GridBagLayout());
    panel.setBorder(IdeBorderFactory.createBorder());
    panel.add(myLabel, new GridBagConstraints(0,0,2,1,1,0,GridBagConstraints.WEST,GridBagConstraints.HORIZONTAL,new Insets(4,8,4,8),0,0));
    panel.add(new JLabel("To directory"),
              new GridBagConstraints(0,1,1,1,0,0,GridBagConstraints.WEST,GridBagConstraints.HORIZONTAL,new Insets(4,8,4,8),0,0));
     myDirectoryField.setTextFieldPreferredWidth(60);
    panel.add(myDirectoryField, new GridBagConstraints(1,1,1,1,1,0,GridBagConstraints.WEST,GridBagConstraints.HORIZONTAL,new Insets(4,0,4,8),0,0));
     centerComponent.add(panel, BorderLayout.NORTH);
    return centerComponent;
  }

  public String getResult() {
    return myDirectoryField.getText();
  }
}
