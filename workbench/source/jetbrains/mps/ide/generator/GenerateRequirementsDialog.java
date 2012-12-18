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
package jetbrains.mps.ide.generator;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.ui.DialogWrapper;
import com.intellij.openapi.ui.Messages;
import com.intellij.ui.ScrollPaneFactory;
import com.intellij.util.ui.UIUtil;

import javax.swing.*;
import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.event.ActionEvent;

class GenerateRequirementsDialog extends DialogWrapper {
  private final String myMessage;
  private JCheckBox myDontAskAgainCheckBox = new JCheckBox("Do not show this dialog in the future");
  private GenerationSettings myGenerationSettings;

  public GenerateRequirementsDialog(Project project, GenerationSettings generationSettings, String message) {
    super(project);
    myMessage = message;
    myGenerationSettings = generationSettings;
    setTitle("Generate Required Models");
    setButtonsAlignment(SwingUtilities.CENTER);

    init();
  }

  @Override
  protected JComponent createCenterPanel() {
    JPanel panel = new JPanel(new BorderLayout(15, 0));
    JLabel iconLabel = new JLabel(Messages.getWarningIcon());
    Container container = new Container();
    container.setLayout(new BorderLayout());
    container.add(iconLabel, BorderLayout.NORTH);
    panel.add(container, BorderLayout.WEST);
    JLabel label = new JLabel();
    final JTextPane messageComponent = new JTextPane();
    messageComponent.setFont(UIUtil.getOptionPaneMessageFont());
    messageComponent.setText(myMessage);
    messageComponent.setEditable(false);
    if (messageComponent.getCaret() != null) {
      messageComponent.setCaretPosition(0);
    }
    messageComponent.setBackground(UIUtil.getOptionPaneBackground());

    messageComponent.setForeground(label.getForeground());

    final Dimension screenSize = messageComponent.getToolkit().getScreenSize();
    final Dimension textSize = messageComponent.getPreferredSize();
    if (textSize.width > screenSize.width * 4 / 5 || textSize.height > screenSize.height / 2) {
      final JScrollPane pane = ScrollPaneFactory.createScrollPane(messageComponent);
      pane.setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0));
      pane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);
      pane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
      final int scrollSize = (int) new JScrollBar(JScrollBar.VERTICAL).getPreferredSize().getWidth();
      final Dimension preferredSize =
        new Dimension(Math.min(textSize.width, screenSize.width * 4 / 5) + scrollSize, Math.min(textSize.height, screenSize.height / 2) + scrollSize);
      pane.setPreferredSize(preferredSize);
      panel.add(pane, BorderLayout.CENTER);
      SwingUtilities.invokeLater(new Runnable() {
        public void run() {
          final Dimension textSize = messageComponent.getPreferredSize();
          final Dimension preferredSize = new Dimension(Math.min(textSize.width, screenSize.width * 4 / 5) + scrollSize,
            Math.min(textSize.height, screenSize.height / 2) + scrollSize);
          pane.setPreferredSize(preferredSize);
          SwingUtilities.getWindowAncestor(pane).pack();
        }
      });
    } else {
      panel.add(messageComponent, BorderLayout.CENTER);
    }

    panel.add(myDontAskAgainCheckBox, BorderLayout.SOUTH);

    return panel;
  }

  @Override
  protected Action[] createActions() {
    Action yesAction = new AbstractAction("Yes") {
      @Override
      public void actionPerformed(ActionEvent e) {
        if (myDontAskAgainCheckBox.isSelected()) {
          myGenerationSettings.setGenerateRequirementsPolicy(GenerationSettings.GenerateRequirementsPolicy.ALWAYS);
        }
        close(0);
      }
    };
    Action noAction = new AbstractAction("No") {
      @Override
      public void actionPerformed(ActionEvent e) {
        if (myDontAskAgainCheckBox.isSelected()) {
          myGenerationSettings.setGenerateRequirementsPolicy(GenerationSettings.GenerateRequirementsPolicy.NEVER);
        }
        close(2);
      }
    };
    return new Action[]{yesAction, noAction};
  }
}
