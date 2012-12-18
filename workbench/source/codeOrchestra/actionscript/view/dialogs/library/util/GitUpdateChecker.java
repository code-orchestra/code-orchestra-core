package codeOrchestra.actionscript.view.dialogs.library.util;

import com.intellij.openapi.components.AbstractProjectComponent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.startup.StartupManager;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;
import jetbrains.mps.smodel.ModelAccess;
import org.jetbrains.annotations.NotNull;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * author: Daniil
 */
public class GitUpdateChecker extends AbstractProjectComponent {


  public GitUpdateChecker(Project project) {
    super(project);
  }

  public void initComponent() {
    StartupManager.getInstance(myProject).runWhenProjectIsInitialized(new Runnable() {
      @Override
      public void run() {
        ModelAccess.instance().runReadAction(new Runnable() {
          @Override
          public void run() {
            MPSProject mpsProject = myProject.getComponent(MPSProject.class);
            List<Solution> projectSolutions = mpsProject.getProjectSolutions();
            List<String> updatedSolutions = new ArrayList<String>();

            for (Solution solution : projectSolutions) {
              try {
                SolutionDescriptor moduleDescriptor = solution.getModuleDescriptor();
                if (moduleDescriptor != null && moduleDescriptor.getGitTimeUpdate() != null) {
                  String gitHubUrl = moduleDescriptor.getGitHubUrl();
                  if (!(moduleDescriptor.getGitTimeUpdate().equals(GitHubUtil.getLastUpdateTime(gitHubUrl)))) {
                    updatedSolutions.add(solution.getModuleFqName());
                  }
                }
              } catch (IOException e) {
                //
              }
            }
            if (!updatedSolutions.isEmpty()) {
              String message = updatedSolutions.toString().replace("[", "").replace("]", "");
              JFrame frame = new JFrame();
              frame.setTitle("New Update");
              JOptionPane.showMessageDialog(frame, "New update is available for following libraries:\n" + message);
            }
          }
        });

      }
    });
  }

  @NotNull
  public String getComponentName() {
    return "GitUpdateChecker";
  }

  public void projectOpened() {
  }
}
