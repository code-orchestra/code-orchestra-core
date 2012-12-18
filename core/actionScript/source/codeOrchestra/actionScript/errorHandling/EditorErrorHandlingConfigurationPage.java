package codeOrchestra.actionScript.errorHandling;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.fileChooser.FileChooserDescriptor;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.ui.TextFieldWithBrowseButton;
import com.intellij.uiDesigner.core.GridConstraints;
import com.intellij.uiDesigner.core.GridLayoutManager;
import com.intellij.uiDesigner.core.Spacer;

import javax.swing.*;
import java.awt.*;

/**
 * @author Alexander Eliseyev
 */
public class EditorErrorHandlingConfigurationPage {

  private JPanel myEditorSettingsPanel;
  private JCheckBox reportFatalErrorsCB;
  private JCheckBox useCPUTracing;
  private EditorErrorHandlingSettings settings;

  public EditorErrorHandlingConfigurationPage(EditorErrorHandlingSettings settings) {
    this.settings = settings;

    JPanel panel = new JPanel();
    panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));

    JPanel useBraces = new JPanel(new FlowLayout(FlowLayout.LEFT));
    reportFatalErrorsCB = new JCheckBox("Report IDE Fatal Errors");
    useBraces.add(reportFatalErrorsCB);
    panel.add(useBraces);

    JPanel useCPUTracingPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
    useCPUTracing = new JCheckBox("Use tracing instead of sampling when taking a CPU snapshot");
    useCPUTracingPanel.add(useCPUTracing);
    panel.add(useCPUTracingPanel);

    JPanel useCPUTracingWarningPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
    JLabel tracingWarningLabel = new JLabel("CPU tracing greatly reduces the performance of IDE when taking a snapshot");
    tracingWarningLabel.setForeground(new Color(255, 0, 0));
    useCPUTracingWarningPanel.add(tracingWarningLabel);
    panel.add(useCPUTracingWarningPanel);

    myEditorSettingsPanel = new JPanel(new BorderLayout());
    myEditorSettingsPanel.add(panel, BorderLayout.NORTH);
  }

  public boolean isModified() {
    return reportFatalErrorsCB.isSelected() != settings.reportFatalErrors() ||
      useCPUTracing.isSelected() != settings.useCPUTracing();
  }

  public JPanel getContentPanel() {
    return myEditorSettingsPanel;
  }

  public void apply() {
    settings.setReportFatalErrors(reportFatalErrorsCB.isSelected());
    settings.setUseCPUTracing(useCPUTracing.isSelected());
  }

  public void reset() {
    reportFatalErrorsCB.setSelected(settings.reportFatalErrors());
    useCPUTracing.setSelected(settings.useCPUTracing());
  }

}