package codeOrchestra.actionscript.wizards.newproject.fromsources;

import codeOrchestra.actionscript.wizards.newproject.ASNewProjectStep;
import com.intellij.openapi.actionSystem.*;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.ide.ui.filechoosers.treefilechooser.TreeFileChooser;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.dialogs.project.components.parts.actions.ListAddAction;
import jetbrains.mps.workbench.dialogs.project.components.parts.actions.ListRemoveAction;
import jetbrains.mps.workbench.dialogs.project.components.parts.renderers.ProjectLevelRenderer;
import jetbrains.mps.workbench.dialogs.project.newproject.icons.Icons;
import org.jdesktop.beansbinding.AutoBinding.UpdateStrategy;
import org.jdesktop.swingbinding.JListBinding;
import org.jdesktop.swingbinding.SwingBindings;
import org.jetbrains.annotations.NotNull;

import javax.swing.*;
import java.awt.BorderLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.net.URL;
import java.util.Arrays;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ASProjectFromSourcesLibrariesStep extends ASNewProjectStep {

  private ASProjectFromSourcesSettings settings;
  private Computable<String> libPathChooser;

  private AnAction addAction;
  private AnAction removeAction;

  private DefaultListModel listModel;
  private JList librariesList;
  //private JListBinding<String,List<String>,JList> myJListBinding;

  public ASProjectFromSourcesLibrariesStep(ASProjectFromSourcesSettings settings) {
    super();

    this.settings = settings;

    this.libPathChooser = new Computable<String>() {
      public String compute() {
        TreeFileChooser chooser = new TreeFileChooser();
        chooser.setMode(TreeFileChooser.MODE_FILES);
        IFile file = chooser.showDialog();
        if (file == null) {
          return null;
        }
        return file.getAbsolutePath();
      }
    };

    /*
    myJListBinding = SwingBindings.createJListBinding(
      UpdateStrategy.READ_WRITE,
      settings.getSwcPaths(),
      librariesList
    );
    */
  }

  @Override
  public void _init() {
    /*
    if (!myJListBinding.isBound()) {
      myJListBinding.bind();
    }
    */

    updateList();
  }

  private void updateList() {
    listModel.removeAllElements();
    for (String path : settings.getSwcPaths()) {
      listModel.addElement(path);
    }
  }

  private JPanel createLibrariesPanel(JList list) {
    JPanel result = new JPanel(new BorderLayout());

    result.add(createToolbar(), BorderLayout.WEST);

    JScrollPane comp = new JScrollPane(list);
    comp.doLayout();
    result.add(comp, BorderLayout.CENTER);

    return result;
  }

  private JComponent createToolbar() {
    this.addAction = new ListAddAction(librariesList) {
      protected int doAdd(AnActionEvent e) {
        String libPath = libPathChooser.compute();
        if (libPath == null) return -1;

        settings.getSwcPaths().add(libPath);

        updateList();

        return settings.getSwcPaths().indexOf(libPath);
      }
    };

    this.removeAction = new ListRemoveAction(librariesList) {
      protected void doRemove(AnActionEvent e) {
        int[] indices = librariesList.getSelectedIndices();
        Arrays.sort(indices);

        for (int i = indices.length - 1; i >= 0; i--) {
          ASProjectFromSourcesLibrariesStep.this.settings.getSwcPaths().remove(indices[i]);
        }

        updateList();
      }
    };

    DefaultActionGroup group = ActionUtils.groupFromActions(addAction, removeAction);
    ActionToolbar toolbar = ActionManager.getInstance().createActionToolbar(ActionPlaces.UNKNOWN, group, false);
    return toolbar.getComponent();
  }

  @Override
  protected void _check() {
    // Do nothing
  }

  public JComponent createControlComponent() {
    JPanel panel = new JPanel(new GridBagLayout());

    Insets defaultInsets = new Insets(0, 5, 0, 5);
    Insets tfInsets = new Insets(0, 5, 4, 5);

    // Label
    GridBagConstraints c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = defaultInsets;
    c.gridx = 0;
    c.gridy = 0;
    c.weightx = 1;
    JLabel nameLabel = new JLabel();
    nameLabel.setText("Libraries to be added to the project:");
    panel.add(nameLabel, c);

    this.listModel = new DefaultListModel();
    this.librariesList = new JList(listModel);

    // Libraries panel
    c = new GridBagConstraints();
    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.NORTHEAST;
    c.insets = tfInsets;
    c.gridx = 0;
    c.gridy = 1;
    c.weightx = 1;
    c.weighty = 1;
    panel.add(createLibrariesPanel(librariesList), c);

    return panel;
  }

  public boolean finishable() {
    return true;
  }

  public URL getImageURL() {
    return Icons.NEW_PROJECT_IMAGE_URL;
  }

  @NotNull
  public String getImageText() {
    return "From Sources";
  }

}
