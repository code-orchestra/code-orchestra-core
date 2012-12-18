package codeOrchestra.rgs.local;

import com.intellij.openapi.application.ApplicationAdapter;
import com.intellij.openapi.application.ApplicationManager;

/**
 * @author Alexander Eliseyev
 */
public final class LocalRGSProcessHolder {

  private static LocalRGSProcessHolder instance;

  public static synchronized LocalRGSProcessHolder getInstance() {
    if (instance == null) {
      instance = new LocalRGSProcessHolder();
    }
    return instance;
  }

  static {
    ApplicationManager.getApplication().addApplicationListener(new ApplicationAdapter() {
      @Override
      public void applicationExiting() {
        getInstance().destroyCurrentLocalRGSProcess();
      }
    });
  }

  private LocalRGSProcessHolder() {
  }

  private Process currentLocalRGSProcess;

  public synchronized void destroyCurrentLocalRGSProcess() {
    if (currentLocalRGSProcess != null) {
      try {
        currentLocalRGSProcess.destroy();
      } catch (Throwable t) {
        // ignore
      }
    }
  }

  public synchronized Process getCurrentLocalRGSProcess() {
    return currentLocalRGSProcess;
  }

  public synchronized void setCurrentLocalRGSProcess(Process currentLocalRGSProcess) {
    this.currentLocalRGSProcess = currentLocalRGSProcess;
  }

}
