package codeOrchestra.actionscript.wizards.newproject;

import com.intellij.openapi.application.ApplicationManager;
import codeOrchestra.actionscript.view.ActionScriptViewPane;
import codeOrchestra.actionscript.wizards.AbstractDynamicWizard;
import com.intellij.ide.IdeBundle;
import com.intellij.ide.impl.ProjectUtil;
import com.intellij.ide.wizard.CommitStepException;
import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.progress.Task;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ex.ProjectManagerEx;
import com.intellij.openapi.startup.StartupManager;
import com.intellij.openapi.ui.Messages;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.workbench.dialogs.project.newproject.ProjectFactory.ProjectNotCreatedException;
import org.jetbrains.annotations.NotNull;

import javax.swing.JOptionPane;
import java.awt.Frame;
import java.util.List;
import java.util.ArrayList;

/**
 * @author Alexander Eliseyev
 */
public class ASNewProjectWizard extends AbstractDynamicWizard<ASNewProjectStep> {

  private static final Logger LOG = Logger.getLogger(ASNewProjectWizard.class);

  private Project openProject;

  private ASProjectSourceStep sourceStep;
  private List<ASNewProjectStep> sourceSteps = new ArrayList<ASNewProjectStep>();
  private boolean initialized;

  private ASProjectSource currentProjectSource;

  public ASNewProjectWizard(Project project) {
    super("New ActionScript Project", project);

    sourceStep = new ASProjectSourceStep(new ASProjectSourceListener() {
      public void onSourceChange(ASProjectSource source) {
        updateSource(source);
      }
    });

    this.openProject = project;

    addStep(sourceStep);
    sourceStep.initFirstSource();

    init();
  }

  protected void doNextAction() {
    final ASNewProjectStep currentStep = getCurrentStepObject();
    try {
      currentStep._check();
    }
    catch (final CommitStepException exc) {
      Frame frame = JOptionPane.getFrameForComponent(currentStep.getComponent());
      Messages.showErrorDialog(
        frame,
        exc.getMessage()
      );
      return;
    }

    super.doNextAction();
  }

  protected void updateStep() {
    super.updateStep();

    getFinishButton().setEnabled(getCurrentStepObject().finishable());
    getNextButton().setEnabled(getCurrentStepObject().continuable());
  }

  @Override
  protected void init() {
    super.init();
    initialized = true;
  }

  private void updateSource(ASProjectSource projectSource) {
    // 0 - do nothing if the source hasn't changed
    if (currentProjectSource != null && currentProjectSource.getID().equals(projectSource.getID())) {
      return;
    }

    // 1 - remove previous steps
    for (ASNewProjectStep prevSetStep : sourceSteps) {
      deleteStep(prevSetStep);
    }
    sourceSteps.clear();

    // 2 - add listeners    
    for (ASNewProjectStep step : projectSource.getSteps()) {
      sourceSteps.add(step);
      addStep(step);
    }

    // 3 - update current step
    if (initialized) {
      updateStep();
    }

    // 4 - memorize the source
    this.currentProjectSource = projectSource;
  }

  protected void doOKAction() {
    super.doOKAction();
    if (openProject != null) {
      ProjectUtil.closeAndDispose(openProject);
    }

    //invoke later is for plugins to be ready
    ApplicationManager.getApplication().invokeLater(new Runnable() {
      public void run() {
        try {
          // 1 - Create a project
          Project createdProject = currentProjectSource.createProject(openProject);

          // 2 - Activate
          activate(createdProject);
        } catch (ProjectNotCreatedException e) {
          Messages.showErrorDialog(getContentPane(), e.getMessage());
        }
      }
    });
  }

  private void activate(final Project createdProject) {
    if (createdProject == null) {
      return;
    }

    ProjectManagerEx projectManager = ProjectManagerEx.getInstanceEx();
    boolean opened = projectManager.openProject(createdProject);

    if (opened) {
      // Activate ActionScript View
      StartupManager.getInstance(createdProject).runWhenProjectIsInitialized(new Runnable() {
        public void run() {
          ActionScriptViewPane.getInstance(createdProject).activate();
        }
      });
    }
  }

  @Override
  protected String getHelpID() {
    return null;
  }

}
