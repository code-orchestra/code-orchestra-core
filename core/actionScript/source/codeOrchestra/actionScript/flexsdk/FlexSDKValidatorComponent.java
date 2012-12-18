package codeOrchestra.actionScript.flexsdk;

import com.intellij.openapi.components.AbstractProjectComponent;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.startup.StartupManager;
import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings;
import codeOrchestra.rgs.logging.Severity;
import codeOrchestra.utils.NotificationUtils;

/**
 * @author Alexander Eliseyev
 */
public class FlexSDKValidatorComponent extends AbstractProjectComponent implements ProjectComponent {

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
          NotificationUtils.notifyWithABalloon("Invalid Flex SDK path", e.getMessage(), Severity.ERROR, null, -1);
        }
      }
    });
  }
}
