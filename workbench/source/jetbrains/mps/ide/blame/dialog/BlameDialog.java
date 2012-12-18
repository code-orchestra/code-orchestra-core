/*
 * Copyright 2003-2010 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.ide.blame.dialog;

import com.intellij.ide.BrowserUtil;
import com.intellij.openapi.application.ApplicationInfo;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.ui.Messages;
import com.intellij.openapi.vcs.history.VcsRevisionNumber;
import com.intellij.uiDesigner.core.GridConstraints;
import com.intellij.uiDesigner.core.GridLayoutManager;
import com.intellij.uiDesigner.core.Spacer;
import jetbrains.mps.ide.blame.IssueType;
import jetbrains.mps.ide.blame.command.Command;
import jetbrains.mps.ide.blame.command.Poster;
import jetbrains.mps.ide.blame.perform.Query;
import jetbrains.mps.ide.blame.perform.Response;
import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings.DialogDimensions;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.util.PathManager;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vcs.VcsMigrationUtil;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.jetbrains.annotations.NotNull;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import java.awt.Dialog;
import java.awt.Dimension;
import java.awt.Frame;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.io.PrintWriter;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

public class BlameDialog extends BaseDialog {
  private static final Logger LOG = Logger.getLogger(BlameDialog.class);
  private static final String CAPTION = "Submit System Exception to Code Orchestra";

  private JPanel myPanel;
  private JTextArea myDescription;
  private JTextArea myException;
  private JTextField myUsername;
  private JPasswordField myPassword;
  private JPanel myLoginPanel;
  private JButton myTestLoginButton;
  private JRadioButton myRegisteredRadio;
  private JRadioButton myAnonymousRadio;
  private JTextField myTitleField;
  private JLabel myExceptionLabel;
  private JScrollPane myExceptionScrollPane;

  private boolean myIsCancelled = true;
  private Response myResult;
  private Project myProject;

  private List<Throwable> myEx = new ArrayList<Throwable>();

  @CodeOrchestraPatch
  private IssueType issueType = IssueType.EXCEPTION;

  public BlameDialog(Project project, Dialog dialog) {
    super(dialog, CAPTION);
    myProject = project;
    init();
  }

  public BlameDialog(Project project, Frame mainFrame) {
    super(mainFrame, CAPTION);
    myProject = project;
    init();
  }

  public void addEx(Throwable ex) {
    myEx.add(ex);
    String text = myException.getText();
    if (text != null && text.length() > 0) {
      myException.setText(text + "\n\n" + ex2str(ex));
    } else {
      myException.setText(ex2str(ex));
    }
  }

  public void setIssueTitle(String message) {
    myTitleField.setText(message);
  }

  public void setDescription(String message) {
    myDescription.setText(message);
  }

  @CodeOrchestraPatch
  public void setIssueType(IssueType issueType) {
    this.issueType = issueType;

    // RE-3125
    myException.setVisible(issueType == IssueType.EXCEPTION);
    myExceptionLabel.setVisible(issueType == IssueType.EXCEPTION);
    myExceptionScrollPane.setVisible(issueType == IssueType.EXCEPTION);
  }

  private void init() {
    setModal(true);

    myAnonymousRadio.addChangeListener(new ChangeListener() {
      public void stateChanged(ChangeEvent e) {
        boolean enabled = !myAnonymousRadio.getModel().isSelected();
        myUsername.setEnabled(enabled);
        myPassword.setEnabled(enabled);
        myTestLoginButton.setEnabled(enabled);
      }
    });

    myTestLoginButton.setAction(new AbstractAction("Test Login") {
      public void actionPerformed(ActionEvent e) {
        Poster poster = new Poster(myProject);
        Query query = createQuery();

        Response response = poster.test(query);
        if (response.isSuccess()) {
          Messages.showMessageDialog(myProject, response.getMessage(), "Test Login", Messages.getInformationIcon());
        } else {
          Messages.showErrorDialog(myProject, response.getMessage(), "Test Login Failed");
          LOG.warning("Submit failed: " + response.getMessage() + ":" + response.getResponseString(), response.getThrowable());
        }
      }
    });
  }

  private Query createQuery() {
    return myAnonymousRadio.isSelected() ? Query.ANONYMOUS : new Query(myUsername.getText(), myPassword.getText());
  }

  private String ex2str(Throwable e) {
    if (e == null) {
      return "";
    }

    StringWriter sw = new StringWriter();
    PrintWriter pw = new PrintWriter(sw);
    e.printStackTrace(pw);

    return (e.getMessage() == null ? "" : e.getMessage() + "\n") + sw.toString();
  }

  private String getBuildString() {
    String build = ApplicationInfo.getInstance().getBuild().asString();
    return "[build:" + build + "] ";
  }

  private String getAdditionalInfo() {
    ApplicationInfo ai = ApplicationInfo.getInstance();
    return "[Build info]\n" +
      "build number: " + ai.getBuild().asString() + "\n" +
      "version name: " + ai.getVersionName() + "\n" +
      "build date: " + ai.getBuildDate().getTime().toString() + "\n" +
      getRevisionNumber();
  }

  private String getRevisionNumber() {
    IFile file = FileSystem.getInstance().getFileByPath(PathManager.getHomePath());
    if (file == null) return "";
    VcsRevisionNumber revisionNumber = VcsMigrationUtil.getHandler().getRevisionNumber(file);
    if (revisionNumber == null) {
      return "";
    }
    return "revision number: " + revisionNumber.asString() + "\n";
  }

  public DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensions(200, 200, 400, 300);
  }

  protected JComponent getMainComponent() {
    return myPanel;
  }

  public boolean isCancelled() {
    return myIsCancelled;
  }

  @NotNull
  public Response getResult() {
    return myResult;
  }

  @CodeOrchestraPatch
  @Button(position = 0, name = "Send", mnemonic = 'S')
  public void onSend() {
    String title = getBuildString() + myTitleField.getText();

    StringBuilder description = new StringBuilder(1000);
    if (myTitleField.getText().trim().length() != 0) {
      description.append(myTitleField.getText());
      description.append("\n\n");
    }

    description.append(myDescription.getText());
    if (description.length() != 0) {
      description.append("\n\n");
    }

    description.append(getAdditionalInfo());
    description.append("\n\n\n");

    for (Throwable ex : myEx) {
      description.append(ex2str(ex)).append("\n\n");
    }

    Poster poster = new Poster(myProject);
    Query query = createQuery();
    query.setIssue(title);
    query.setIssueType(issueType); // RE-3125
    query.setDescription(description.toString());
    myResult = poster.send(query);

    if (!myResult.isSuccess()) {
      String message = "Was unable to post the issue: \n" + myResult.getMessage();
      String response = myResult.getResponseString();
      if (response != null && !response.equals("")) {
        message += "\n" + response;
      }
      JOptionPane.showMessageDialog(BlameDialog.this, message, "Error", JOptionPane.ERROR_MESSAGE);
      return;
    }

    openIssueInBrowser();

    myIsCancelled = false;
    BlameDialogComponent.getInstance().loadState(getState());
    dispose();
  }

  private void openIssueInBrowser() {
    final String ID = "id";
    SAXBuilder saxBuilder = new SAXBuilder();
    Document document = null;
    try {
      document = saxBuilder.build(new StringReader(myResult.getResponseString()));
    } catch (Exception e) {
      LOG.error("Can't open created issue", e);
      return;
    }
    Element responseXML = document.getRootElement();
    String issueId = responseXML.getAttribute(ID).getValue();

    BrowserUtil.launchBrowser(Command.ISSUE_URL + issueId);
  }

  @Button(position = 1, name = "Cancel", mnemonic = 'C')
  public void onCancel() {
    myResult = null;
    myIsCancelled = true;
    dispose();
  }

  public MyState getState() {
    return new MyState(myAnonymousRadio.isSelected(), myUsername.getText(), myPassword.getText());
  }

  public void loadState(MyState state) {
    if (state == null) return;
    if (state.isAnonymous()) {
      myAnonymousRadio.setSelected(true);
    } else {
      myRegisteredRadio.setSelected(true);
    }

    myUsername.setText(state.getUsername());
    myPassword.setText(state.getPassword());
  }

  {
// GUI initializer generated by IntelliJ IDEA GUI Designer
// >>> IMPORTANT!! <<<
// DO NOT EDIT OR ADD ANY CODE HERE!
    $$$setupUI$$$();
  }

  /**
   * Method generated by IntelliJ IDEA GUI Designer
   * >>> IMPORTANT!! <<<
   * DO NOT edit this method OR call it in your code!
   *
   * @noinspection ALL
   */
  private void $$$setupUI$$$() {
    myPanel = new JPanel();
    myPanel.setLayout(new GridLayoutManager(2, 1, new Insets(0, 0, 0, 0), -1, -1));
    final JPanel panel1 = new JPanel();
    panel1.setLayout(new GridLayoutManager(3, 2, new Insets(0, 0, 0, 0), -1, -1));
    myPanel.add(panel1, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    panel1.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Bugtracker login settings", TitledBorder.LEFT, TitledBorder.DEFAULT_POSITION));
    final Spacer spacer1 = new Spacer();
    panel1.add(spacer1, new GridConstraints(1, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, 1, null, null, null, 0, false));
    myLoginPanel = new JPanel();
    myLoginPanel.setLayout(new GridLayoutManager(3, 3, new Insets(0, 5, 0, 0), -1, -1));
    panel1.add(myLoginPanel, new GridConstraints(2, 0, 1, 2, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    final JLabel label1 = new JLabel();
    label1.setText("Username:");
    myLoginPanel.add(label1, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    myUsername = new JTextField();
    myUsername.setEnabled(false);
    myLoginPanel.add(myUsername, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(150, -1), null, 0, false));
    final JLabel label2 = new JLabel();
    label2.setText("Password:");
    myLoginPanel.add(label2, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    myPassword = new JPasswordField();
    myPassword.setEnabled(false);
    myLoginPanel.add(myPassword, new GridConstraints(1, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(150, -1), null, 0, false));
    myTestLoginButton = new JButton();
    myTestLoginButton.setEnabled(false);
    myTestLoginButton.setText("Test Login");
    myLoginPanel.add(myTestLoginButton, new GridConstraints(2, 2, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    myRegisteredRadio = new JRadioButton();
    myRegisteredRadio.setText("Registered user");
    panel1.add(myRegisteredRadio, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    myAnonymousRadio = new JRadioButton();
    myAnonymousRadio.setSelected(true);
    myAnonymousRadio.setText("Anonymous");
    panel1.add(myAnonymousRadio, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final Spacer spacer2 = new Spacer();
    panel1.add(spacer2, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, 1, null, null, null, 0, false));
    final JPanel panel2 = new JPanel();
    panel2.setLayout(new GridLayoutManager(6, 2, new Insets(0, 0, 0, 0), -1, -1));
    myPanel.add(panel2, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_WANT_GROW, null, null, null, 0, false));
    panel2.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Issue properties"));
    final JLabel label3 = new JLabel();
    label3.setText("Description:");
    panel2.add(label3, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final Spacer spacer3 = new Spacer();
    panel2.add(spacer3, new GridConstraints(2, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, 1, null, null, null, 0, false));
    final JScrollPane scrollPane1 = new JScrollPane();
    panel2.add(scrollPane1, new GridConstraints(3, 0, 1, 2, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_WANT_GROW, null, new Dimension(0, 37), null, 0, false));
    myDescription = new JTextArea();
    myDescription.setEditable(true);
    myDescription.setText("");
    scrollPane1.setViewportView(myDescription);
    myExceptionScrollPane = new JScrollPane();
    panel2.add(myExceptionScrollPane, new GridConstraints(5, 0, 1, 2, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_WANT_GROW, null, new Dimension(0, 220), null, 0, false));
    myException = new JTextArea();
    myException.setEditable(false);
    myExceptionScrollPane.setViewportView(myException);
    myTitleField = new JTextField();
    panel2.add(myTitleField, new GridConstraints(1, 0, 1, 2, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(150, -1), null, 0, false));
    final JLabel label4 = new JLabel();
    label4.setText("Title:");
    panel2.add(label4, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final Spacer spacer4 = new Spacer();
    panel2.add(spacer4, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, 1, null, null, null, 0, false));
    myExceptionLabel = new JLabel();
    myExceptionLabel.setText("Exception:");
    panel2.add(myExceptionLabel, new GridConstraints(4, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final Spacer spacer5 = new Spacer();
    panel2.add(spacer5, new GridConstraints(4, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, 1, null, null, null, 0, false));
    ButtonGroup buttonGroup;
    buttonGroup = new ButtonGroup();
    buttonGroup.add(myRegisteredRadio);
    buttonGroup.add(myAnonymousRadio);
  }

  /**
   * @noinspection ALL
   */
  public JComponent $$$getRootComponent$$$() {
    return myPanel;
  }

  public static class MyState {
    private boolean myAnonymous;
    private String myUsername;
    private String myPassword;


    public MyState() {
    }

    public MyState(boolean anonymous, String username, String password) {
      myAnonymous = anonymous;
      myUsername = username;
      myPassword = password;
    }

    public boolean isAnonymous() {
      return myAnonymous;
    }

    public void setAnonymous(boolean anonymous) {
      myAnonymous = anonymous;
    }

    public String getUsername() {
      return myUsername;
    }

    public void setUsername(String username) {
      myUsername = username;
    }

    public String getPassword() {
      return myPassword;
    }

    public void setPassword(String password) {
      myPassword = password;
    }
  }
}
