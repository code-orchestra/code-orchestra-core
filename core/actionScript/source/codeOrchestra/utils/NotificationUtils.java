package codeOrchestra.utils;

import codeOrchestra.rgs.client.appimpl.ApplicationRGSClient;
import codeOrchestra.rgs.client.appimpl.RGSStatusWidget;
import codeOrchestra.rgs.logging.Severity;
import com.intellij.openapi.ui.popup.Balloon;
import com.intellij.openapi.ui.popup.Balloon.Position;
import com.intellij.openapi.ui.popup.JBPopupAdapter;
import com.intellij.openapi.ui.popup.JBPopupFactory;
import com.intellij.openapi.ui.popup.LightweightWindowEvent;
import com.intellij.openapi.wm.IdeFrame;
import com.intellij.openapi.wm.WindowManager;
import com.intellij.openapi.wm.ex.StatusBarEx;
import com.intellij.ui.LightColors;
import com.intellij.ui.awt.RelativePoint;
import com.intellij.ui.popup.NotificationPopup;
import com.intellij.util.ui.UIUtil;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.SwingUtilities;
import java.awt.Color;
import java.awt.Point;

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
    IdeFrame[] allFrames = WindowManager.getInstance().getAllFrames();
    if (allFrames == null || allFrames.length == 0) {
      return;
    }

    IdeFrame ideFrame = allFrames[0];

    final String caption = String.format("<html><b>%s</b><br/>%s</html>", title, TextUtils.trim(message, messageLengthLimit));

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

  public static void showRGSBalloon(String text) {
    Balloon balloon = JBPopupFactory.getInstance().createBalloonBuilder(new JLabel(text)).setFillColor(LightColors.YELLOW).createBalloon();
    RGSStatusWidget statusWidget = ApplicationRGSClient.getInstance().getStatusWidget();
    if (statusWidget == null) {
      return;
    }

    balloon.show(new RelativePoint(statusWidget, new Point(statusWidget.getWidth() / 2, 0)), Position.above);
  }

}
