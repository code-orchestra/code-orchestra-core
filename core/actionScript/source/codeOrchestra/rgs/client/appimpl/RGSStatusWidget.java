package codeOrchestra.rgs.client.appimpl;

import com.intellij.openapi.util.SystemInfo;
import com.intellij.openapi.wm.CustomStatusBarWidget;
import com.intellij.openapi.wm.StatusBar;
import com.intellij.openapi.wm.StatusBarWidget;
import com.intellij.util.ui.UIUtil;
import codeOrchestra.rgs.client.appimpl.icons.Icons;
import codeOrchestra.rgs.client.settings.view.RGSServerStatePanel;
import codeOrchestra.rgs.client.settings.view.StateRefreshable;
import codeOrchestra.rgs.state.RGSConnectedState;
import codeOrchestra.rgs.state.RGSErrorState;
import codeOrchestra.rgs.state.RGSNotConnectedState;
import codeOrchestra.rgs.state.RGSState;
import org.jetbrains.annotations.NotNull;

import javax.swing.JButton;
import javax.swing.JComponent;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * @author Alexander Eliseyev
 */
public class RGSStatusWidget extends JButton implements CustomStatusBarWidget, StateRefreshable {

  public static final String ID = "RGSStatus";

  public RGSStatusWidget(final RGSServerStatePanel serverStatePanel) {
    super(Icons.DISCONNECTED);

    setOpaque(false);
    setFocusable(false);

    addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        serverStatePanel.setVisible(true);
      }
    });

    setBorder(StatusBarWidget.WidgetBorder.INSTANCE);
    updateUI();
  }

  @Override
  public void updateUI() {
    super.updateUI();
    setFont(SystemInfo.isMac ? UIUtil.getLabelFont().deriveFont(11.0f) : UIUtil.getLabelFont());
  }

  @Override
  public void refresh(RGSState state) {
    if (state instanceof RGSNotConnectedState) {
      setIcon(Icons.DISCONNECTED);
    } else if (state instanceof RGSErrorState) {
      setIcon(Icons.CONNECTED_ERRORS);
    } else if (state instanceof RGSConnectedState) {
      setIcon(Icons.CONNECTED);
    } else {
      setIcon(Icons.TRYING_TO_CONNECT);
    }
  }

  @Override
  public JComponent getComponent() {
    return this;
  }

  @NotNull
  @Override
  public String ID() {
    return ID;
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
  }

}
