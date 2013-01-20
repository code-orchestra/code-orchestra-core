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
package jetbrains.mps.ide.messages;

import com.intellij.ide.BrowserUtil;
import com.intellij.ide.SaveAndSyncHandler;
import com.intellij.openapi.actionSystem.*;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.vfs.VirtualFileManager;
import com.intellij.openapi.wm.ToolWindowAnchor;
import com.intellij.openapi.wm.WindowManager;
import com.intellij.ui.content.*;
import codeOrchestra.actionscript.logging.model.MessageScope;
import codeOrchestra.actionscript.logging.scope.FilterByScopeComponent;
import codeOrchestra.actionscript.logging.scope.MessageScopeRegistry;
import codeOrchestra.actionscript.logging.scope.MessagesComponentHolder;
import codeOrchestra.actionscript.view.utils.ActionInvokeUtil;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import codeOrchestra.logging.SNodeWithStackTrace;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.ide.IdeMain.TestMode;
import jetbrains.mps.ide.MessageViewLoggingHandler;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.ide.blame.dialog.BlameDialog;
import jetbrains.mps.ide.blame.dialog.BlameDialogComponent;
import jetbrains.mps.ide.blame.perform.Response;
import jetbrains.mps.ide.datatransfer.CopyPasteUtil;
import jetbrains.mps.ide.findusages.INavigateableTool;
import jetbrains.mps.ide.findusages.INavigator;
import jetbrains.mps.ide.findusages.UsagesViewTracker;
import jetbrains.mps.ide.messages.MessagesViewTool.MyState;
import jetbrains.mps.ide.projectPane.IProjectPane;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.messages.IMessage;
import jetbrains.mps.messages.Message;
import jetbrains.mps.messages.MessageKind;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.ActionPlace;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.action.BaseAction;
import jetbrains.mps.workbench.tools.BaseProjectTool;
import org.apache.commons.lang.ObjectUtils;

import javax.swing.*;
import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.Cursor;
import java.awt.Toolkit;
import java.awt.datatransfer.StringSelection;
import java.awt.event.*;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;

@State(
  name = "MessagesViewTool",
  storages = {
    @Storage(
      id = "other",
      file = "$WORKSPACE_FILE$"
    )
  }
)
public class MessagesViewTool extends BaseProjectTool implements PersistentStateComponent<MyState>, INavigateableTool, MessageView {
  public static final Logger LOG = Logger.getLogger(MessagesViewTool.class);
  private static final int MAX_MESSAGES_SIZE = 30000;
  private static final int MAX_TABS_COUNT = 10;

  private MyToggleAction myWarningsAction = new MyToggleAction("Show Warnings Messages", jetbrains.mps.ide.messages.Icons.WARNING_ICON) {
    protected boolean isEnabled() {
      return hasWarnings();
    }
  };
  private MyToggleAction myInfoAction = new MyToggleAction("Show Information Messages", jetbrains.mps.ide.messages.Icons.INFORMATION_ICON) {
    protected boolean isEnabled() {
      return hasInfo();
    }
  };
  private MyToggleAction myAutoscrollToSourceAction = new MyToggleAction("Autoscroll To Source", jetbrains.mps.ide.messages.Icons.AUTOSCROLLS_ICON) {
    protected boolean isEnabled() {
      return hasHintObjects();
    }
  };
  private MyToggleAction showSourceAction = new MyToggleAction("Show Message Source", jetbrains.mps.ide.messages.Icons.SOURCE_ICON) {
    protected boolean isEnabled() {
      return true;
    }
  };

  // CodeOrchestra Message filtering fields BEGIN
  private boolean contentListenerAdded;
  private FilterByScopeComponent filterByScopeComponent;
  private MessagesComponentHolder myMessagesComponentHolder;
  private Map<String, FilterByScopeComponent> scopeFiltersMap = new HashMap<String, FilterByScopeComponent>();
  private static final String MAIN_SCOPE_ID = "0";
  private ContentManagerAdapter tabChangeListener;
  //private Object filterMonitor = new Object();
  // CodeOrchestra Message filtering fields END

  private Queue<IMessage> myMessages = new LinkedList<IMessage>();
  private int myInfos;
  private int myWarnings;
  private int myErrors;
  private int myHintObjects;

  private FastListModel myModel = new FastListModel(MAX_MESSAGES_SIZE);
  private JPanel myComponent = new JPanel();
  private JList myList = new JList(myModel);
  private MessageViewLoggingHandler myLoggingHandler;
  private ActionToolbar myToolbar;
  private AtomicInteger myMessagesInProgress = new AtomicInteger();
  private MessageToolSearchPanel mySearchPanel;
  private MessagesListCellRenderer myMessagesListCellRenderer = new MessagesListCellRenderer();

  public MessagesViewTool(Project project) {
    super(project, "Messages", 0, Icons.MESSAGE_VIEW_ICON, ToolWindowAnchor.BOTTOM, true);
  }

  public IMessage getFirstErrorMessageWithHintObject() {
    for (IMessage message : myMessages) {
      if (message.getKind() == MessageKind.ERROR && message.getHintObject() != null) {
        return message;
      }
    }
    return null;
  }

  public void initComponent() {
    super.initComponent();
    myList.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
    myList.setCellRenderer(myMessagesListCellRenderer);
    myComponent.setLayout(new BorderLayout());

    final JPanel panel = new JPanel(new BorderLayout());
    panel.add(new JPanel(), BorderLayout.CENTER);

    final DefaultActionGroup group = ActionUtils.groupFromActions(
      myWarningsAction,
      myInfoAction,
      myAutoscrollToSourceAction,
      showSourceAction
    );

    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        myToolbar = ActionManager.getInstance().createActionToolbar(ActionPlaces.UNKNOWN, group, false);
        panel.add(myToolbar.getComponent(), BorderLayout.NORTH);
      }
    });

    myComponent.add(panel, BorderLayout.WEST);
    final JScrollPane scrollPane = new JScrollPane(myList);
    myComponent.add(scrollPane, BorderLayout.CENTER);

    myComponent.registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        if (mySearchPanel == null) {
          mySearchPanel = new MessageToolSearchPanel(myList, getProject());
          myComponent.add(mySearchPanel, BorderLayout.NORTH);
        }

        mySearchPanel.activate();
      }
    }, KeyStroke.getKeyStroke("ctrl F"), JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);


    myList.setFixedCellHeight(Toolkit.getDefaultToolkit().getFontMetrics(myList.getFont()).getHeight() + 5);

//    ToolTipManager.sharedInstance().registerComponent(myList);

    myList.registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        openCurrentMessageNodeIfPossible();
      }
    }, KeyStroke.getKeyStroke("F4"), JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);

    myList.registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        openCurrentMessageNodeIfPossible();
      }
    }, KeyStroke.getKeyStroke("ENTER"), JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);

    myList.registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        showHelpForCurrentMessage();
      }
    }, KeyStroke.getKeyStroke("F1"), JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);

    myList.addMouseWheelListener(new MouseWheelListener() {
      public void mouseWheelMoved(MouseWheelEvent e) {
        myList.setAutoscrolls(false);
        scrollPane.dispatchEvent(e);
      }
    });

    myList.addMouseListener(new MouseAdapter() {
      public void mouseClicked(MouseEvent e) {
        boolean oneClickOpen = e.getClickCount() == 1 && e.getButton() == MouseEvent.BUTTON1 && myAutoscrollToSourceAction.isSelected(null);
        boolean twoClickOpen = e.getClickCount() == 2 && e.getButton() == MouseEvent.BUTTON1;
        if (oneClickOpen || twoClickOpen) {
          openCurrentMessageNodeIfPossible();
        }
      }

      public void mousePressed(MouseEvent e) {
        //todo select element under mouse
        if (e.isPopupTrigger()) {
          showPopupMenu(e);
        }
      }

      public void mouseReleased(MouseEvent e) {
        if (e.isPopupTrigger()) {
          showPopupMenu(e);
        }
      }
    });

    myList.addMouseMotionListener(new MouseMotionListener() {
      public void mouseDragged(MouseEvent e) {
      }

      public void mouseMoved(MouseEvent e) {
        int index = myList.locationToIndex(e.getPoint());

        Message item = null;
        if (index != -1) {
          item = (Message) myModel.getElementAt(index);
        }

        if (item != null && item.canNavigate() && myAutoscrollToSourceAction.isSelected(null)) {
          myList.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        } else {
          myList.setCursor(Cursor.getPredefinedCursor(Cursor.DEFAULT_CURSOR));
        }
      }
    });
  }

  protected boolean isInitiallyAvailable() {
    return true;
  }

  public void projectOpened() {
    super.projectOpened();
    myLoggingHandler = new MessageViewLoggingHandler(this);
    Logger.addLoggingHandler(myLoggingHandler);
  }

  public void projectClosed() {
    Logger.removeLoggingHandler(myLoggingHandler);
    super.projectClosed();
  }

  //------------TOOL STUFF---------------

  public void openToolLater(boolean setActive) {
    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        if (myModel.getSize() > 0) {
          myList.setSelectedValue(myModel.getElementAt(myModel.getSize() - 1), true);
        }
      }
    });
    super.openToolLater(setActive);
  }

  public JComponent getComponent() {
    if (myMessagesComponentHolder == null) {
      myMessagesComponentHolder = new MessagesComponentHolder(myComponent);
      myMessagesComponentHolder.setName(MyToggleAction.DEFAULT_TAB_NAME);
    }
    return myMessagesComponentHolder;
  }

  //------------MESSAGES STUFF---------------

  public boolean hasErrors() {
    return myErrors > 0;
  }

  public boolean hasWarnings() {
    return myWarnings > 0;
  }

  public boolean hasInfo() {
    return myInfos > 0;
  }

  public boolean hasHintObjects() {
    return myHintObjects > 0;
  }

  private void showHelpForCurrentMessage() {
    String helpURL = getHelpUrlForCurrentMessage();
    if (helpURL == null) return;
    BrowserUtil.launchBrowser(helpURL);
  }

  private String getHelpUrlForCurrentMessage() {
    if (myList.getSelectedValues().length != 1) return null;

    Message message = (Message) (myList.getSelectedValue());
    return message.getHelpUrl();
  }

  private void showPopupMenu(MouseEvent evt) {
    if (myList.getSelectedValue() == null) return;

    DefaultActionGroup group = createActionGroup();

    JPopupMenu menu = ActionManager.getInstance().createActionPopupMenu(ActionPlaces.UNKNOWN, group).getComponent();
    menu.show(myList, evt.getX(), evt.getY());
  }

  @CodeOrchestraPatch
  private DefaultActionGroup createActionGroup() {
    DefaultActionGroup group = new DefaultActionGroup();

    if (myList.getSelectedIndices().length != 0) {
      group.add(new BaseAction("Copy Text") {
        {
          setExecuteOutsideCommand(true);
        }

        protected boolean isEnabledInASView() {
          return true;
        }

        protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
          StringBuilder sb = new StringBuilder();
          for (Object o : myList.getSelectedValues()) {
            sb.append(((Message) o).getText());
            sb.append("\n");
          }
          Toolkit.getDefaultToolkit().getSystemClipboard().setContents(new StringSelection(sb.toString()), null);
        }
      });
    }

    // CO-4858
    if (myList.getSelectedIndices().length != 0) {
      group.add(new BaseAction("Copy All Output Text") {
        {
          setExecuteOutsideCommand(true);
        }

        protected boolean isEnabledInASView() {
          return true;
        }

        protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
          StringBuilder sb = new StringBuilder();

          for (int i = 0; i < myList.getModel().getSize(); i++) {
            Object o = myList.getModel().getElementAt(i);
            sb.append(((Message) o).getText());
            sb.append("\n");
          }

          Toolkit.getDefaultToolkit().getSystemClipboard().setContents(new StringSelection(sb.toString()), null);
        }
      });
    }

    group.addSeparator();

    group.add(new BaseAction("Show Help for This Message") {
      protected boolean isEnabledInASView() {
        return true;
      }

      @Override
      protected void doUpdate(AnActionEvent e, Map<String, Object> _params) {
        boolean enabled = getHelpUrlForCurrentMessage() != null;
        setEnabledState(e.getPresentation(), enabled);
      }

      @Override
      protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
        showHelpForCurrentMessage();
      }
    });

    group.addSeparator();

    // CO-4704
    if (myList.getSelectedIndices().length == 1) {
      final Object[] messages = myList.getSelectedValues();
      Message message = (Message) messages[0];

      if (message.getHintObject() instanceof SNodeWithStackTrace) {
        final SNodeWithStackTrace sNodeWithStackTrace = (SNodeWithStackTrace) message.getHintObject();
        group.add(new BaseAction("Copy Stacktrace") {
          @Override
          protected boolean isEnabledInASView() {
            return true;
          }

          @Override
          protected void doExecute(AnActionEvent e, Map<String, Object> params) {
            CopyPasteUtil.copyTextToClipboard(sNodeWithStackTrace.getStackTrace());
          }
        });

        group.add(new BaseAction("Analyze Stacktrace...") {
          @Override
          protected boolean isEnabledInASView() {
            return true;
          }

          {
            setExecuteOutsideCommand(true);
          }

          @Override
          protected void doExecute(final AnActionEvent e, Map<String, Object> params) {
            CopyPasteUtil.copyTextToClipboard(sNodeWithStackTrace.getStackTrace());

            final Map<String, Object> paramsMap = new HashMap<String, Object>() {{
              put(MPSDataKeys.FRAME.getName(), e.getData(MPSDataKeys.FRAME));
              put(MPSDataKeys.OPERATION_CONTEXT.getName(), e.getData(MPSDataKeys.OPERATION_CONTEXT));
              put(MPSDataKeys.PROJECT.getName(), e.getData(MPSDataKeys.PROJECT));
            }};
            ActionInvokeUtil.invoke(ActionPlace.PROJECT_PANE, "codeOrchestra.actionScript.core.plugin.ASAnalyzeStacktrace_Action", paramsMap, false);
          }
        });
      }

      group.addSeparator();
    }

    if (myList.getSelectedIndices().length >= 1) {
      final Object[] messages = myList.getSelectedValues();
      boolean containsError = false;
      // CO-5089
      boolean hasMarkerMessages = false;
      for (Object message : messages) {
        if (((Message) message).getViewMarker() != null) {
          hasMarkerMessages = true;
          break;
        }
      }
      for (Object message : messages) {
        if (((Message) message).getKind() == MessageKind.ERROR) {
          containsError = true;
          break;
        }
      }
      // CO-5089
      if (containsError && !hasMarkerMessages) {
        group.addSeparator();
        group.add(new BaseAction(messages.length > 1 ? "Submit as One Issue" : "Submit to Issue Tracker") {
          protected boolean isEnabledInASView() {
            return true;
          }

          {
            setExecuteOutsideCommand(true);
          }

          protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
            submitToTracker(messages);
          }
        });
      }
    }
    group.addSeparator();

    group.add(new BaseAction("Clear") {
      {
        setExecuteOutsideCommand(true);
      }

      protected boolean isEnabledInASView() {
        return true;
      }

      protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
        clear();
      }
    });

    return group;
  }

  private void submitToTracker(Object[] msgs) {
    JFrame frame = WindowManager.getInstance().getFrame(getProject());
    BlameDialog dialog = BlameDialogComponent.getInstance().createDialog(getProject(), frame);
    StringBuilder description = new StringBuilder();
    boolean first = true;
    for (Object msg : msgs) {
      if (!(msg instanceof Message)) continue;
      Message message = (Message) msg;
      if (first) {
        dialog.setIssueTitle(message.getText());
        first = false;
      } else {
        description.append(message.getText()).append('\n');
      }
      dialog.addEx(message.getException());
    }
    dialog.setDescription(description.toString());
    dialog.showDialog();

    if (!dialog.isCancelled()) {
      Response response = dialog.getResult();
      String message = response.getMessage();
      if (response.isSuccess()) {
        JOptionPane.showMessageDialog(null, message, "Submit OK", JOptionPane.INFORMATION_MESSAGE);
      } else {
        JOptionPane.showMessageDialog(null, message, "Submit Failed", JOptionPane.ERROR_MESSAGE);
        LOG.error("Submit failed: " + response.getMessage(), response.getThrowable());
      }
    }
  }

  private void openCurrentMessageNodeIfPossible() {
    final Message selectedMessage = (Message) myList.getSelectedValue();
    if (selectedMessage == null || !selectedMessage.canNavigate()) return;

    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        NavigationManager.getInstance().navigateTo(getProject(), selectedMessage.getHintObject(), true, true);
      }
    });

    // RE-1661
    SaveAndSyncHandler.refreshOpenFiles();
  }

  private boolean isVisible(IMessage m, String viewMarker) {
    // Filter by view
    if (viewMarker != null) {
      if (!viewMarker.equals(m.getViewMarker())) {
        return false;
      }
    }

    // Filter by scope
    if (filterByScopeComponent != null) {
      if (!filterByScopeComponent.showMessage(m)) {
        return false;
      }
    }

    switch (m.getKind()) {
      case ERROR:
        return true;
      case WARNING:
        return myWarningsAction.isSelected(null);
      case INFORMATION:
        return myInfoAction.isSelected(null);
    }
    return true;
  }

  private String getMessageMarker() {
    IProjectPane projectPane = ViewUtils.getCurrentPane(getProject());
    if (projectPane != null) {
      return projectPane.getMessageMarker();
    }
    return null;
  }

  public void rebuildModel() {
    rebuildModel(getMessageMarker());
  }

  public void rebuildModel(String marker) {
    myModel.clear();
    myList.setFixedCellWidth(myList.getWidth());

    if (myMessagesListCellRenderer != null) {
      myMessagesListCellRenderer.setShowSource(showSourceAction.isSelected(null));
    }

    List<IMessage> messagesToAdd = new ArrayList<IMessage>();
    int width = 0;
    for (IMessage m : myMessages) {
      if (isVisible(m, marker)) {
        width = Math.max(width, getMessageWidth(m));
        messagesToAdd.add(m);
      }
    }
    myList.setFixedCellWidth(width);

    for (IMessage m : messagesToAdd) {
      myModel.add(m);
    }
  }

  public void clear() {
    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        myModel.clear();
        myMessages.clear();
        myErrors = 0;
        myWarnings = 0;
        myInfos = 0;
        myHintObjects = 0;
        myList.setFixedCellWidth(myList.getWidth());
        updateHeader();
        updateActions();
      }
    });
  }

  public void resetAutoscrollOption() {
    myList.setAutoscrolls(true);
  }

  public void add(final IMessage message) {
    if (IdeMain.getTestMode() == TestMode.CORE_TEST) {
      return;
    }

    // If a message has an unknown scopeId, create a new tab for it
    //synchronized (filterMonitor) {
      if (message.getScopeIds() != null) {
        for (final String scopeId : message.getScopeIds()) {
          if (scopeFiltersMap.get(scopeId) == null) {
            addScopeTab(scopeId, false);
          }
        }
      }
    //}

    myMessagesInProgress.incrementAndGet();

    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        int messages = myMessagesInProgress.decrementAndGet();

        if (myMessages.size() >= MAX_MESSAGES_SIZE) {
          IMessage toRemove = myMessages.remove();
          updateMessageCounters(message, -1);
          if (isVisible(toRemove, getMessageMarker())) {
            myModel.removeFirst();
          }
        }

        if (isVisible(message, getMessageMarker())) {
          myModel.add(message);
          int index = myModel.getSize() - 1;
          if (myList.getAutoscrolls()) {
            myList.getSelectionModel().setSelectionInterval(index, index);
          }
          if (messages == 0) {
            myList.ensureIndexIsVisible(index);
          }
        }

        myMessages.add(message);
        updateMessageCounters(message, 1);

        int width = getMessageWidth(message);
        if (width > myList.getFixedCellWidth()) {
          myList.setFixedCellWidth(width);
        }

        updateHeader();
        updateActions();
      }

      private void updateMessageCounters(IMessage m, int delta) {
        if (m.getKind() == MessageKind.ERROR) {
          myErrors += delta;
        }
        if (m.getKind() == MessageKind.WARNING) {
          myWarnings += delta;
        }
        if (m.getKind() == MessageKind.INFORMATION) {
          myInfos += delta;
        }
        if (m.canNavigate()) {
          myHintObjects += delta;
        }
      }
    });
  }

  public void selectScopeTab(String scopeId) {
    //synchronized (filterMonitor) {
      if (scopeFiltersMap.get(scopeId) != null) {
        FilterByScopeComponent scopeComponent = scopeFiltersMap.get(scopeId);
        final Content filterContent = scopeComponent.getContent();

        if (filterContent != null) {
          SwingUtilities.invokeLater(new Runnable() {
            public void run() {
              getContentManager().setSelectedContent(filterContent);
            }
          });
        }
      } else {
        addScopeTab(MessageScopeRegistry.MAIN_SCOPE_ID, true);
      }
    //}
  }

  public void reset() {
    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        //synchronized (filterMonitor) {
          ContentManager contentManager = getContentManager();

          // Remove the content listener
          if (tabChangeListener != null) {
            contentManager.removeContentManagerListener(tabChangeListener);
          }

          // Clear the tabs
          Content[] currentContent = contentManager.getContents();
          filterByScopeComponent = null;
          scopeFiltersMap.clear();
          for (int i = 0; i < currentContent.length; i++) {
            Content content = currentContent[i];
            assert content != null;

            final MessagesComponentHolder messagesComponentHolder = (MessagesComponentHolder) content.getComponent();
            if (messagesComponentHolder instanceof FilterByScopeComponent) {
              contentManager.removeContent(content, false);
            } else {
              messagesComponentHolder.setComponentSafe(myComponent);
              contentManager.setSelectedContent(content);
              rebuildModel();
            }
          }

          // Take the listener back
          if (tabChangeListener != null) {
            contentManager.addContentManagerListener(tabChangeListener);
          }
        }
      //}
    });
  }

  private void addScopeTab(final String scopeId, final boolean focus) {
    // Content listener
    if (!contentListenerAdded) {
      addFilterTabContentListener();
    }

    if (scopeFiltersMap.get(scopeId) != null) {
      return;
    }

    final MessageScope messageScope = MessageScopeRegistry.getInstance().getScope(scopeId);
    if (messageScope == null) {
      return;
    }

    final FilterByScopeComponent filterByScopeComponent = new FilterByScopeComponent(scopeId);
    filterByScopeComponent.setName(messageScope.getName());
    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        ContentManager contentManager = getContentManager();
        if (MAIN_SCOPE_ID.equals(scopeId) && contentManager.getContentCount() > 1) {
          List<MessagesComponentHolder> messagesHolders = new ArrayList<MessagesComponentHolder>();
          int positionToInsert = -1;

          // Remove the content listener
          contentManager.removeContentManagerListener(tabChangeListener);

          // Memorize content to delete later
          Content[] currentContent = contentManager.getContents().clone();

          // Create a fake content to prevent tool window from closing when all real content is deleted
          Content fakeContent = addContent(new JPanel(), "-", null, false);

          // Memorize components and clear the tabs
          for (int i = 0; i < currentContent.length; i++) {
            Content content = currentContent[i];
            assert content != null;

            MessagesComponentHolder messagesComponentHolder = (MessagesComponentHolder) content.getComponent();

            if (positionToInsert == -1) {
              if (messagesComponentHolder instanceof FilterByScopeComponent) {
                positionToInsert = i;
              }
            }

            messagesHolders.add(messagesComponentHolder);
            contentManager.removeContent(content, false);
          }

          // Sort tabs by time created
          Collections.sort(messagesHolders, new Comparator<MessagesComponentHolder>() {
            public int compare(MessagesComponentHolder o1, MessagesComponentHolder o2) {
              return Long.valueOf(o1.getCreationTime()).compareTo(Long.valueOf(o2.getCreationTime()));
            }
          });

          // Insert a new tab to the tabs collection
          if (positionToInsert == -1) {
            positionToInsert = 0;
          }
          messagesHolders.add(positionToInsert, filterByScopeComponent);

          // Recreate the tabs and memorize the main content to select later
          Content contentToSelect = null;
          for (int i = 0; i < messagesHolders.size(); i++) {
            MessagesComponentHolder mComponentHolder = messagesHolders.get(i);

            Content addedContent = addContent(mComponentHolder, mComponentHolder.getName(), null, false);
            mComponentHolder.setContent(addedContent);

            if (mComponentHolder instanceof FilterByScopeComponent) {
              if (MAIN_SCOPE_ID.equals(((FilterByScopeComponent) mComponentHolder).getFilterByScopeId())) {
                contentToSelect = addedContent;
              }
            }
          }

          // Remove fake content
          contentManager.removeContent(fakeContent, false);

          // Take the listener back
          contentManager.addContentManagerListener(tabChangeListener);

          // Select the main content
          if (contentToSelect != null) {
            contentManager.setSelectedContent(contentToSelect);
          }
        } else {
          Content addedContent = addContent(filterByScopeComponent, messageScope.getName(), null, false);
          filterByScopeComponent.setContent(addedContent);
          if (focus) {
            contentManager.setSelectedContent(addedContent);
          }
        }
      }
    });

    // Not more than 10 scopes
    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        if (getContentManager().getContentCount() == MAX_TABS_COUNT + 1) {
          Content contentToRemove = null;
          int i = 0;
          while (contentToRemove == null) {
            Content removeCandidateContent = getContentManager().getContent(i++);
            assert removeCandidateContent != null;
            JComponent removeCandidate = removeCandidateContent.getComponent();

            if (!(removeCandidate instanceof FilterByScopeComponent)) {
              continue;
            }

            if (((FilterByScopeComponent) removeCandidate).getFilterByScopeId().equals(MAIN_SCOPE_ID)) {
              continue;
            }

            contentToRemove = removeCandidateContent;
          }
          final Content checkedContentToRemove = contentToRemove;
          getContentManager().removeContent(checkedContentToRemove, false);
        }
      };
    });

    scopeFiltersMap.put(scopeId, filterByScopeComponent);
  }

  private void addFilterTabContentListener() {
    try {
      contentListenerAdded = true;
      Runnable addListenerRunnable = new Runnable() {
        public void run() {
          tabChangeListener = new ContentManagerAdapter() {
            @Override
            public void contentRemoved(ContentManagerEvent event) {
              //synchronized (filterMonitor) {
                if (event.getContent().getComponent() instanceof FilterByScopeComponent) {
                  String scopeId = ((FilterByScopeComponent) event.getContent().getComponent()).getFilterByScopeId();
                  scopeFiltersMap.remove(scopeId);
                }
              //}
            }

            @Override
            public void selectionChanged(ContentManagerEvent event) {
              if (event.getOperation() == ContentManagerEvent.ContentOperation.add) {
                if (event.getContent().getComponent() instanceof MessagesComponentHolder) {
                  MessagesComponentHolder messagesComponentHolder = (MessagesComponentHolder) event.getContent().getComponent();
                  messagesComponentHolder.setComponentSafe(myComponent);

                  if (messagesComponentHolder instanceof FilterByScopeComponent) {
                    filterByScopeComponent = (FilterByScopeComponent) messagesComponentHolder;
                  } else {
                    filterByScopeComponent = null;
                  }

                  rebuildModel();
                }
              }
            }
          };
          getContentManager().addContentManagerListener(tabChangeListener);
        }
      };

      if (SwingUtilities.isEventDispatchThread()) {
        addListenerRunnable.run();
      } else {
        SwingUtilities.invokeAndWait(addListenerRunnable);
      }
    } catch (Throwable t) {
      contentListenerAdded = false;
      throw new RuntimeException("Error while initializing a message content listener", t);
    }
  }

  private void updateHeader() {
    if (getToolWindow() == null) return;
    if (getContentManager() == null) return;
    Content content = getContentManager().getSelectedContent();
    if (content == null) return;
    if (!ObjectUtils.equals(content.getComponent(), myComponent)) return;
    if (hasErrors() || hasWarnings() || hasInfo()) {
      getToolWindow().setTitle(NameUtil.formatNumericalString(myErrors, "error") + "/"
        + NameUtil.formatNumericalString(myWarnings, "warning") + "/"
        + NameUtil.formatNumericalString(myInfos, "info"));
    } else {
      getToolWindow().setTitle("");
    }
  }

  private void updateActions() {
    myToolbar.updateActionsImmediately();
  }

  private int getMessageWidth(IMessage message) {
    Component renderer = myList.getCellRenderer().getListCellRendererComponent(myList, message, 0, false, false);
    int width = renderer.getPreferredSize().width;
    return width;
  }

  public MyState getState() {
    return new MyState(myWarningsAction.isSelected(null), myInfoAction.isSelected(null), myAutoscrollToSourceAction.isSelected(null), showSourceAction.isSelected(null));
  }

  public void loadState(MyState state) {
    myWarningsAction.setSelected(null, state.isWarnings());
    myInfoAction.setSelected(null, state.isInfo());
    myAutoscrollToSourceAction.setSelected(null, state.isAutoscrollToSource());
    showSourceAction.setSelected(null, state.isShowSource());
  }

  protected void doRegister() {
    UsagesViewTracker.register(this);
  }

  protected void doUnregister() {
    UsagesViewTracker.unregister(this);
  }

  public int getPriority() {
    return 1;
  }

  public INavigator getCurrentNavigateableView() {
    return new INavigator() {
      public void goToNext() {
        int i = Math.max(0, myList.getSelectedIndex() + 1);

        for (; i < myModel.getSize(); i++) {
          if (tryNavigate(i)) return;
        }
      }

      public void goToPrevious() {
        int i = Math.min(myModel.getSize() - 1, myList.getSelectedIndex() - 1);

        for (; i >= 0; i--) {
          if (tryNavigate(i)) return;
        }
      }

      public boolean tryNavigate(int index) {
        Message msg = ((Message) myModel.getElementAt(index));
        if (!msg.canNavigate()) return false;
        myList.setSelectedIndex(index);
        myList.ensureIndexIsVisible(index);
        openCurrentMessageNodeIfPossible();
        return true;
      }
    };
  }

  @Override
  public ContentManager getContentManager() {
    return super.getContentManager();
  }

  @Override
  public void runWhenInitialized(Runnable runnable) {
    runnable.run();
  }

  public void deleteScopedMessages() {
    final Iterator<IMessage> messageIterator = myMessages.iterator();
    while (messageIterator.hasNext()) {
      final IMessage message = messageIterator.next();
      if (message.getScopeIds() != null && !message.getScopeIds().isEmpty()) {
        messageIterator.remove();
      }
    }
  }

  public static class MyState {
    private boolean myWarnings;
    private boolean myInfo;
    private boolean myAutoscrollToSource;
    private boolean myShowSource;

    public MyState() {
    }

    public MyState(boolean warnings, boolean info, boolean autoscrollToSource, boolean showSource) {
      myWarnings = warnings;
      myInfo = info;
      myAutoscrollToSource = autoscrollToSource;
      this.myShowSource = showSource;
    }

    public boolean isShowSource() {
      return myShowSource;
    }

    public void setShowSource(boolean showSource) {
      this.myShowSource = showSource;
    }

    public boolean isWarnings() {
      return myWarnings;
    }

    public void setWarnings(boolean warnings) {
      myWarnings = warnings;
    }

    public boolean isInfo() {
      return myInfo;
    }

    public void setInfo(boolean info) {
      myInfo = info;
    }

    public boolean isAutoscrollToSource() {
      return myAutoscrollToSource;
    }

    public void setAutoscrollToSource(boolean autoscrollToSource) {
      myAutoscrollToSource = autoscrollToSource;
    }
  }

  private class MyToggleAction extends ToggleAction {
    private boolean mySelected;
    private Icon myIcon;
    private static final String DEFAULT_TAB_NAME = "";

    public MyToggleAction(String tooltip, Icon icon) {
      super("", tooltip, icon);
      myIcon = icon;
      mySelected = true;
    }

    public boolean isSelected(AnActionEvent e) {
      return mySelected;
    }

    public void setSelected(AnActionEvent e, boolean state) {
      mySelected = state;
      rebuildModel();
    }

    public void update(AnActionEvent e) {
      super.update(e);

      boolean enabled = isEnabled();
      Icon icon = enabled ? myIcon : UIManager.getLookAndFeel().getDisabledIcon(null, myIcon);
      if (icon == null) {
        icon = myIcon;
      }
      e.getPresentation().setIcon(icon);
    }

    protected boolean isEnabled() {
      return true;
    }
  }

  static class FastListModel extends AbstractListModel {
    private int myStart;
    private int myEnd;
    private int mySize;
    private Object[] myItems;

    FastListModel(int size) {
      myItems = new Object[size];
      myStart = 0;
      myEnd = 0;
    }

    public int getSize() {
      return mySize;
    }

    public Object getElementAt(int index) {
      return myItems[(myStart + index) % myItems.length];
    }

    public void add(Object item) {
      if (mySize == myItems.length) throw new RuntimeException("Buffer overflow");
      myItems[myEnd] = item;
      myEnd = (myEnd + 1) % myItems.length;
      mySize++;
      fireIntervalAdded(this, mySize - 1, mySize - 1);
    }

    public void removeFirst() {
      if (mySize == 0) {
        throw new RuntimeException("Buffer underflow");
      }
      myItems[myStart] = null;
      myStart = (myStart + 1) % myItems.length;
      mySize--;
      fireIntervalRemoved(this, 0, 0);
    }

    public void clear() {
      myStart = 0;
      myEnd = 0;
      int oldSize = mySize;
      mySize = 0;
      Arrays.fill(myItems, null);
      if (oldSize > 0) {
        fireIntervalRemoved(this, 0, oldSize - 1);
      }
    }
  }
}
