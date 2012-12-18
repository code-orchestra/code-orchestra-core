package codeOrchestra.actionscript.wizards.newproject.fromexternal;

import com.intellij.ide.wizard.CommitStepException;
import codeOrchestra.actionscript.wizards.newproject.*;
import jetbrains.mps.util.misc.hash.HashMap;
import jetbrains.mps.workbench.dialogs.project.newproject.icons.Icons;
import org.jetbrains.annotations.NotNull;

import javax.swing.*;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URL;
import java.util.Map;

/**
 * @author Anton.I.Neverov
 */
public class ASProjectFromExternalTypeStep extends ASNewProjectStep {

  private ASProjectFromExternalSettings settings;
  private Map<JRadioButton, ASExternalType> radioButtonsMap;

  public ASProjectFromExternalTypeStep(ASProjectFromExternalSettings settings) {
    super();
    this.settings = settings;
  }

  @Override
  public JComponent createControlComponent() {
    JPanel panel = new JPanel(new GridBagLayout());

    Insets buttonInsets = new Insets(3, 5, 3, 5);
    //Insets labelInsets = new Insets(3, 18, 10, 10);

    ButtonGroup buttonGroup = new ButtonGroup();
    boolean setSelection = false;

    radioButtonsMap = new HashMap<JRadioButton, ASExternalType>(ASExternalTypeProvider.getInstance().getTypesSize());

    int i = 0;
    for (final ASExternalType type : ASExternalTypeProvider.getInstance().getTypes()) {
      GridBagConstraints c = new GridBagConstraints();
      c.fill = GridBagConstraints.BOTH;
      c.anchor = GridBagConstraints.NORTHEAST;
      c.insets = buttonInsets;
      c.gridx = 1;
      c.gridy = i++;
      c.weightx = 1;

      JRadioButton radioButton = new JRadioButton(type.getName());
      Font boldFont = radioButton.getFont().deriveFont(Font.BOLD);
      radioButton.setFont(boldFont);
      radioButtonsMap.put(radioButton, type);

//      radioButton.addActionListener(new ActionListener() {
//        public void actionPerformed(ActionEvent e) {
//          projectSourceListener.onSourceChange(source);
//        }
//      });

      buttonGroup.add(radioButton);
      radioButton.setEnabled(type.isEnabled());
      if (!setSelection && radioButton.isEnabled()) {
//        firstAvailableSource = source;
        radioButton.setSelected(true);
        setSelection = true;
      }
      panel.add(radioButton, c);

//      c = new GridBagConstraints();
//      c.fill = GridBagConstraints.BOTH;
//      c.anchor = GridBagConstraints.NORTHEAST;
//      c.gridx = 1;
//      c.insets = labelInsets;
//      c.gridy = i++;
//      c.weightx = 1;
//      c.weighty = 0;
//
//      JLabel sourceDescLabel = new JLabel(source.getDescription());
//      sourceDescLabel.setEnabled(radioButton.isEnabled());
//      panel.add(sourceDescLabel, c);
    }

    GridBagConstraints c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.gridx = 1;
    c.gridy = i;
    c.weightx = 1;
    c.weighty = 1;

    panel.add(new JPanel(), c);

    return panel;
  }

  @Override
  public boolean finishable() {
    return false;
  }

  @NotNull
  @Override
  public String getImageText() {
    return "Import Project";
  }

  @Override
  protected void _check() throws CommitStepException {
    // No check is required
  }

  public URL getImageURL() {
    return Icons.NEW_PROJECT_IMAGE_URL;
  }

  public void _init() {
    super._init();
  }

  public void _commit(boolean finishChosen) throws CommitStepException {
    super._commit(finishChosen);

    for (JRadioButton btn : radioButtonsMap.keySet()) {
      if (btn.isSelected()) {
        settings.setType(radioButtonsMap.get(btn));
        // createControlComponent() is called only once and before we can select specific project type, so we need to call refreshControlComponent()
        settings.getConfigStep().refreshControlComponent();
        settings.getAdditionalStep().refreshControlComponent();
        break;
      }
    }

  }

}
