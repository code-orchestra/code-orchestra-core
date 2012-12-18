package codeOrchestra.rgs.client.settings.view;

import com.intellij.openapi.wm.WindowManager;
import com.intellij.ui.LightColors;
import codeOrchestra.rgs.RGSException;
import codeOrchestra.rgs.client.appimpl.ApplicationRGSClient;
import codeOrchestra.rgs.state.RGSConnectedState;
import codeOrchestra.rgs.state.RGSNotConnectedState;
import codeOrchestra.rgs.state.RGSState;
import codeOrchestra.rgs.state.RGSUnknownState;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.logging.Logger;
import org.apache.commons.lang.ObjectUtils;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * @author Alexander Eliseyev
 */
public class RGSServerStatePanel extends JDialog implements StateRefreshable {

  private static final Logger LOG = Logger.getLogger(RGSServerStatePanel.class);
  private static final String UNKNOWN_MEMORY_CAPTION = "UNKNOWN";

  private final JTextField stateField;

  private long myTotalMemory = 10;
  private long myUsedMemory = 10;

  private JLabel myMemoryLabel = new JLabel(" ", JLabel.CENTER) {
    protected void paintComponent(Graphics g) {
      g.setColor(Color.WHITE);
      g.fillRect(0, 0, getWidth(), getHeight());
      g.setColor(LightColors.BLUE);

      g.fillRect(0, 0, (int) (getWidth() * myUsedMemory / myTotalMemory), getHeight());
      g.setColor(Color.BLACK);
      g.drawRect(0, 0, getWidth() - 1, getHeight() - 1);
      super.paintComponent(g);
    }
  };

  private JButton restartButton;
  private JButton connectButton;

  public RGSServerStatePanel() {
    setLayout(new BorderLayout());

    JPanel panel = new JPanel();
    panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));

    JPanel statePanel = new JPanel(new GridLayout(0, 1));
    statePanel.setBorder(new EmptyBorder(5, 5, 5, 5));
    statePanel.add(new JLabel("RGS State : "));
    stateField = new JTextField();
    stateField.setEditable(false);
    statePanel.add(stateField);
    panel.add(statePanel);

    JPanel memoryPanel = new JPanel(new GridLayout(0, 1));
    memoryPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
    memoryPanel.add(new JLabel("RGS Memory : "));
    memoryPanel.add(myMemoryLabel);
    panel.add(memoryPanel);

    JPanel buttonsPanel = new JPanel(new GridLayout(1, 2));
    buttonsPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
    buttonsPanel.add(new JLabel(""));
    connectButton = new JButton("Connect");
    connectButton.addActionListener(new ActionListener() {
      @Override
      public void actionPerformed(ActionEvent actionEvent) {
        try {
          ApplicationRGSClient.getInstance().init();
        } catch (RGSException e) {
          ApplicationRGSClient.getInstance().reportRGSError("Unable to init the RGS connection", e, "RGS Connection");
        }
      }
    });
    buttonsPanel.add(connectButton);
    restartButton = new JButton("Restart");
    restartButton.addActionListener(new ActionListener() {
      @Override
      public void actionPerformed(ActionEvent actionEvent) {
        try {
          ApplicationRGSClient.getInstance().restart();
        } catch (RGSException e) {
          ApplicationRGSClient.getInstance().reportRGSError("Unable to restart the RGS", e, "RGS Connection");
          return;
        }

        new Thread() {
          @Override
          public void run() {
            connectButton.setEnabled(false);
            try { Thread.sleep(2000); } catch (InterruptedException e) { }

            try {
              ApplicationRGSClient.getInstance().init();
            } catch (RGSException e) {
              // ignore
            }
          }
        }.start();
      }
    });
    buttonsPanel.add(restartButton);
    panel.add(buttonsPanel);

    add(panel, BorderLayout.NORTH);
    setLocationRelativeTo(WindowManager.getInstance().getFrame(ProjectHolder.getProject()));
    setResizable(false);
    setMinimumSize(new Dimension(300, 100));
    setTitle("Remote Generation Server");

    pack();
  }

  @Override
  public void refresh(RGSState state) {
    String newPresentation = state.getPresentation();
    if (!ObjectUtils.equals(newPresentation, stateField.getText())) {
      stateField.setText(newPresentation);
    }

    updateMemory(state);
    updateButtons(state);
  }

  private void updateButtons(RGSState state) {
    // RF-1143
    ApplicationRGSClient rgsClient = ApplicationRGSClient.getInstance();
    if (rgsClient == null) {
      return;
    }

    connectButton.setEnabled(state instanceof RGSNotConnectedState);
    try {
      restartButton.setEnabled(rgsClient.canBeRestarted());
    } catch (RGSException e) {
      LOG.error("Can't update the restart button state", e);
      restartButton.setEnabled(false);
    }

    if (state instanceof RGSUnknownState) {
      connectButton.setText("Reconnect");
      connectButton.setEnabled(true);
    }
  }

  private void updateMemory(RGSState state) {
    if (state instanceof RGSConnectedState) {
      RGSConnectedState connectedState = (RGSConnectedState) state;
      myUsedMemory = connectedState.getUsedMemory();
      myTotalMemory = connectedState.getTotalMemory();
      myMemoryLabel.setText(myUsedMemory + "M of " + myTotalMemory + "M");
    } else {
      myMemoryLabel.setText(UNKNOWN_MEMORY_CAPTION);
    }

  }

}
