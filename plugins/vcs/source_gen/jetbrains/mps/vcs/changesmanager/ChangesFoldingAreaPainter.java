package jetbrains.mps.vcs.changesmanager;

/*Generated by MPS */

import jetbrains.mps.nodeEditor.leftHighlighter.AbstractFoldingAreaPainter;
import java.awt.Color;
import java.util.List;
import org.jetbrains.annotations.NotNull;
import java.awt.Graphics;
import java.awt.Rectangle;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import java.util.ArrayList;
import jetbrains.mps.internal.collections.runtime.IWhereFilter;
import java.util.Comparator;
import org.jetbrains.annotations.Nullable;
import java.awt.Point;
import jetbrains.mps.baseLanguage.closures.runtime._FunctionTypes;
import java.awt.event.MouseEvent;
import java.awt.Cursor;
import jetbrains.mps.internal.collections.runtime.ILeftCombinator;
import jetbrains.mps.vcs.diff.oldchanges.OldChangeType;
import jetbrains.mps.vcs.diff.oldchanges.OldChange;
import jetbrains.mps.vcs.diff.oldchanges.SetNodeChange;
import jetbrains.mps.vcs.diff.oldchanges.SubstituteNodeChange;
import jetbrains.mps.vcs.diff.oldchanges.NewNodeChange;
import jetbrains.mps.vcs.diff.oldchanges.DeleteNodeChange;
import jetbrains.mps.vcs.diff.oldchanges.OldSetReferenceChange;
import jetbrains.mps.vcs.diff.oldchanges.OldSetPropertyChange;
import java.util.Set;
import jetbrains.mps.internal.collections.runtime.SetSequence;
import java.util.HashSet;
import jetbrains.mps.internal.collections.runtime.ISelector;
import javax.swing.JPopupMenu;
import com.intellij.openapi.actionSystem.ActionToolbar;
import com.intellij.openapi.actionSystem.ActionManager;
import com.intellij.openapi.actionSystem.ActionPlaces;
import jetbrains.mps.workbench.action.BaseGroup;
import javax.swing.BorderFactory;
import javax.swing.event.PopupMenuListener;
import javax.swing.event.PopupMenuEvent;
import jetbrains.mps.nodeEditor.leftHighlighter.LeftEditorHighlighter;

public class ChangesFoldingAreaPainter extends AbstractFoldingAreaPainter {
  private static final int AREA_WIDTH = 6;
  private static final int ARROW_HEIGHT = 8;
  private static final Color AREA_FRAME_COLOR = Color.GRAY;

  private EditorComponentChangesHighligher myEditorComponentChangesHighligher;
  private List<ChangesFoldingAreaPainter.MessageGroup> myMessageGroups;
  private ChangesFoldingAreaPainter.MessageGroup myCurrentMessageGroup = null;
  private ChangesFoldingAreaPainter.MessageGroup myMessageGroupUnderMouse = null;
  private ChangesFoldingAreaPainter.MyPopupMenu myPopupMenu = null;

  public ChangesFoldingAreaPainter(@NotNull EditorComponentChangesHighligher editorComponentChangesHighligher) {
    super(editorComponentChangesHighligher.getEditorComponent().getLeftEditorHighlighter());
    myEditorComponentChangesHighligher = editorComponentChangesHighligher;
  }

  public int getWeight() {
    return 0;
  }

  @Override
  protected void paintInLocalCoordinates(Graphics g) {
    if (myMessageGroups == null) {
      initMessageGroups();
    }
    Rectangle clipBounds = g.getClipBounds();
    if (clipBounds.x + clipBounds.width < -AREA_WIDTH - 1 || 0 < clipBounds.x) {
      return;
    }
    for (ChangesFoldingAreaPainter.MessageGroup messageGroup : ListSequence.fromList(myMessageGroups)) {
      int y = messageGroup.getY();
      g.setColor(messageGroup.getColor());
      if (messageGroup instanceof ChangesFoldingAreaPainter.ThinMessageGroup) {
        Graphics2D g2d = ((Graphics2D) g);
        Object oldAntialiasing = g2d.getRenderingHint(RenderingHints.KEY_ANTIALIASING);
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        int[] xPoints = new int[]{-AREA_WIDTH, -AREA_WIDTH, -1};
        int[] yPoints = new int[]{y, y + ChangesFoldingAreaPainter.ARROW_HEIGHT, y + ChangesFoldingAreaPainter.ARROW_HEIGHT / 2};
        g.fillPolygon(xPoints, yPoints, 3);

        g.setColor(AREA_FRAME_COLOR);
        g.drawPolygon(xPoints, yPoints, 3);
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, oldAntialiasing);
        continue;
      }
      int height = messageGroup.getHeight();
      if (height == 0 || y + height < clipBounds.y) {
        continue;
      }
      if (clipBounds.y + clipBounds.height < y) {
        break;
      }
      g.fillRect(-AREA_WIDTH, y, AREA_WIDTH, height);

      g.setColor(AREA_FRAME_COLOR);
      g.drawLine(-AREA_WIDTH, y, 0, y);
      g.drawLine(-AREA_WIDTH, y + height, 0, y + height);
      g.drawLine(-AREA_WIDTH, y, -AREA_WIDTH, y + height);
    }
  }

  @Override
  public int getLeftAreaWidth() {
    return AREA_WIDTH;
  }

  @Override
  public void relayout() {
    myMessageGroups = null;
  }

  private Rectangle getMessageBounds(@NotNull EditorComponent editorComponent, @NotNull EditorComponentChangesHighligher.ChangeEditorMessage message) {
    EditorCell cell = message.getCell(editorComponent);
    int x = cell.getX();
    int y = cell.getY();
    int width = cell.getWidth();
    int height = cell.getHeight();
    if (message.isThinDeletedMessage(editorComponent)) {
      y = message.getY(editorComponent);
      height = 1;
    }
    return new Rectangle(x, y, width, height);
  }

  private void initMessageGroups() {
    myMessageGroups = ListSequence.fromList(new ArrayList<ChangesFoldingAreaPainter.MessageGroup>());
    final EditorComponent editorComponent = getEditorComponent();
    List<EditorComponentChangesHighligher.ChangeEditorMessage> messagesWithCells = ListSequence.fromList(myEditorComponentChangesHighligher.getEditorMessages()).where(new IWhereFilter<EditorComponentChangesHighligher.ChangeEditorMessage>() {
      public boolean accept(EditorComponentChangesHighligher.ChangeEditorMessage m) {
        return m.getCell(editorComponent) != null;
      }
    }).toListSequence();

    messagesWithCells = ListSequence.fromList(messagesWithCells).sort(new Comparator<EditorComponentChangesHighligher.ChangeEditorMessage>() {
      public int compare(EditorComponentChangesHighligher.ChangeEditorMessage aMsg, EditorComponentChangesHighligher.ChangeEditorMessage bMsg) {
        Rectangle a = getMessageBounds(editorComponent, aMsg);
        Rectangle b = getMessageBounds(editorComponent, bMsg);
        if (a.y == b.y) {
          if (a.x == b.x) {
            return a.height - b.height;
          } else {
            return a.x - b.x;
          }
        } else {
          return a.y - b.y;
        }
      }
    }, true).toListSequence();

    List<EditorComponentChangesHighligher.ChangeEditorMessage> currentGroupMessages = ListSequence.fromList(new ArrayList<EditorComponentChangesHighligher.ChangeEditorMessage>());
    double currentMaxY = 0;
    for (EditorComponentChangesHighligher.ChangeEditorMessage message : ListSequence.fromList(messagesWithCells)) {
      Rectangle cellBounds = getMessageBounds(editorComponent, message);
      if (ListSequence.fromList(currentGroupMessages).isNotEmpty()) {
        if (currentMaxY < cellBounds.getMinY()) {
          ListSequence.fromList(myMessageGroups).addElement(createMessageGroup(currentGroupMessages));
          ListSequence.fromList(currentGroupMessages).clear();
        }
      }
      ListSequence.fromList(currentGroupMessages).addElement(message);
      currentMaxY = Math.max(currentMaxY, cellBounds.getMaxY());
    }
    if (ListSequence.fromList(currentGroupMessages).isNotEmpty()) {
      ListSequence.fromList(myMessageGroups).addElement(createMessageGroup(currentGroupMessages));
    }
  }

  @Nullable
  private ChangesFoldingAreaPainter.MessageGroup findMessageGroupUnder(@NotNull final Point p) {
    double localX = p.getX() - getLeftHighlighter().getFoldingLineX();
    if (localX >= -ChangesFoldingAreaPainter.AREA_WIDTH && localX < 0) {
      return ListSequence.fromList(myMessageGroups).findFirst(new IWhereFilter<ChangesFoldingAreaPainter.MessageGroup>() {
        public boolean accept(ChangesFoldingAreaPainter.MessageGroup mg) {
          return mg.getY() <= p.getY() && mg.getY() + mg.getHeight() >= p.getY();
        }
      });
    } else {
      return null;
    }
  }

  private void setCurrentMessageGroup(@Nullable ChangesFoldingAreaPainter.MessageGroup group) {
    if (myCurrentMessageGroup == group) {
      return;
    }
    _FunctionTypes._void_P1_E0<? super Boolean> setHighlighted = new _FunctionTypes._void_P1_E0<Boolean>() {
      public void invoke(Boolean highlighted) {
        if (myCurrentMessageGroup != null) {
          for (EditorComponentChangesHighligher.ChangeEditorMessage message : ListSequence.fromList(myCurrentMessageGroup.getMessages())) {
            message.setHighlighted(highlighted);
          }
        }
      }
    };

    setHighlighted.invoke(false);
    myCurrentMessageGroup = group;
    setHighlighted.invoke(true);
    myEditorComponentChangesHighligher.getEditorComponent().getHighlightManager().repaintAndRebuildEditorMessages();
  }

  @Override
  public void mouseMoved(MouseEvent event) {
    ChangesFoldingAreaPainter.MessageGroup messageGroup = findMessageGroupUnder(event.getPoint());
    if (messageGroup != null) {
      event.consume();
    }
    if (myMessageGroupUnderMouse == messageGroup) {
      return;
    }
    myMessageGroupUnderMouse = messageGroup;
    if (messageGroup != null) {
      event.getComponent().setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
    } else {
      event.getComponent().setCursor(null);
    }
    if (myPopupMenu == null || !(myPopupMenu.isVisible())) {
      setCurrentMessageGroup(messageGroup);
    }
  }

  @Override
  public void mouseExited(MouseEvent event) {
    if (myMessageGroupUnderMouse == null) {
      return;
    }
    event.getComponent().setCursor(null);
    myMessageGroupUnderMouse = null;
    if (myPopupMenu == null || !(myPopupMenu.isVisible())) {
      setCurrentMessageGroup(null);
    }
  }

  private ChangesFoldingAreaPainter.MyPopupMenu getPopupMenu() {
    if (myPopupMenu == null) {
      myPopupMenu = new ChangesFoldingAreaPainter.MyPopupMenu();
    }
    return myPopupMenu;
  }

  @Override
  public void mousePressed(MouseEvent event) {
    ChangesFoldingAreaPainter.MessageGroup messageGroup = findMessageGroupUnder(event.getPoint());
    if (messageGroup != null) {
      setCurrentMessageGroup(messageGroup);
      EditorCell cell = getEditorComponent().findCellWeak(event.getX(), event.getY());
      if (cell != null) {
        getEditorComponent().changeSelection(cell);
      }
      getPopupMenu().showIfNeeded(event);
    }
  }

  @Nullable
  public List<ChangesFoldingAreaPainter.MessageGroup> getMessageGroups() {
    return myMessageGroups;
  }

  public void updateAfterTransfer(@NotNull ChangesFoldingAreaPainter.MessageGroup messageGroup) {
    if (myPopupMenu != null && myPopupMenu.isVisible()) {
      getPopupMenu().updateAfterTransfer(messageGroup);
    } else {
      setCurrentMessageGroup(messageGroup);
    }
  }

  public void updateAfterRollback() {
    getPopupMenu().setVisible(false);
  }

  @NotNull
  public ChangesFoldingAreaPainter.MessageGroup getCurrentMessageGroup() {
    return myCurrentMessageGroup;
  }

  @Override
  public String getToolTipText() {
    return check_kvu3z4_a0a61(myCurrentMessageGroup);
  }

  @NotNull
  public ChangesFoldingAreaPainter.MessageGroup createMessageGroup(@NotNull List<EditorComponentChangesHighligher.ChangeEditorMessage> messages) {
    final EditorComponent editorComponent = getEditorComponent();
    if (ListSequence.fromList(messages).all(new IWhereFilter<EditorComponentChangesHighligher.ChangeEditorMessage>() {
      public boolean accept(EditorComponentChangesHighligher.ChangeEditorMessage m) {
        return m.isThinDeletedMessage(editorComponent);
      }
    })) {
      return new ChangesFoldingAreaPainter.ThinMessageGroup(messages);
    } else {
      return new ChangesFoldingAreaPainter.MessageGroup(messages);
    }
  }

  private static String check_kvu3z4_a0a61(ChangesFoldingAreaPainter.MessageGroup checkedDotOperand) {
    if (null != checkedDotOperand) {
      return checkedDotOperand.getToolTipText();
    }
    return null;
  }

  public class MessageGroup {
    private List<EditorComponentChangesHighligher.ChangeEditorMessage> myMessages = ListSequence.fromList(new ArrayList<EditorComponentChangesHighligher.ChangeEditorMessage>());
    private int myY = 0;
    private int myHeight = 0;

    private MessageGroup(@NotNull List<EditorComponentChangesHighligher.ChangeEditorMessage> messages) {
      // messages should be sorted by y, then by x, then by height 
      myMessages = ListSequence.fromListWithValues(new ArrayList<EditorComponentChangesHighligher.ChangeEditorMessage>(), messages);
      final EditorComponent editorComponent = getEditorComponent();
      myY = getMessageBounds(editorComponent, ListSequence.fromList(messages).first()).y;
      int bottomY = ListSequence.fromList(messages).foldLeft(0, new ILeftCombinator<EditorComponentChangesHighligher.ChangeEditorMessage, Integer>() {
        public Integer combine(Integer by, EditorComponentChangesHighligher.ChangeEditorMessage msg) {
          return Math.max(by, (int) getMessageBounds(editorComponent, msg).getMaxY());
        }
      });
      myHeight = bottomY - myY;
    }

    @NotNull
    public List<EditorComponentChangesHighligher.ChangeEditorMessage> getMessages() {
      return myMessages;
    }

    public int getY() {
      return myY;
    }

    public int getHeight() {
      return myHeight;
    }

    private OldChangeType getUnitedChangeType() {
      if (ListSequence.fromList(myMessages).all(new IWhereFilter<EditorComponentChangesHighligher.ChangeEditorMessage>() {
        public boolean accept(EditorComponentChangesHighligher.ChangeEditorMessage m) {
          return m.getChange().getChangeType() == OldChangeType.ADD;
        }
      })) {
        return OldChangeType.ADD;
      } else if (ListSequence.fromList(myMessages).all(new IWhereFilter<EditorComponentChangesHighligher.ChangeEditorMessage>() {
        public boolean accept(EditorComponentChangesHighligher.ChangeEditorMessage m) {
          return m.getChange().getChangeType() == OldChangeType.DELETE;
        }
      })) {
        return OldChangeType.DELETE;
      } else {
        return OldChangeType.CHANGE;
      }
    }

    @NotNull
    public Color getColor() {
      return getUnitedChangeType().getColor();
    }

    public String getToolTipText() {
      if (ListSequence.fromList(myMessages).count() == 1) {
        OldChange change = ListSequence.fromList(myMessages).first().getChange();
        if (change instanceof SetNodeChange && change.getChangeType() == OldChangeType.CHANGE || change instanceof SubstituteNodeChange) {
          return "Replaced node in '" + ((NewNodeChange) change).getNodeRole() + "' role";
        } else if (change instanceof NewNodeChange) {
          return "Added node in '" + ((NewNodeChange) change).getNodeRole() + "' role";
        } else if (change instanceof DeleteNodeChange) {
          return "Deleted node from '" + ((DeleteNodeChange) change).getRole() + "' role";
        } else if (change instanceof OldSetReferenceChange) {
          return "Changed '" + ((OldSetReferenceChange) change).getRole() + "' reference target";
        } else if (change instanceof OldSetPropertyChange) {
          return "Changed '" + ((OldSetPropertyChange) change).getProperty() + "' property value";
        }
        return "1 change";
      } else {
        OldChangeType unitedChangeType = getUnitedChangeType();
        switch (unitedChangeType) {
          case ADD:
            return "Added " + ListSequence.fromList(myMessages).count() + " nodes";
          case DELETE:
            return "Deleted " + ListSequence.fromList(myMessages).count() + " nodes";
          default:
            return ListSequence.fromList(myMessages).count() + " changes";
        }
      }
    }
  }

  private class ThinMessageGroup extends ChangesFoldingAreaPainter.MessageGroup {
    private int myY;

    public ThinMessageGroup(@NotNull List<EditorComponentChangesHighligher.ChangeEditorMessage> messages) {
      super(messages);
      final EditorComponent editorComponent = getEditorComponent();
      assert ListSequence.fromList(messages).all(new IWhereFilter<EditorComponentChangesHighligher.ChangeEditorMessage>() {
        public boolean accept(EditorComponentChangesHighligher.ChangeEditorMessage m) {
          return m.isThinDeletedMessage(editorComponent);
        }
      });
      Set<Integer> ys = SetSequence.fromSetWithValues(new HashSet<Integer>(), ListSequence.fromList(messages).select(new ISelector<EditorComponentChangesHighligher.ChangeEditorMessage, Integer>() {
        public Integer select(EditorComponentChangesHighligher.ChangeEditorMessage m) {
          return m.getY(editorComponent);
        }
      }));
      assert SetSequence.fromSet(ys).count() == 1;
      myY = SetSequence.fromSet(ys).first() - ChangesFoldingAreaPainter.ARROW_HEIGHT / 2;
    }

    @NotNull
    @Override
    public Color getColor() {
      return OldChangeType.DELETE.getColor();
    }

    @Override
    public int getHeight() {
      return ChangesFoldingAreaPainter.ARROW_HEIGHT;
    }

    @Override
    public int getY() {
      return myY;
    }
  }

  private class MyPopupMenu extends JPopupMenu {
    private ActionToolbar myActionToolbar;

    public MyPopupMenu() {
      myActionToolbar = ActionManager.getInstance().createActionToolbar(ActionPlaces.UNKNOWN, ((BaseGroup) ActionManager.getInstance().getAction("jetbrains.mps.vcs.plugin.ChangesStrip_ActionGroup")), true);
      myActionToolbar.setTargetComponent(getEditorComponent());
      add(myActionToolbar.getComponent());
      setBorder(BorderFactory.createLineBorder(Color.BLACK));
      addPopupMenuListener(new PopupMenuListener() {
        public void popupMenuWillBecomeVisible(PopupMenuEvent event) {
          myActionToolbar.updateActionsImmediately();
        }

        public void popupMenuWillBecomeInvisible(PopupMenuEvent event) {
          setCurrentMessageGroup(null);
        }

        public void popupMenuCanceled(PopupMenuEvent event) {
        }
      });
    }

    public void showIfNeeded(MouseEvent event) {
      if (event.getButton() == MouseEvent.BUTTON1) {
        show(event.getComponent(), getLeftHighlighter().getFoldingLineX(), event.getY());
        event.consume();
      }
    }

    public void updateAfterTransfer(@NotNull ChangesFoldingAreaPainter.MessageGroup messageGroup) {
      if (isVisible()) {
        setVisible(false);
        LeftEditorHighlighter leftHighlighter = getLeftHighlighter();
        EditorCell selectedCell = getEditorComponent().getSelectedCell();
        if (selectedCell != null) {
          show(leftHighlighter, leftHighlighter.getFoldingLineX(), selectedCell.getY());
        }
        setCurrentMessageGroup(messageGroup);
      }
    }
  }
}
