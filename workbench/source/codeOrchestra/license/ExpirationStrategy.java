package codeOrchestra.license;

import com.intellij.idea.StartupAction;

/**
 * @author Alexander Eliseyev
 */
public interface ExpirationStrategy {

  int getDaysInUse();

  int getExpirationPeriod();

  boolean exitIfExpired();

  void handleExpiration();

  /**
   * @return whether the user entered a serial number in the dialog
   */
  boolean showTrialExpiredDialog();

  void showTrialInProgressDialog();

}
