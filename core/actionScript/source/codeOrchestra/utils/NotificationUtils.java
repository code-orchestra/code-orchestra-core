package codeOrchestra.utils;

import com.intellij.openapi.ui.popup.JBPopupAdapter;
import com.intellij.openapi.ui.popup.LightweightWindowEvent;
import com.intellij.openapi.wm.IdeFrame;
import com.intellij.openapi.wm.WindowManager;
import com.intellij.openapi.wm.ex.StatusBarEx;
import com.intellij.ui.LightColors;
import com.intellij.ui.popup.NotificationPopup;
import com.intellij.util.ui.UIUtil;
import codeOrchestra.rgs.logging.Severity;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.SwingUtilities;
import java.awt.Color;

/**
 * @author Alexander Eliseyev
 */
public final class NotificationUtils {

  public static final int MESSAGE_MAX_LENGTH = 60;

  public static void notifyWithABalloon(@NotNull String title, @NotNull String message, @NotNull Severity severity) {
    notifyWithABalloon(title, message, severity, null);
  }

  public static void notifyWithABalloon(@NotNull String title, @NotNull String message, @NotNull Severity severity, final @Nullable Runnable onClose) {
    notifyWithABalloon(title, message, severity, onClose, MESSAGE_MAX_LENGTH);
  }

  public static void notifyWithABalloon(@NotNull String title, @NotNull String message, @NotNull Severity severity, final @Nullable Runnable onClose, int messageLengthLimit) {
    final String caption = String.format("<html><b>%s</b><br/>%s</html>", title, TextUtils.trim(message, messageLengthLimit));

    IdeFrame ideFrame = WindowManager.getInstance().getAllFrames()[0];

    final StatusBarEx statusBar = (StatusBarEx) ideFrame.getStatusBar();
    final JLabel content = new JLabel(caption);

    final Icon balloonIcon;
    final Color color;
    switch (severity) {
      case INFO:
        balloonIcon = UIUtil.getBalloonInformationIcon();
        color = LightColors.GREEN;
        break;
      case WARNING:
        balloonIcon = UIUtil.getBalloonWarningIcon();
        color = LightColors.YELLOW;
        break;
      case ERROR:
        balloonIcon = UIUtil.getBalloonErrorIcon();
        color = LightColors.RED;
        break;
      default:
        throw new IllegalArgumentException("Unsupported severity kind: " + severity.name());
    }

    content.setIcon(balloonIcon);

    SwingUtilities.invokeLater(new Runnable() {
      @Override
      public void run() {
        NotificationPopup notificationPopup = new NotificationPopup((JComponent) statusBar, content, color, false, null, true);
        if (onClose != null) {
          notificationPopup.addListener(new JBPopupAdapter() {
            @Override
            public void onClosed(LightweightWindowEvent event) {
              onClose.run();
            }
          });
        }
      }
    });
  }

}
