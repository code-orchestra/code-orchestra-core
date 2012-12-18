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
package jetbrains.mps.dialogs;

import jetbrains.mps.ide.util.ColorAndGraphicsUtil;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class YesNoToAllDialog extends JDialog {
  private ResponseValue myResponse;

  public YesNoToAllDialog(Frame frame, String message) throws HeadlessException {
    super(frame, "", true);
    Container contentPane = this.getContentPane();
    contentPane.setLayout(new BorderLayout());
    JLabel jLabel = new JLabel(message);
    jLabel.setHorizontalAlignment(SwingConstants.CENTER);
    contentPane.add(jLabel, BorderLayout.NORTH);
    JPanel panel = new JPanel(new FlowLayout(FlowLayout.CENTER));
    panel.add(new JButton(new AbstractAction("Yes") {
      public void actionPerformed(ActionEvent e) {
        myResponse = ResponseValue.YES;
        setVisible(false);
      }
    }));
    panel.add(new JButton(new AbstractAction("No") {
      public void actionPerformed(ActionEvent e) {
        myResponse = ResponseValue.NO;
        setVisible(false);
      }
    }));
    panel.add(new JButton(new AbstractAction("Yes To All") {
      public void actionPerformed(ActionEvent e) {
        myResponse = ResponseValue.YES_TO_ALL;
        setVisible(false);
      }
    }));
    panel.add(new JButton(new AbstractAction("No To All") {
      public void actionPerformed(ActionEvent e) {
        myResponse = ResponseValue.NO_TO_ALL;
        setVisible(false);
      }
    }));
    contentPane.add(panel, BorderLayout.SOUTH);

    addWindowListener(new WindowAdapter() {

      public void windowClosing(WindowEvent e) {
        myResponse = ResponseValue.NO_TO_ALL;
        YesNoToAllDialog.this.dispose();
      }
    });
  }

  public ResponseValue getResponse() {
    return myResponse;
  }

  public static ResponseValue showDialog(Frame frame, String message) {
    return showDialog(frame, message, message);
  }

  public static ResponseValue showDialog(Frame frame, String title, String message) {
    final YesNoToAllDialog dialog = new YesNoToAllDialog(frame, message);
    dialog.setUndecorated(false);
    dialog.setTitle(title);
    dialog.pack();
    dialog.setResizable(false);
    dialog.setLocation(ColorAndGraphicsUtil.getCentralPosition(frame, dialog));
    dialog.show();
    dialog.dispose();
    return dialog.getResponse();
  }

  public static enum ResponseValue {
    YES, NO, YES_TO_ALL, NO_TO_ALL;

    public boolean isPositive() {
      return this == YES || this == YES_TO_ALL;
    }

    public boolean isToAll() {
      return this == NO_TO_ALL || this == YES_TO_ALL;
    }
  }
}
