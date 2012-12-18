package codeOrchestra.rgs.client.settings.view;

import codeOrchestra.rgs.client.settings.RGSClientSettings;
import org.apache.commons.lang.ObjectUtils;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class RGSClientSettingsPreferences {

  private RGSClientSettings settings;

  private final JPanel settingsPanel;

  private final JCheckBox generateRemotelyCB;
  private final JRadioButton useSeparateInstanceRB;
  private final JRadioButton useBuiltInGeneratorRB;

  private final JTextField hostField;
  private final JTextField sshdPortField;
  private final JTextField rgsPortField;

  //private final TextFieldWithBrowseButton workspaceField;

  private List<Component> remoteGenerationControls = new ArrayList<Component>();

  public RGSClientSettingsPreferences(RGSClientSettings settings) {
    this.settings = settings;

    JPanel panel = new JPanel();
    panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));

    JPanel separateInstanceGenerationPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
    ButtonGroup buttonGroup = new ButtonGroup();
    useSeparateInstanceRB = new JRadioButton("Generate on a Separate Instance in Background");
    useSeparateInstanceRB.addActionListener(new ActionListener() {
      @Override
      public void actionPerformed(ActionEvent actionEvent) {
        updateSettingsControlsVisibility();
      }
    });
    buttonGroup.add(useSeparateInstanceRB);
    separateInstanceGenerationPanel.add(useSeparateInstanceRB);
    panel.add(separateInstanceGenerationPanel);

    JPanel remoteSettingsPanel = new JPanel();
    remoteSettingsPanel.setLayout(new BoxLayout(remoteSettingsPanel, BoxLayout.Y_AXIS));
    remoteSettingsPanel.setBorder(new EmptyBorder(0, 20, 0, 0) );
    panel.add(remoteSettingsPanel);

    JPanel remoteGenerationPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
    generateRemotelyCB = new JCheckBox("Generate Remotely");
    generateRemotelyCB.addActionListener(new ActionListener() {
      @Override
      public void actionPerformed(ActionEvent actionEvent) {
        updateSettingsControlsVisibility();
      }
    });
    remoteGenerationPanel.add(generateRemotelyCB);
    remoteSettingsPanel.add(remoteGenerationPanel);

    /*
    JPanel workspacePanel = new JPanel(new GridLayout(0, 1));
    workspacePanel.setBorder(new EmptyBorder(5, 5, 5, 5));
    workspacePanel.add(new JLabel("Workspace Path : "));
    workspaceField = new TextFieldWithBrowseButton();
    workspacePanel.add(workspaceField);
    panel.add(workspacePanel);
    */

    JPanel hostPanel = new JPanel(new GridLayout(0, 1));
    hostPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
    hostPanel.add(new JLabel("Server Host : "));
    hostField = new JTextField();
    hostPanel.add(hostField);
    remoteSettingsPanel.add(hostPanel);
    remoteGenerationControls.add(hostPanel);

    JPanel rgsPortPanel = new JPanel(new GridLayout(0, 1));
    rgsPortPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
    rgsPortPanel.add(new JLabel("Generation Service Port : "));
    rgsPortField = new JTextField();
    rgsPortPanel.add(rgsPortField);
    remoteSettingsPanel.add(rgsPortPanel);
    remoteGenerationControls.add(rgsPortPanel);

    JPanel sshdPortPanel = new JPanel(new GridLayout(0, 1));
    sshdPortPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
    sshdPortPanel.add(new JLabel("SSHD Port : "));
    sshdPortField = new JTextField();
    sshdPortPanel.add(sshdPortField);
    remoteSettingsPanel.add(sshdPortPanel);
    remoteGenerationControls.add(sshdPortPanel);

    JPanel localGenerationPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
    useBuiltInGeneratorRB = new JRadioButton("Use Built-In Generator");
    useBuiltInGeneratorRB.addActionListener(new ActionListener() {
      @Override
      public void actionPerformed(ActionEvent actionEvent) {
        updateSettingsControlsVisibility();
      }
    });
    buttonGroup.add(useBuiltInGeneratorRB);
    localGenerationPanel.add(useBuiltInGeneratorRB);
    panel.add(localGenerationPanel);

    settingsPanel = new JPanel(new BorderLayout());
    settingsPanel.add(panel, BorderLayout.NORTH);
  }

  private synchronized void updateSettingsControlsVisibility() {
    generateRemotelyCB.setVisible(useSeparateInstanceRB.isSelected());

    for (Component remoteGenerationControl : remoteGenerationControls) {
      remoteGenerationControl.setVisible(useSeparateInstanceRB.isSelected() && generateRemotelyCB.isSelected());
    }
  }

  public JComponent getComponent() {
    return settingsPanel;
  }

  public boolean isModified() {
    boolean sameGenerationTarget = useSeparateInstanceRB.isSelected() == settings.isUseSeperateInstance();
    boolean sameUseRemoteGeneration = generateRemotelyCB.isSelected() == settings.isUseRemoteGeneration();
    boolean sameHost = ObjectUtils.equals(hostField.getText(), settings.getHost());
    boolean sameRGSPort = ObjectUtils.equals(rgsPortField.getText(), String.valueOf(settings.getRGSPort()));
    boolean sameSSHDPort = ObjectUtils.equals(sshdPortField.getText(), String.valueOf(settings.getSSHDPort()));
    //boolean sameWorkspace = ObjectUtils.equals(workspaceField.getText(), settings.getWorkspacePath());
    return !(sameGenerationTarget && sameUseRemoteGeneration && sameHost && sameRGSPort && sameSSHDPort /* && sameWorkspace */);
  }

  public void apply() {
    // TODO: validate

    settings.setUseSeparateInstance(useSeparateInstanceRB.isSelected());
    settings.setUseRemoteGeneration(generateRemotelyCB.isSelected());
    settings.setHost(hostField.getText());
    settings.setRGSPort(Integer.valueOf(rgsPortField.getText()));
    settings.setSSHDPort(Integer.valueOf(sshdPortField.getText()));
    //settings.setWorkspacePath(workspaceField.getText());
  }

  public void reset() {
    if (settings.isUseSeperateInstance()) {
      useSeparateInstanceRB.setSelected(true);
    } else {
      useBuiltInGeneratorRB.setSelected(true);
    }

    generateRemotelyCB.setSelected(settings.isUseRemoteGenerationFromState());
    hostField.setText(settings.getHost());
    rgsPortField.setText(String.valueOf(settings.getRGSPort()));
    sshdPortField.setText(String.valueOf(settings.getSSHDPort()));
    //workspaceField.setToolTipText(settings.getWorkspacePath());

    updateSettingsControlsVisibility();
  }
}
