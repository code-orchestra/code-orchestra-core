package codeOrchestra.actionscript.liveCoding.view;

import com.intellij.openapi.util.SystemInfo;
import com.intellij.openapi.wm.CustomStatusBarWidget;
import com.intellij.openapi.wm.StatusBar;
import com.intellij.util.ui.UIUtil;
import codeOrchestra.actionscript.liveCoding.LiveCodingManager;
import codeOrchestra.actionscript.liveCoding.LiveCodingSession;
import codeOrchestra.actionscript.liveCoding.listener.LiveCodingAdapter;
import codeOrchestra.actionscript.liveCoding.listener.LiveCodingListener;
import codeOrchestra.actionscript.liveCoding.view.icons.Icons;
import org.jetbrains.annotations.NotNull;

import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.SwingUtilities;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * @author Alexander Eliseyev
 */
public class LiveCodingPauseWidget extends JButton implements CustomStatusBarWidget {

  public static final String ID = "LiveCodingPauseWidget";

  private final LiveCodingListener liveCodingListener = new LiveCodingAdapter() {
    @Override
    public void onSessionStart(LiveCodingSession session) {
      updatePresentation(true, session);
    }

    @Override
    public void onSessionEnd(LiveCodingSession session) {
      updatePresentation(false, session);
    }

    @Override
    public void onSessionPause() {
      setPaused(true);
    }

    @Override
    public void onSessionResume() {
      setPaused(false);
    }

    private void setPaused(final boolean paused) {
      SwingUtilities.invokeLater(new Runnable() {
        @Override
        public void run() {
          LiveCodingPauseWidget.this.paused = paused;
          updatePresentationBasedOnPaused();
        }
      });
    }
  };

  private void updatePresentationBasedOnPaused() {
    this.setIcon(paused ? Icons.LIVE_PLAY : Icons.LIVE_PAUSE);
    this.setToolTipText(paused ? "Resume Live Session" : "Pause Live Session");
  }

  private LiveCodingManager liveCodingManager;
  private boolean paused;

  public LiveCodingPauseWidget(LiveCodingManager liveCodingManager) {
    this.liveCodingManager = liveCodingManager;

    setOpaque(false);
    setFocusable(false);
    setBorder(WidgetBorder.INSTANCE);
    updatePresentation(false, null);

    liveCodingManager.addListener(liveCodingListener);

    setVisible(false);

    addActionListener(new ActionListener() {
      @Override
      public void actionPerformed(ActionEvent actionEvent) {
        LiveCodingManager.instance().pauseCurrentSession(!paused);
      }
    });

    updateUI();
  }

  @Override
  public void updateUI() {
    super.updateUI();
    setFont(SystemInfo.isMac ? UIUtil.getLabelFont().deriveFont(11.0f) : UIUtil.getLabelFont());
  }

  private void updatePresentation(final boolean sessionOn, final LiveCodingSession session) {
    SwingUtilities.invokeLater(new Runnable() {
      @Override
      public void run() {
        setVisible(sessionOn);

        if (sessionOn) {
          updatePresentationBasedOnPaused();
        }
      }
    });
  }

  @Override
  public JComponent getComponent() {
    return this;
  }

  @NotNull
  @Override
  public String ID() {
    return LiveCodingPauseWidget.ID;
  }

  @Override
  public WidgetPresentation getPresentation(@NotNull PlatformType type) {
    return null;
  }

  @Override
  public void install(@NotNull StatusBar statusBar) {
  }

  @Override
  public void dispose() {
    liveCodingManager.removeListener(liveCodingListener);
  }

}
