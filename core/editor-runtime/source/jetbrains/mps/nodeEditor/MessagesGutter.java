/*
 * Copyright 2003-2011 JetBrains s.r.o.
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
package jetbrains.mps.nodeEditor;

import jetbrains.mps.errors.MessageStatus;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.ide.tooltips.MPSToolTipManager;
import jetbrains.mps.ide.tooltips.TooltipComponent;
import jetbrains.mps.nodeEditor.EditorComponent.MyScrollBar;
import jetbrains.mps.nodeEditor.icons.Icons;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;
import java.util.*;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

public class MessagesGutter extends JPanel {
  private EditorComponent myEditorComponent;
  private JLabel myErrosLabel = new JLabel(Icons.OK);
  private List<EditorMessage> myMessages = new CopyOnWriteArrayList<EditorMessage>();
  private Map<EditorMessage, EditorMessageOwner> myOwners = new HashMap<EditorMessage, EditorMessageOwner>();
  private boolean myStatusIsDirty = false;
  private Set<EditorMessage> myMessagesToRemove = new HashSet<EditorMessage>();
  private MyMessagesGutter myMessagesGutter;

  public MessagesGutter(EditorComponent editorComponent) {
    myEditorComponent = editorComponent;

    setLayout(new BorderLayout());

    add(myErrosLabel, BorderLayout.NORTH);
    add(myMessagesGutter = new MyMessagesGutter(), BorderLayout.CENTER);
    /*NodeTypesComponentsRepository.getInstance().addTypesComponentListener(new TypesComponentRepositoryListener() {
      public void typesComponentRemoved(NodeTypesComponent component) {
        removeMessages(component);
      }
    });*/
  }

  public EditorComponent getEditorComponent() {
    return myEditorComponent;
  }

  private void validateStatus() {
    ThreadUtils.runInUIThreadNoWait(new Runnable() {
      public void run() {
        GutterStatus status = GutterStatus.OK;
        for (EditorMessage message : myMessages) {
          // for MPS-10768: Gutter marker is red although no errors are present
          if (!message.isValid(myEditorComponent)) continue;
          // also a possible source of leaks is found:
          // an invalid message which keeps undisposed node which is "in air";
          // however there possibly are very little of such nodes and such messages are cleared after the next check.
          //
          // isValid is used incorrectly by AbstractLeftEditorHighlighterMessage so we can't clear all "invalid" messages.
          if (message.getStatus() == MessageStatus.WARNING) {
            status = GutterStatus.WARNING;
          }
          if (message.getStatus() == MessageStatus.ERROR) {
            status = GutterStatus.ERROR;
            break;
          }
        }
        setStatus(status);
        myStatusIsDirty = false;

        //otherwise some messages (removal of which does not affect model) could be not repainted
        repaint();
      }
    });
  }

  private void removeLater(Set<EditorMessage> messages) {
    myMessagesToRemove.addAll(messages);
    invalidateStatus();
  }

  private void invalidateStatus() {
    myStatusIsDirty = true;
  }

  public void setStatus(GutterStatus status) {
    switch (status) {
      case OK:
        myErrosLabel.setIcon(Icons.OK);
        break;
      case WARNING:
        myErrosLabel.setIcon(Icons.WARNINGS);
        break;
      case ERROR:
        myErrosLabel.setIcon(Icons.ERRORS);
        break;
      case IN_PROGRESS:
        myErrosLabel.setIcon(Icons.IN_PROGRESS);
        break;
    }
  }

  public void add(EditorMessage message) {
    myMessages.add(message);
    myOwners.put(message, message.getOwner());
    validateStatus();
  }

  public void remove(EditorMessage message) {
    myMessages.remove(message);
    myOwners.remove(message);
    validateStatus();
  }

  public void removeBadMessages() {
    if (myStatusIsDirty) {
      myMessages.removeAll(myMessagesToRemove);
      myMessagesToRemove.clear();
      validateStatus();
    }
  }

  public boolean removeMessages(EditorMessageOwner owner) {
    boolean removedAnything = false;
    for (EditorMessage m : new ArrayList<EditorMessage>(myMessages)) {
      if (myOwners.get(m) == owner) {
        myMessages.remove(m);
        myOwners.remove(m);
        removedAnything = true;
      }
    }
    validateStatus();
    return removedAnything;
  }

  public void dispose() {
    myMessagesGutter.dispose();
  }

  private class MyMessagesGutter extends JPanel implements TooltipComponent {
    public MyMessagesGutter() {
      MPSToolTipManager.getInstance().registerComponentRightAligned(this);

      addMouseListener(new MouseAdapter() {
        public void mousePressed(MouseEvent e) {
          List<EditorMessage> messages = getMessagesAt(e.getY());
          if (messages.size() > 0) {
            messages.get(0).doNavigate(myEditorComponent);
          }
        }
      });

      addMouseMotionListener(new MouseMotionAdapter() {
        public void mouseMoved(MouseEvent e) {
          List<EditorMessage> messages = getMessagesAt(e.getY());
          if (messages.size() > 0) {
            setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
          } else {
            setCursor(Cursor.getPredefinedCursor(Cursor.DEFAULT_CURSOR));
          }
        }
      });
    }

    protected void paintComponent(Graphics graphics) {
      removeBadMessages();
      super.paintComponent(graphics);
      Graphics2D g = (Graphics2D) graphics;
      //Set<EditorMessage> messagesToRemove = new HashSet<EditorMessage>();
      List<EditorMessage> editorMessages = new ArrayList<EditorMessage>(myMessages);
      Collections.sort(editorMessages, new Comparator<EditorMessage>() {
        public int compare(EditorMessage o1, EditorMessage o2) {
          if (o1 == o2) return 0;
          if (o1 == null) return -1;
          if (o2 == null) return 1;
          if (o1.getStatus().ordinal() == o2.getStatus().ordinal()) {
            if (o1.isLongInGutter() == o2.isLongInGutter()) {
              return getMessageStart(o1) - getMessageStart(o2);
            } else {
              return o1.isLongInGutter() ? -1 : 1;
            }
          } else {
            return o1.getStatus().ordinal() - o2.getStatus().ordinal();
          }
        }
      });
      for (EditorMessage msg : editorMessages) {
        if (msg == null || !msg.isValid(myEditorComponent)) {
          continue;
        }
        if (msg.isLongInGutter()) {
          int messageY = getMessageStart(msg);
          int messageHeight = getMessageHeight(msg) + 1;

          g.setColor(msg.getColorInGutter());
          int messageX = (getWidth() - 2) / 3;
          int messageWidth = (getWidth() - 2) / 3 + 1;
          g.fillRect(messageX, messageY, messageWidth, messageHeight);

          g.setColor(msg.getColorInGutter().darker());
          g.drawLine(messageX, messageY + messageHeight, messageX + messageWidth, messageY + messageHeight);
          g.drawLine(messageX + messageWidth, messageY, messageX + messageWidth, messageY + messageHeight);
        } else {
          int messageY = getMessagePosition(msg);

          g.setColor(new Color(80, 80, 80, 70));
          g.fillRect(1, messageY, getWidth() - 2, 2);

          g.setColor(msg.getColorInGutter());
          g.fillRect(0, messageY - 1, getWidth() - 2, 2);
        }
      }
      //removeLater(messagesToRemove);
    }

    private int getMessagePosition(EditorMessage msg) {
      int start = getMessageStart(msg);
      int length = getMessageHeight(msg);

      int messageY;
      switch (msg.getLocationOnCell()) {
        case CENTER: {
          messageY = start + (length / 2);
          break;
        }
        case BOTTOM: {
          messageY = start + length;
          break;
        }
        case TOP: {
          messageY = start;
          break;
        }
        default: {
          messageY = start + (length/2);
        }
      }
      return messageY;
    }

    private int getMessagesAreaShift() {
      MyScrollBar scrollBar = myEditorComponent.getVerticalScrollBar();
      return scrollBar.isVisible() ? Math.max(0, scrollBar.getDecScrollButtonHeight() - getBounds().y) : 0;
    }

    private int getMessagesAreaHeight() {
      MyScrollBar scrollBar = myEditorComponent.getVerticalScrollBar();
      if (!scrollBar.isVisible()) {
        return getHeight();
      }
      return scrollBar.getHeight() - scrollBar.getIncScrollButtonHeight() - Math.max(scrollBar.getDecScrollButtonHeight(), getBounds().y);
    }

    private int getMessageHeight(EditorMessage msg) {
      return (int) (Math.max(2.0d, msg.getHeight(myEditorComponent) * (((double) getMessagesAreaHeight()) / ((double) myEditorComponent.getHeight()))));
    }

    private int getMessageStart(EditorMessage msg) {
      return getMessagesAreaShift() + (int) (msg.getStart(myEditorComponent) * (((double) getMessagesAreaHeight()) / ((double) myEditorComponent.getHeight())));
    }

    public String getMPSTooltipText(MouseEvent event) {
      int y = event.getY();

      List<EditorMessage> messages = getMessagesAt(y);
      if (messages.size() > 0) {
        StringBuffer text = new StringBuffer();
        for (EditorMessage msg : messages) {
          if (text.length() > 0) {
            text.append("\n");
          }
          text.append(msg.getMessage());
          // text.append("(owner: " + msg.getOwner() + ")");
        }
        return text.toString();
      }

      return null;
    }

    @Override
    public Point getToolTipLocation(MouseEvent event) {
      int y = event.getY();

      List<EditorMessage> messages = getMessagesAt(y);
      if (messages.size() > 0) {
        EditorMessage msg = messages.get(messages.size() - 1);
        int pos = getMessagePosition(msg);

        return new Point(event.getX(), pos);
      }
      return null;
    }

    private List<EditorMessage> getMessagesAt(int y) {
      List<EditorMessage> result = new ArrayList<EditorMessage>();
      Set<EditorMessage> messagesToRemove = new HashSet<EditorMessage>();
      for (EditorMessage msg : myMessages) {
        if (!msg.isValid(myEditorComponent)) continue;
        if (msg.isLongInGutter()) {
          int messageY = getMessageStart(msg);
          int messageHeight = getMessageHeight(msg) + 1;
          if (y >= messageY - 5 && y <= messageY + messageHeight + 5) {
            result.add(msg);
          }
        } else {
          int position = getMessagePosition(msg);
          if (y >= position - 5 && y <= position + 5) {
            result.add(msg);
          }
        }
      }
      removeLater(messagesToRemove);
      return result;
    }

    public void dispose() {
      MPSToolTipManager.getInstance().unregisterComponentRightAligned(this);
    }
  }


  public enum GutterStatus {
    OK,
    WARNING,
    ERROR,
    IN_PROGRESS
  }
}
