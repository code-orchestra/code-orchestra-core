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
package jetbrains.mps.ide.codeStyle;

import jetbrains.mps.codeStyle.CodeStyleSettings;
import jetbrains.mps.util.Pair;
import org.apache.commons.lang.ObjectUtils;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;

public class CodeStylePreferencesPage {
  private enum LineSeparatorOption {
    SYSTEM_DEPENDENT(null, "System Dependent"),
    UNIX("\n", "Unix"),
    WINDOWS("\r\n", "Windows"),
    MACINTOSH("\r", "Mac"),;
    private String mySetting;
    private String myName;

    private LineSeparatorOption(String setting, String name) {
      mySetting = setting;
      myName = name;
    }

    public String toString() {
      return myName;
    }

    public String getSetting() {
      return mySetting;
    }
  }

  private JPanel myPage;
  private JCheckBox myPreferLongerName;
  private CodeStyleItem myFieldItem;
  private CodeStyleItem myStaticField;
  private CodeStyleItem myParameter;
  private CodeStyleItem myLocalVariable;
  private JComboBox myLineSeparatorComboBox;
  private CodeStyleSettings mySettings;

  public CodeStylePreferencesPage(CodeStyleSettings settings) {
    mySettings = settings;

    myPage = new JPanel();
    myPage.setLayout(new BoxLayout(myPage, BoxLayout.Y_AXIS));

    JPanel namingPanel = new JPanel(new GridBagLayout());
    namingPanel.setBorder(BorderFactory.createTitledBorder("Naming"));
    myPreferLongerName = new JCheckBox("Prefer longer names", true);
    GridBagConstraints c = new GridBagConstraints();
    c.anchor = GridBagConstraints.NORTHWEST;
    c.insets = getInsets();
    c.gridwidth = 2;
    namingPanel.add(myPreferLongerName, c);
    c.gridwidth = 1;
    c.gridy = 1;
    c.gridx = 1;
    namingPanel.add(new JLabel("Name prefix:"), c);
    c.gridx = 2;
    namingPanel.add(new JLabel("Name suffix:"), c);
    myFieldItem = new CodeStyleItem(namingPanel, "Field", 2);
    myStaticField = new CodeStyleItem(namingPanel, "Static field", 3);
    myParameter = new CodeStyleItem(namingPanel, "Parameter", 4);
    myLocalVariable = new CodeStyleItem(namingPanel, "Local variable", 5);

    namingPanel.setMaximumSize(namingPanel.getPreferredSize());
    namingPanel.setAlignmentX(Component.LEFT_ALIGNMENT);

    JPanel lineSeparatorPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
    lineSeparatorPanel.setAlignmentX(Component.LEFT_ALIGNMENT);
    lineSeparatorPanel.add(new JLabel("Line separator: "));
    myLineSeparatorComboBox = new JComboBox(LineSeparatorOption.values());
    lineSeparatorPanel.add(myLineSeparatorComboBox);

    myPage.setBorder(new EmptyBorder(10, 10, 10, 10));
    myPage.add(namingPanel);
    myPage.add(lineSeparatorPanel);
    myPage.add(Box.createVerticalGlue());

    update();
  }

  @Nullable
  private String getSelectedLineSeparator() {
    Object selectedItem = myLineSeparatorComboBox.getSelectedItem();
    for (LineSeparatorOption option : LineSeparatorOption.values()) {
      if (option.equals(selectedItem)) {
        return option.getSetting();
      }
    }
    return null;
  }

  private Insets getInsets() {
    return new Insets(4, 4, 4, 4);
  }

  public JComponent getComponent() {
    return myPage;
  }

  public String getName() {
    return "Code Style";
  }

  public void commit() {
    mySettings.setFieldSettings(myFieldItem.getSettings());
    mySettings.setStaticFieldSettings(myStaticField.getSettings());
    mySettings.setParameterSettings(myParameter.getSettings());
    mySettings.setLocalVariableSettings(myLocalVariable.getSettings());
    mySettings.setLineSeparator(getSelectedLineSeparator());
  }

  public boolean isModified() {
    return !(mySettings.getFieldSettings().equals(myFieldItem.getSettings()) &&
      mySettings.getStaticFieldSettings().equals(myStaticField.getSettings()) &&
      mySettings.getParameterSettings().equals(myParameter.getSettings()) &&
      mySettings.getLocalVariableSettings().equals(myLocalVariable.getSettings()) &&
      ObjectUtils.equals(mySettings.getLineSeparatorSetting(), getSelectedLineSeparator()));
  }

  public void update() {
    myFieldItem.setSettings(mySettings.getFieldSettings());
    myStaticField.setSettings(mySettings.getStaticFieldSettings());
    myParameter.setSettings(mySettings.getParameterSettings());
    myLocalVariable.setSettings(mySettings.getLocalVariableSettings());
    for (LineSeparatorOption option : LineSeparatorOption.values()) {
      if (ObjectUtils.equals(option.getSetting(), mySettings.getLineSeparatorSetting())) {
        myLineSeparatorComboBox.setSelectedItem(option);
      }
    }
  }

  private class CodeStyleItem {
    private JLabel myName = new JLabel();
    private JTextField myPrefix = new JTextField(15);
    private JTextField mySuffix = new JTextField(15);

    CodeStyleItem(JComponent owner, String name, int index) {
      myName.setText(name + ":");
      myName.setHorizontalAlignment(SwingConstants.RIGHT);
      addComponent(owner, myName, 0, index);
      addComponent(owner, myPrefix, 1, index);
      addComponent(owner, mySuffix, 2, index);
    }

    Pair<String, String> getSettings() {
      return new Pair<String, String>(myPrefix.getText(), mySuffix.getText());
    }

    void setSettings(Pair<String, String> settings) {
      myPrefix.setText(settings.o1);
      mySuffix.setText(settings.o2);
    }

    private void addComponent(JComponent owner, JComponent child, int x, int y) {
      GridBagConstraints c = new GridBagConstraints();
      c.insets = getInsets();
      c.fill = GridBagConstraints.BOTH;
      c.gridx = x;
      c.gridy = y;
      owner.add(child, c);
    }
  }
}
