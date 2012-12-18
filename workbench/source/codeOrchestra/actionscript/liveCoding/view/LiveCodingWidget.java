package codeOrchestra.actionscript.liveCoding.view;

import com.intellij.openapi.util.SystemInfo;
import com.intellij.openapi.wm.CustomStatusBarWidget;
import com.intellij.openapi.wm.StatusBar;
import com.intellij.openapi.wm.StatusBarWidget;
import com.intellij.util.ui.UIUtil;
import codeOrchestra.actionscript.liveCoding.LiveCodingManager;
import codeOrchestra.actionscript.liveCoding.LiveCodingSession;
import codeOrchestra.actionscript.liveCoding.listener.LiveCodingAdapter;
import codeOrchestra.actionscript.liveCoding.listener.LiveCodingListener;
import codeOrchestra.actionscript.liveCoding.view.icons.Icons;
import org.jetbrains.annotations.NotNull;

import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.SwingUtilities;

/**
 * @author Alexander Eliseyev
 */
public class LiveCodingWidget extends JLabel implements CustomStatusBarWidget {

  public static final String ID = "LiveCodingWidget";

  private final LiveCodingListener liveCodingListener = new LiveCodingAdapter() {
    @Override
    public void onSessionStart(LiveCodingSession session) {
      updatePresentation(true, session);
    }

    @Override
    public void onSessionEnd(LiveCodingSession session) {
      updatePresentation(false, session);
    }
  };

  private LiveCodingManager liveCodingManager;

  public LiveCodingWidget(LiveCodingManager liveCodingManager) {
    this.liveCodingManager = liveCodingManager;

    setOpaque(false);
    setFocusable(false);
    setBorder(StatusBarWidget.WidgetBorder.INSTANCE);
    updatePresentation(false, null);

    liveCodingManager.addListener(liveCodingListener);

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
        setToolTipText(sessionOn ? "LiveCoding Session " + session.getSessionId() + " is in Progress" : "No LiveCoding Session");
        setIcon(sessionOn ? Icons.ON_ICON : Icons.OFF_ICON);
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
    return LiveCodingWidget.ID;
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
