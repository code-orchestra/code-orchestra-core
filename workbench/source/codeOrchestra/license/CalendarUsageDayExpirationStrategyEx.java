package codeOrchestra.license;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.application.impl.ApplicationImpl;
import codeOrchestra.actionScript.license.CodeOrchestraLicenseDialogs;
import codeOrchestra.actionScript.license.CodeOrchestraLicenseManager;
import codeOrchestra.actionScript.license.VersionHelper;
import org.apache.commons.lang.time.DateUtils;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.prefs.BackingStoreException;
import java.util.prefs.Preferences;

/**
 * This implementation counts the minutes of usage each day - RE-2716.
 *
 * @author Alexander Eliseyev
 */
public class CalendarUsageDayExpirationStrategyEx implements ExpirationStrategy {

  private static final SimpleDateFormat dateFormat = new SimpleDateFormat("ddMMyy");
  private static final int EXPIRATION_DAYS = 30;
  private static final int EXPIRED_SESSION_MINUTES = 30;

  private static final String DATE_STRING = "popriste" + VersionHelper.getVersionCodeName();

  private static final Preferences preferences = Preferences.userNodeForPackage(CalendarUsageDayExpirationStrategyEx.class);

  private long startUpTime;
  private Thread expirationThread;

  @Override
  public boolean exitIfExpired() {
    return todayUsageLimitExpired();
  }

  private boolean todayUsageLimitExpired() {
    return (getTodayUsageMinutes() + 1) > EXPIRED_SESSION_MINUTES;
  }

  private int getTodayUsageMinutesLeft() {
    return EXPIRED_SESSION_MINUTES - getTodayUsageMinutes();
  }

  private int getTodayUsageMinutes() {
    return preferences.getInt(getTodayUsageMinutesKey(), 0);
  }

  private void incrementTodayUsageMinutes() {
    int incrementedValue = getTodayUsageMinutes() + 1;
    try {
      preferences.putInt(getTodayUsageMinutesKey(), incrementedValue);
      preferences.sync();
    } catch (BackingStoreException e) {
      throw new RuntimeException("Can't sync license expiry data", e);
    }
  }

  @Override
  public void handleExpiration() {
    if (todayUsageLimitExpired()) {
      return;
    }

    this.startUpTime = System.currentTimeMillis();
    this.expirationThread = new Thread() {
      public void run() {
        while (true) {
          try {
            Thread.sleep(DateUtils.MILLIS_PER_MINUTE);
            incrementTodayUsageMinutes();
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
          "Expired license editor " + EXPIRED_SESSION_MINUTES + " daily minute(s) session is over, the program will now quit",
          "Expired license",
          JOptionPane.INFORMATION_MESSAGE);

        ((ApplicationImpl) ApplicationManager.getApplication()).exit(true);
      }
    };
    this.expirationThread.start();
  }

  @Override
  public boolean showTrialExpiredDialog() {
    String expireMessage = null;
    Object[] objects = null;

    if (todayUsageLimitExpired()) {
      expireMessage = String.format("%d day(s) evaluation license has expired and the daily %d minutes limited usage period is over. \nYou may enter a serial number to continue using CodeOrchestra ActionScript Editor",
        getExpirationPeriod(), EXPIRED_SESSION_MINUTES);
      objects = new Object[] {"Exit", "Enter Serial Number"};
    } else {
      if (getTodayUsageMinutes() == 0) {
        expireMessage = String.format("%d day(s) evaluation license has expired. Your program daily usage will be limited to %d minutes unless you enter a serial number",
          getExpirationPeriod(), EXPIRED_SESSION_MINUTES);
      } else {
        expireMessage = String.format("%d day(s) evaluation license has expired. You have %d minutes of daily limited program usage left unless you enter a serial number",
          getExpirationPeriod(), getTodayUsageMinutesLeft());
      }

      objects = new Object[] {"Continue Evaluation", "Enter Serial Number"};
    }

    JFrame dummyFrame = new JFrame("Evaluation License");
    int result = JOptionPane.showOptionDialog(dummyFrame, expireMessage, "Evaluation License", JOptionPane.DEFAULT_OPTION, JOptionPane.QUESTION_MESSAGE, null, objects, "---");
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

  private static String getTodayUsageMinutesKey() {
    return "upotreba" + getToday();
  }

  private static String getToday() {
    return dateFormat.format(new Date());
  }

}
