package codeOrchestra.license;

import com.intellij.idea.StartupAction;
import codeOrchestra.actionScript.license.CodeOrchestraLicenseDialogs;
import codeOrchestra.actionScript.license.VersionHelper;
import org.apache.commons.lang.StringUtils;

import javax.swing.JOptionPane;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.prefs.BackingStoreException;
import java.util.prefs.Preferences;

/**
 * @author Alexander Eliseyev
 */
@Deprecated
public class ActualUsageDayExpirationStrategy implements ExpirationStrategy {

  private static final String DATES_STRING = "magicString" + VersionHelper.getVersionCodeName();
  private static final String SEPARATOR = "#";

  private static final SimpleDateFormat dateFormat = new SimpleDateFormat("ddMMyy");

  private static final Preferences preferences = Preferences.userNodeForPackage(ActualUsageDayExpirationStrategy.class);

  @Override
  public boolean showTrialExpiredDialog() {
    String expireMessage = String.format("%d day(s) evaluation license has expired. You need to enter a serial number to continue using the product",
      getExpirationPeriod());
    int result = JOptionPane.showOptionDialog(null, expireMessage, "Evaluation License", JOptionPane.DEFAULT_OPTION, JOptionPane.QUESTION_MESSAGE, null, new Object[]{"Cancel", "Enter Serial Number"}, "---");

    if (result == 0 || result == -1) {
      return false;
    } else {
      if (CodeOrchestraLicenseDialogs.showSerialNumberDialog()) {
        return true;
      }
    }

    return false;
  }

  @Override
  public void showTrialInProgressDialog() {
    CodeOrchestraLicenseDialogs.showTrialInProgressDialog();
  }

  @Override
  public boolean exitIfExpired() {
    return true;
  }

  @Override
  public void handleExpiration() {
    // do nothing
  }

  @Override
  public int getDaysInUse() {
    String dateStr = getUpdatedDatesString();
    return StringUtils.countMatches(dateStr, SEPARATOR);
  }

  @Override
  public int getExpirationPeriod() {
    return 30;
  }

  private static String getUpdatedDatesString() {
    String today = getToday();
    String dateStr = preferences.get(DATES_STRING, "");

    if (StringUtils.isEmpty(dateStr)) {
      dateStr = SEPARATOR + getToday();
    } else if (!dateStr.contains(today)) {
      dateStr += SEPARATOR + getToday();
    }

    preferences.put(DATES_STRING, dateStr);

    try {
      preferences.sync();
    } catch (BackingStoreException e) {
      throw new RuntimeException("Can't sync license expiry data", e);
    }

    return dateStr;
  }

  private static String getToday() {
    return dateFormat.format(new Date());
  }

}
