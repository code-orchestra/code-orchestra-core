package codeOrchestra.license;

import com.intellij.idea.StartupAction;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.application.ex.ApplicationEx;
import com.intellij.openapi.application.impl.ApplicationImpl;
import codeOrchestra.actionScript.license.CodeOrchestraLicenseDialogs;
import codeOrchestra.actionScript.license.CodeOrchestraLicenseManager;
import codeOrchestra.actionScript.license.VersionHelper;
import org.apache.commons.lang.time.DateUtils;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import java.util.prefs.BackingStoreException;
import java.util.prefs.Preferences;

/**
 * @author Alexander Eliseyev
 */
public class CalendarUsageDayExpirationStrategy implements ExpirationStrategy {

  private static final int EXPIRATION_DAYS = 30;
  private static final int EXPIRED_SESSION_MINUTES = 30;

  private static final String DATE_STRING = "uporiste" + VersionHelper.getVersionCodeName();

  private static final Preferences preferences = Preferences.userNodeForPackage(CalendarUsageDayExpirationStrategy.class);

  private long startUpTime;
  private Thread expirationThread;

  @Override
  public boolean exitIfExpired() {
    return false;
  }

  @Override
  public void handleExpiration() {
    this.startUpTime = System.currentTimeMillis();
    this.expirationThread = new Thread() {
      public void run() {
        while (true) {
          try {
            Thread.sleep(DateUtils.MILLIS_PER_MINUTE);
          } catch (InterruptedException e) {
            terminate();
            return;
          }

          if (System.currentTimeMillis() - startUpTime > DateUtils.MILLIS_PER_MINUTE * EXPIRED_SESSION_MINUTES) {
            terminate();
            return;
          }
        }
      }

      void terminate() {
        // RE-2715
        // Serial number must've been entered after the app start
        if (CodeOrchestraLicenseManager.isLicenseValid()) {
          return;
        }

        JOptionPane.showMessageDialog(
          null,
          "Expired license editor " + EXPIRED_SESSION_MINUTES + " minute(s) session is over, the program will now quit",
          "Expired license",
          JOptionPane.INFORMATION_MESSAGE);

        ((ApplicationImpl) ApplicationManager.getApplication()).exit(true);
      }
    };
    this.expirationThread.start();
  }

  @Override
  public boolean showTrialExpiredDialog() {
    String expireMessage = String.format("%d day(s) evaluation license has expired. Your session will be limited to %d minutes unless you enter a serial number",
      getExpirationPeriod(), EXPIRED_SESSION_MINUTES);

    JFrame dummyFrame = new JFrame("Evaluation License");

    int result = JOptionPane.showOptionDialog(dummyFrame, expireMessage, "Evaluation License", JOptionPane.DEFAULT_OPTION, JOptionPane.QUESTION_MESSAGE, null, new Object[]{"Continue Evaluation" , "Enter Serial Number"}, "---");

    if (result == 1) {
      return CodeOrchestraLicenseDialogs.showSerialNumberDialog();
    }

    return false;
  }

  @Override
  public void showTrialInProgressDialog() {
    CodeOrchestraLicenseDialogs.showTrialInProgressDialog();
  }

  @Override
  public int getDaysInUse() {
    long curentTime = System.currentTimeMillis();
    String currentTimeStr = String.valueOf(curentTime);

    long firstUsageDate = Long.valueOf(preferences.get(DATE_STRING, currentTimeStr));
    if (curentTime == firstUsageDate) {
      try {
        preferences.put(DATE_STRING, currentTimeStr);
        preferences.sync();
      } catch (BackingStoreException e) {
        throw new RuntimeException("Can't sync license expiry data", e);
      }
    }

    return (int) ((curentTime - firstUsageDate) / DateUtils.MILLIS_PER_DAY) + 1;
  }

  @Override
  public int getExpirationPeriod() {
    return EXPIRATION_DAYS;
  }

}
