package codeOrchestra.rgs.client.settings.view;

import codeOrchestra.rgs.client.appimpl.ApplicationRGSClient;
import codeOrchestra.rgs.state.RGSState;

import javax.swing.SwingUtilities;

/**
 * @author Alexander Eliseyev
 */
public class RGSStateViewRefreshThread extends Thread {

  private static final int SLEEP_TIME = 500;

  private boolean mustStop;
  private StateRefreshable[] refreshables;

  public RGSStateViewRefreshThread(StateRefreshable... refreshables) {
    this.refreshables = refreshables;
  }

  @Override
  public void run() {
    while (true) {
      if (mustStop) {
        return;
      }

      final ApplicationRGSClient rgsClient = ApplicationRGSClient.getInstance();
      for (final StateRefreshable refreshable : refreshables) {
        if (rgsClient != null) {
          final RGSState rgsState = rgsClient.getState();

          SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
              refreshable.refresh(rgsState);
            }
          });
        }
      }

      try {
        Thread.sleep(SLEEP_TIME);
      } catch (InterruptedException e) {
        // ignore
      }
    }
  }

  public void stopRightThere() {
    this.mustStop = true;
  }

}