package codeOrchestra.actionScript.parser;

import javax.swing.BoxLayout;
import javax.swing.JCheckBox;
import javax.swing.JPanel;
import java.awt.BorderLayout;
import java.awt.FlowLayout;

/**
 * @author Anton.I.Neverov
 */
public class ASParserConfigurationPage {

  private JPanel myEditorSettingsPanel;
  private JCheckBox copyEmbeddedFilesCB;
  private ASParserSettings settings;

  public ASParserConfigurationPage(ASParserSettings settings) {
    this.settings = settings;

    JPanel panel = new JPanel();
    panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));

    JPanel useCPUTracingPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
    copyEmbeddedFilesCB = new JCheckBox("Copy embedded files to Project Assets");
    useCPUTracingPanel.add(copyEmbeddedFilesCB);
    panel.add(useCPUTracingPanel);

    myEditorSettingsPanel = new JPanel(new BorderLayout());
    myEditorSettingsPanel.add(panel, BorderLayout.NORTH);
  }

  public boolean isModified() {
    return copyEmbeddedFilesCB.isSelected() != settings.isCopyEmbeddedFiles();
  }

  public JPanel getContentPanel() {
    return myEditorSettingsPanel;
  }

  public void apply() {
    settings.setCopyEmbeddedFiles(copyEmbeddedFilesCB.isSelected());
  }

  public void reset() {
    copyEmbeddedFilesCB.setSelected(settings.isCopyEmbeddedFiles());
  }
}
