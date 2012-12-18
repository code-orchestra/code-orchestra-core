/*
 * Copyright 2003-2010 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.workbench.license;

import com.intellij.idea.StartupAction;
import com.intellij.ui.LicenseeInfoProvider;
import codeOrchestra.actionScript.license.CodeOrchestraLicenseDialogs;
import codeOrchestra.actionScript.license.CodeOrchestraLicenseManager;
import codeOrchestra.license.ExpirationHelper;
import codeOrchestra.license.ExpirationStrategy;
import jetbrains.mps.InternalFlag;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.util.FileUtil;
import jetbrains.mps.util.PathManager;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import javax.swing.JOptionPane;
import java.io.File;

public class MPSLicenseManager extends LicenseeInfoProvider {

  @CodeOrchestraPatch
  public void startUp(StartupAction action) {
    // Check if evaluation license has expired
    if (isEvaluationLicense()) {
      final ExpirationStrategy expirationStrategy = ExpirationHelper.getExpirationStrategy();
      final boolean[] expired = new boolean[1];

      ThreadUtils.runInUIThreadAndWait(new Runnable() {
        public void run() {
          if (ExpirationHelper.hasExpired()) {
            expired[0] = !expirationStrategy.showTrialExpiredDialog();
          } else {
            expirationStrategy.showTrialInProgressDialog();
            expired[0] = false;
          }
        }
      });
      if (expired[0]) {
        expirationStrategy.handleExpiration();

        if (expirationStrategy.exitIfExpired()) {
          action.cancel();
          return;
        }
      }
    }

    action.proceed();
  }

  public String getLicensedToMessage() {
    return CodeOrchestraLicenseManager.getLicensedTo();
  }

  @CodeOrchestraPatch
  public String getLicenseRestrictionsMessage() {
    return FileUtil.read(new File(PathManager.getHomePath() + File.separator + "license" + File.separator + "codeOrchestra_license.txt"));
  }

  @CodeOrchestraPatch
  public boolean isEvaluationLicense() {
    /*
    if (InternalFlag.isInternalMode()) {
      return false;
    }
    */
    return !CodeOrchestraLicenseManager.isLicenseValid();
  }
}
