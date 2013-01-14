package codeOrchestra.actionScript.flexsdk;

import codeOrchestra.rgs.server.RGSParametersCLI;
import com.intellij.openapi.components.AbstractProjectComponent;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.startup.StartupManager;
import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings;
import codeOrchestra.rgs.logging.Severity;
import codeOrchestra.utils.NotificationUtils;
import jetbrains.mps.logging.Logger;

/**
 * @author Alexander Eliseyev
 */
public class FlexSDKValidatorComponent extends AbstractProjectComponent implements ProjectComponent {

  private static final Logger LOG = Logger.getLogger(FlexSDKValidatorComponent.class);

  public FlexSDKValidatorComponent(Project project) {
    super(project);
  }

  @Override
  public void initComponent() {
    StartupManager.getInstance(myProject).runWhenProjectIsInitialized(new Runnable() {
      @Override
      public void run() {
        try {
          FlexSDKLibsManager.getInstance().checkIsValidFlexSDKPath(FlexSDKSettings.getInstance().getFlexSDKPath());
        } catch (FlexSDKNotPresentException e) {
          if (RGSParametersCLI.isInServerMode()) {
            LOG.error("Invalid Flex SDK path", e);
          } else {
            NotificationUtils.notifyWithABalloon("Invalid Flex SDK path", e.getMessage(), Severity.ERROR, null, -1);
          }
        }
      }
    });
  }
}
