package codeOrchestra.actionscript.wizards.newproject.fromexternal;

import com.intellij.ide.wizard.CommitStepException;
import codeOrchestra.actionscript.wizards.settings.ASNewProjectRootSettings;
import jetbrains.mps.ide.common.PathField;

import javax.swing.JPanel;
import java.awt.Checkbox;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.io.File;

/**
 * @author Anton.I.Neverov
 */
public abstract class ASExternalPanel extends JPanel {

  protected ASExternalImporter myImporter;

  public abstract void commit();

  public abstract void check() throws CommitStepException;

  public abstract void init();

  protected abstract void updateProjectName();

  protected String getDefaultProjectName() {
    int n = 1;
    while (true) {
      String projectName = "Project" + n;
      if (!(new File(getProjectsDir(), projectName).exists())) {
        return projectName;
      }
      n = n + 1;
    }
  }

  protected String createValidProjectName(String name) {
    if (!(new File(getProjectsDir(), name).exists())) {
      return name;
    }
    int n = 1;
    while (true) {
      String projectName = name + n;
      if (!(new File(getProjectsDir(), projectName).exists())) {
        return projectName;
      }
      n = n + 1;
    }
  }

  protected String getProjectsDir() {
    return ASNewProjectRootSettings.getInstance().getProjectRoot();
  }

  protected PathField createExternalProjectField() {

    final PathField f = new PathField();

    f.addPropertyChangeListener(new PropertyChangeListener() {
      @Override
      public void propertyChange(PropertyChangeEvent evt) {
        try {
          myImporter.setProject(f.getPath());
        } catch (ASExternalImporterException e) {
          // Ignore
        }
        updateProjectName();
      }
    });

    return f;
  }

  protected Checkbox createCopyLibsCheckbox() {

    final Checkbox c = new Checkbox("Copy swc libraries to project", false);

    c.addItemListener(new ItemListener() {
      @Override
      public void itemStateChanged(ItemEvent e) {
        myImporter.setCopyLibraries(c.getState());
      }
    });

    return c;
  }

  protected Checkbox createCopyConfigsCheckbox() {

    final Checkbox c = new Checkbox("Copy compiler config files to project", false);

    c.addItemListener(new ItemListener() {
      @Override
      public void itemStateChanged(ItemEvent e) {
        myImporter.setCopyConfigFiles(c.getState());
      }
    });

    return c;
  }

}
