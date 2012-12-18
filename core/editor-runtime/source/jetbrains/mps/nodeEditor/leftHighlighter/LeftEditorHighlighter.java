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
package jetbrains.mps.nodeEditor.leftHighlighter;

import com.intellij.ide.DataManager;
import com.intellij.openapi.actionSystem.*;
import com.intellij.openapi.util.Computable;
import com.intellij.util.containers.SortedList;
import com.intellij.util.ui.UIUtil;
import gnu.trove.TIntObjectHashMap;
import gnu.trove.TIntObjectProcedure;
import jetbrains.mps.ide.actions.EditorLeftPanelMenu_ActionGroup;
import jetbrains.mps.ide.tooltips.MPSToolTipManager;
import jetbrains.mps.ide.tooltips.TooltipComponent;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.EditorComponent.RebuildListener;
import jetbrains.mps.nodeEditor.EditorMessage;
import jetbrains.mps.nodeEditor.EditorMessageIconRenderer;
import jetbrains.mps.nodeEditor.EditorMessageIconRenderer.IconRendererType;
import jetbrains.mps.nodeEditor.bookmark.BookmarkManager;
import jetbrains.mps.nodeEditor.bookmark.BookmarkManager.BookmarkListener;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Label;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.Pair;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.action.BaseGroup;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import javax.swing.JComponent;
import javax.swing.JPopupMenu;
import javax.swing.SwingUtilities;
import java.awt.*;
import java.awt.event.ComponentEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;
import java.util.*;
import java.util.List;

/**
 * This class should be called in UI (EventDispatch) thread only
 */
public class LeftEditorHighlighter extends JComponent implements TooltipComponent {
  public static final String ICON_AREA = "LeftEditorHighlighterIconArea";
  private static final Color BACKGROUND_COLOR = Color.WHITE; // new Color(0xF0F0F0);

  private static final int MIN_LEFT_TEXT_WIDTH = 0;
  private static final int MIN_ICON_RENDERERS_WIDTH = 14;
  private static final int MIN_LEFT_FOLDING_AREA_WIDTH = 7;
  private static final int MIN_RIGHT_FOLDING_AREA_WIDTH = 4;
  private static final int GAP_BETWEEN_ICONS = 3;
  private static final int LEFT_GAP = 1;
  private static final int FOLDING_LINE_WIDTH = 1;
  private static final Comparator<AbstractFoldingAreaPainter> FOLDING_AREA_PAINTERS_COMPARATOR = new Comparator<AbstractFoldingAreaPainter>() {
    @Override
    public int compare(AbstractFoldingAreaPainter afap1, AbstractFoldingAreaPainter afap2) {
      if (afap1.getWeight() == afap2.getWeight() && !afap1.equals(afap2)) {
        return System.identityHashCode(afap1) - System.identityHashCode(afap2);
      }
      return afap1.getWeight() - afap2.getWeight();
    }
  };

  private EditorComponent myEditorComponent;
  private NavigableSet<AbstractFoldingAreaPainter> myFoldingAreaPainters = new TreeSet<AbstractFoldingAreaPainter>(FOLDING_AREA_PAINTERS_COMPARATOR);
  private BracketsPainter myBracketsPainter;
  private FoldingButtonsPainter myFoldingButtonsPainter;

  private List<AbstractLeftColumn> myLeftColumns = new ArrayList<AbstractLeftColumn>();

  private BookmarkListener myListener;
  private BookmarkManager myBookmarkManager = null;

  private Set<EditorMessageIconRenderer> myIconRenderers = new HashSet<EditorMessageIconRenderer>();
  private TIntObjectHashMap<List<IconRendererLayoutConstraint>> myLineToRenderersMap = new TIntObjectHashMap<List<IconRendererLayoutConstraint>>();
  private Comparator myIconRenderersComparator = new IconRendererLayoutConstraintComparator();
  private EditorMessageIconRenderer myRendererUnderMouse;
  private int myMaxIconHeight = 0;

  private boolean myMouseIsInFoldingArea;

  private int myFoldingLineX;
  private int myIconRenderersWidth;
  private int myTextColumnWidth;
  private int myLeftFoldingAreaWidth;
  private int myRightFoldingAreaWidth;
  private int myWidth;
  private int myHeight;
  private boolean myRightToLeft;

  public LeftEditorHighlighter(@NotNull EditorComponent editorComponent, boolean rightToLeft) {
    setBackground(BACKGROUND_COLOR);
    myEditorComponent = editorComponent;
    myRightToLeft = rightToLeft;
    addMouseListener(new MouseAdapter() {
      @Override
      public void mouseExited(MouseEvent e) {
        mouseExitedFoldingArea(e);
        mouseExitedIconsArea(e);
      }

      @Override
      public void mouseEntered(MouseEvent e) {
        if (isInFoldingArea(e)) {
          mouseMovedInFoldingArea(e);
        } else if (isInTextArea(e)) {
          mouseMovedInTextArea(e);
        } else {
          mouseMovedInIconsArea(e);
        }
      }
    });
    addMouseMotionListener(new MouseMotionAdapter() {
      public void mouseMoved(MouseEvent e) {
        if (isInFoldingArea(e)) {
          mouseExitedIconsArea(e);
          mouseMovedInFoldingArea(e);
        } else if (isInTextArea(e)) {
          mouseExitedFoldingArea(e);
          mouseExitedIconsArea(e);
          mouseMovedInTextArea(e);
        } else {
          mouseExitedFoldingArea(e);
          mouseMovedInIconsArea(e);
        }
      }
    });
    MPSToolTipManager.getInstance().registerComponent(this);
    editorComponent.addRebuildListener(new RebuildListener() {
      public void editorRebuilt(EditorComponent editor) {
        assert SwingUtilities.isEventDispatchThread() : "LeftEditorHighlighter$RebuildListener should be called in eventDispatchThread";
        removeAllIconRenderers(BookmarkIconRenderer.TYPE);
        BookmarkManager bookmarkManager = getBookmarkManager();
        if (bookmarkManager != null) {
          bookmarkManager.removeBookmarkListener(myListener);
          SNode editedNode = myEditorComponent.getEditedNode();
          if (editedNode != null) {
            for (Pair<SNode, Integer> bookmark : bookmarkManager.getBookmarks(editedNode.getContainingRoot())) {
              addBookmark(bookmark.o1, bookmark.o2);
            }
          }
          myListener = new BookmarkListener() {
            public void bookmarkAdded(int number, SNode node) {
              assert SwingUtilities.isEventDispatchThread() : "LeftEditorHighlighter$BookmarkListener should be called in eventDispatchThread";
              addBookmark(node, number);
            }

            public void bookmarkRemoved(int number, SNode node) {
              assert SwingUtilities.isEventDispatchThread() : "LeftEditorHighlighter$BookmarkListener should be called in eventDispatchThread";
              if (number == -1) {
                removeUnnumberedBookmark(node);
              } else {
                removeBookmark(number);
              }
            }
          };
          bookmarkManager.addBookmarkListener(myListener);
        }
        for (AbstractFoldingAreaPainter painter : myFoldingAreaPainters) {
          painter.editorRebuilt();
        }
      }
    });
    myBracketsPainter = new BracketsPainter(this, myRightToLeft);
    myFoldingButtonsPainter = new FoldingButtonsPainter(this);

    myFoldingAreaPainters.add(myBracketsPainter);
    myFoldingAreaPainters.add(myFoldingButtonsPainter);
  }

  @NotNull
  public EditorComponent getEditorComponent() {
    return myEditorComponent;
  }

  public int getRightFoldingAreaWidth() {
    return myRightFoldingAreaWidth;
  }

  public int getFoldingLineX() {
    return myFoldingLineX;
  }

  private int getIconRenderersOffset() {
    return myRightToLeft ? getFoldingAreaWidth() : myTextColumnWidth;
  }

  private int getFoldingAreaOffset() {
    return myRightToLeft ? 0 : myTextColumnWidth + myIconRenderersWidth;
  }

  private int getTextColumnOffset() {
    return myRightToLeft ? getFoldingAreaWidth() + myIconRenderersWidth : 0;
  }

  private int getFoldingAreaWidth() {
    return myLeftFoldingAreaWidth + FOLDING_LINE_WIDTH + myRightFoldingAreaWidth;
  }

  private boolean isInside(int offset, int width, int x) {
    return offset <= x && x < offset + width;
  }

  private boolean hasIntersection(int x1, int width1, Rectangle rectangle) {
    int x2 = rectangle.x;
    int width2 = rectangle.width;
    return x1 <= x2 ? x1 + width1 >= x2 : x2 + width2 >= x1;
  }

  public void dispose() {
    for (AbstractFoldingAreaPainter painter : myFoldingAreaPainters) {
      painter.dispose();
    }
    for (AbstractLeftColumn column : myLeftColumns) {
      column.dispose();
    }
    BookmarkManager bookmarkManager = getBookmarkManager();
    if (bookmarkManager != null) {
      bookmarkManager.removeBookmarkListener(myListener);
    }
    MPSToolTipManager.getInstance().unregisterComponent(this);
  }

  public void setDefaultFoldingAreaPaintersEnabled(boolean enabled) {
    if (enabled) {
      addFoldingAreaPainter(myBracketsPainter);
      addFoldingAreaPainter(myFoldingButtonsPainter);
    } else {
      removeFoldingAreaPainter(myBracketsPainter);
      removeFoldingAreaPainter(myFoldingButtonsPainter);
    }
  }

  public void addFoldingAreaPainter(AbstractFoldingAreaPainter painter) {
    if (myFoldingAreaPainters.contains(painter)) {
      return;
    }
    myFoldingAreaPainters.add(painter);
    relayout(true);
    repaint();
  }

  public void removeFoldingAreaPainter(AbstractFoldingAreaPainter painter) {
    if (!myFoldingAreaPainters.contains(painter)) {
      return;
    }
    myFoldingAreaPainters.remove(painter);
    relayout(true);
    repaint();
  }

  public void addLeftColumn(AbstractLeftColumn column) {
    myLeftColumns.add(column);
    relayoutOnLeftColumnChange();
    repaint();
  }

  public void removeLeftColumn(AbstractLeftColumn column) {
    myLeftColumns.remove(column);
    relayoutOnLeftColumnChange();
    repaint();
  }

  public List<AbstractLeftColumn> getLeftColumns() {
    return myLeftColumns;
  }

  @Override
  public void paint(Graphics g) {
    Rectangle clipBounds = g.getClipBounds();
    paintBackgroundAndFoldingLine(g, clipBounds);
    paintTextColumns(g, clipBounds);
    paintIconRenderers(g, clipBounds);
    paintFoldingArea(g, clipBounds);
  }

  private void paintFoldingArea(Graphics g, Rectangle clipBounds) {
    if (!hasIntersection(getFoldingAreaOffset(), getFoldingAreaWidth(), clipBounds)) {
      return;
    }
    for (AbstractFoldingAreaPainter painter : myFoldingAreaPainters) {
      painter.paint(g);
    }
  }

  private void paintBackgroundAndFoldingLine(Graphics g, Rectangle clipBounds) {
    Graphics2D g2d = (Graphics2D) g;
    g.setColor(getBackground());
    g.fillRect(clipBounds.x, clipBounds.y, Math.min(clipBounds.width, myFoldingLineX - clipBounds.x), clipBounds.height);
    g.setColor(getEditorComponent().getBackground());
    g.fillRect(Math.max(clipBounds.x, myFoldingLineX), clipBounds.y, clipBounds.width - Math.max(0, myFoldingLineX - clipBounds.x), clipBounds.height);

    // same as in EditorComponent.paint() method
    EditorCell deepestCell = myEditorComponent.getDeepestSelectedCell();
    if (deepestCell instanceof EditorCell_Label) {
      int selectedCellY = deepestCell.getY();
      int selectedCellHeight = deepestCell.getHeight() - deepestCell.getTopInset() - deepestCell.getBottomInset();
      if (g.hitClip(clipBounds.x, selectedCellY, clipBounds.width, selectedCellHeight)) {
        g.setColor(EditorComponent.CARET_ROW_COLOR);
        g.fillRect(clipBounds.x, selectedCellY, clipBounds.width, selectedCellHeight);
        // Drawing folding line
        UIUtil.drawVDottedLine(g2d, myFoldingLineX, clipBounds.y, selectedCellY, getBackground(), Color.gray);
        UIUtil.drawVDottedLine(g2d, myFoldingLineX, selectedCellY, selectedCellY + selectedCellHeight, EditorComponent.CARET_ROW_COLOR, Color.gray);
        UIUtil.drawVDottedLine(g2d, myFoldingLineX, selectedCellY + selectedCellHeight, clipBounds.y + clipBounds.height, getBackground(), Color.gray);
        return;
      }
    }
    // Drawing folding line
    UIUtil.drawVDottedLine(g2d, myFoldingLineX, clipBounds.y, clipBounds.y + clipBounds.height, getBackground(), Color.gray);
  }

  private void paintIconRenderers(final Graphics g, Rectangle clipBounds) {
    if (!hasIntersection(getIconRenderersOffset(), myIconRenderersWidth, clipBounds)) {
      return;
    }
    final int startY = clipBounds.y;
    final int endY = clipBounds.y + clipBounds.height;
    myLineToRenderersMap.forEachEntry(new TIntObjectProcedure<List<IconRendererLayoutConstraint>>() {
      @Override
      public boolean execute(int y, List<IconRendererLayoutConstraint> rendererConstraints) {
        if (startY <= y && y <= endY) {
          for (IconRendererLayoutConstraint constraint : rendererConstraints) {
            constraint.getIconRenderer().getIcon().paintIcon(LeftEditorHighlighter.this, g, constraint.getX(), y);
          }
        }
        return true;
      }
    });
  }

  private void paintTextColumns(Graphics g, Rectangle clipBounds) {
    if (!hasIntersection(getTextColumnOffset(), myTextColumnWidth, clipBounds)) {
      return;
    }
    for (AbstractLeftColumn column : myLeftColumns) {
      if (clipBounds.x > column.getX() + column.getWidth()) {
        continue;
      }
      column.paint(g);
      UIUtil.drawVDottedLine((Graphics2D) g, myRightToLeft ? column.getX() : column.getX() + column.getWidth() - 1,
        (int) clipBounds.getMinY(), (int) clipBounds.getMaxY(), getBackground(), Color.GRAY);
    }
  }

  public void unHighlight(EditorCell cell) {
    assert SwingUtilities.isEventDispatchThread() : "LeftEditorHighlighter.unHighlight() should be called in eventDispatchThread";
    myBracketsPainter.removeBracket(cell);
  }

  public void highlight(EditorCell cell, EditorCell cell2, Color c) {
    assert SwingUtilities.isEventDispatchThread() : "LeftEditorHighlighter.unHighlight() should be called in eventDispatchThread";
    assert cell.getEditor() == myEditorComponent : "cell must be from my editor";
    myBracketsPainter.addBracket(cell, cell2, c);
  }

  private void addBookmark(SNode node, int number) {
    // TODO: Do we need all these checks?..
    if (node == null) return;
    SNode editedNode = myEditorComponent.getEditedNode();
    if (editedNode == null) return;
    if (node.getContainingRoot() != editedNode.getContainingRoot()) {
      return;
    }
    EditorCell nodeCell = myEditorComponent.findNodeCell(node);
    if (nodeCell == null) {
      //   LOG.error("can't find a cell for node " + node);
      return;
    }
    addIconRenderer(new BookmarkIconRenderer(node, number));
  }

  private void removeBookmark(int number) {
    for (EditorMessageIconRenderer renderer : myIconRenderers) {
      if (renderer instanceof BookmarkIconRenderer && ((BookmarkIconRenderer) renderer).getNumber() == number) {
        removeIconRenderer(renderer);
        return;
      }
    }
  }

  private void removeUnnumberedBookmark(SNode node) {
    EditorCell nodeCell = myEditorComponent.findNodeCell(node);
    if (nodeCell == null) {
      //   LOG.error("can't find a cell for node " + node);
      return;
    }
    for (EditorMessageIconRenderer renderer : myIconRenderers) {
      if (renderer instanceof BookmarkIconRenderer) {
        BookmarkIconRenderer bookmarkIconRenderer = (BookmarkIconRenderer) renderer;
        if (bookmarkIconRenderer.getNumber() == -1 && bookmarkIconRenderer.getNode() == node) {
          removeIconRenderer(bookmarkIconRenderer);
          break;
        }
      }
    }
  }

  public void relayout(boolean updateFolding) {
    assert SwingUtilities.isEventDispatchThread() : "LeftEditorHighlighter.relayout() should be executed in eventDispatchThread";
    SNode editedNode = myEditorComponent.getEditedNode();
    // additional check - during editor dispose process some Folding area painters can be removed calling relayout()..
    if (myEditorComponent.isDisposed() || (editedNode != null && editedNode.isDisposed())) {
      return;
    }
    if (myRightToLeft) {
      recalculateFoldingAreaWidth();
      updateSeparatorLinePosition();
      if (updateFolding) {
        for (AbstractFoldingAreaPainter painter : myFoldingAreaPainters) {
          painter.relayout();
        }
        // wee need to recalculateIconRenderersWidth only if one of collections was folded/unfolded
        recalculateIconRenderersWidth();
      }
      recalculateTextColumnWidth();
    } else {
      recalculateTextColumnWidth();
      if (updateFolding) {
        for (AbstractFoldingAreaPainter painter : myFoldingAreaPainters) {
          painter.relayout();
        }
        // wee need to recalculateIconRenderersWidth only if one of collections was folded/unfolded
        recalculateIconRenderersWidth();
      }
      recalculateFoldingAreaWidth();
      updateSeparatorLinePosition();
    }
    updatePreferredSize();
  }

  // Optimization: partly layouting
  private void relayoutOnIconRendererChanges() {
    if (myRightToLeft) {
      recalculateIconRenderersWidth();
      recalculateTextColumnWidth();
    } else {
      recalculateIconRenderersWidth();
      updateSeparatorLinePosition();
    }
    updatePreferredSize();
  }

  // Optimization: partly layouting
  private void relayoutOnLeftColumnChange() {
    if (myRightToLeft) {
      recalculateTextColumnWidth();
    } else {
      recalculateTextColumnWidth();
      recalculateIconRenderersWidth();
      updateSeparatorLinePosition();
    }
    updatePreferredSize();
  }

  private void recalculateFoldingAreaWidth() {
    myLeftFoldingAreaWidth = myRightToLeft ? MIN_RIGHT_FOLDING_AREA_WIDTH : MIN_LEFT_FOLDING_AREA_WIDTH;
    myRightFoldingAreaWidth = myRightToLeft ? MIN_LEFT_FOLDING_AREA_WIDTH : MIN_RIGHT_FOLDING_AREA_WIDTH;
    // Layouting painters
    for (AbstractFoldingAreaPainter painter : myFoldingAreaPainters) {
      myLeftFoldingAreaWidth = Math.max(myLeftFoldingAreaWidth, painter.getLeftAreaWidth());
      myRightFoldingAreaWidth = Math.max(myRightFoldingAreaWidth, painter.getRightAreaWidth());
    }
  }

  private BookmarkManager getBookmarkManager() {
    if (myBookmarkManager != null) {
      return myBookmarkManager;
    }
    IOperationContext context = myEditorComponent.getOperationContext();
    if (context == null) {
      return null;
    }
    BookmarkManager bookmarkManager = context.getComponent(BookmarkManager.class);
    myBookmarkManager = bookmarkManager;
    return bookmarkManager;
  }

  public void addIconRenderer(EditorMessageIconRenderer renderer) {
    assert SwingUtilities.isEventDispatchThread() : "LeftEditorHighlighter.addIconRenderer() should be called in eventDispatchThread";
    myIconRenderers.add(renderer);
    relayoutOnIconRendererChanges();
  }

  public void addAllIconRenderers(Collection<EditorMessageIconRenderer> renderers) {
    assert SwingUtilities.isEventDispatchThread() : "LeftEditorHighlighter.addAllIconRenderers() should be called in eventDispatchThread";
    myIconRenderers.addAll(renderers);
    relayoutOnIconRendererChanges();
  }

  public void removeIconRenderer(EditorMessageIconRenderer renderer) {
    assert SwingUtilities.isEventDispatchThread() : "LeftEditorHighlighter.removeIconRenderer() should be called in eventDispatchThread";
    if (myIconRenderers.remove(renderer)) {
      relayoutOnIconRendererChanges();
    }
  }

  public void removeIconRenderer(SNode snode, IconRendererType type) {
    assert SwingUtilities.isEventDispatchThread() : "LeftEditorHighlighter.removeIconRenderer() should be called in eventDispatchThread";
    boolean wasModified = false;
    for (Iterator<EditorMessageIconRenderer> it = myIconRenderers.iterator(); it.hasNext();) {
      EditorMessageIconRenderer renderer = it.next();
      if (renderer.getNode() == snode && (type == null || renderer.getType() == type)) {
        it.remove();
        wasModified = true;
      }
    }
    if (wasModified) {
      relayoutOnIconRendererChanges();
    }
  }

  public void removeAllIconRenderers(Collection<EditorMessageIconRenderer> renderers) {
    assert SwingUtilities.isEventDispatchThread() : "LeftEditorHighlighter.removeAllIconRenderers() should be called in eventDispatchThread";
    if (myIconRenderers.removeAll(renderers)) {
      relayoutOnIconRendererChanges();
    }
  }

  public void removeAllIconRenderers(IconRendererType type) {
    assert SwingUtilities.isEventDispatchThread() : "LeftEditorHighlighter.removeAllIconRenderers() should be called in eventDispatchThread";
    boolean wasModified = false;
    for (Iterator<EditorMessageIconRenderer> it = myIconRenderers.iterator(); it.hasNext();) {
      EditorMessageIconRenderer renderer = it.next();
      if (renderer.getType() == type) {
        it.remove();
        wasModified = true;
      }
    }
    if (wasModified) {
      relayoutOnIconRendererChanges();
    }
  }

  private void recalculateIconRenderersWidth() {
    myLineToRenderersMap.clear();
    for (EditorMessageIconRenderer renderer : myIconRenderers) {
      int yCoordinate = getIconCoordinate(renderer);
      if (yCoordinate < 0) {
        continue;
      }
      List<IconRendererLayoutConstraint> renderersForLine = myLineToRenderersMap.get(yCoordinate);
      if (renderersForLine == null) {
        renderersForLine = new SortedList(myIconRenderersComparator);
        myLineToRenderersMap.put(yCoordinate, renderersForLine);
      }
      renderersForLine.add(new IconRendererLayoutConstraint(renderer));
    }

    myIconRenderersWidth = MIN_ICON_RENDERERS_WIDTH;
    myMaxIconHeight = 0;
    int[] sortedYCoordinates = myLineToRenderersMap.keys();
    Arrays.sort(sortedYCoordinates);

    int initialOffset = getIconRenderersOffset();
    for (int y : sortedYCoordinates) {
      List<IconRendererLayoutConstraint> row = myLineToRenderersMap.get(y);
      assert row.size() != 0;
      int maxIconHeight = 0;
      for (IconRendererLayoutConstraint rendererConstraint : row) {
        maxIconHeight = Math.max(maxIconHeight, rendererConstraint.getIconRenderer().getIcon().getIconHeight());
      }
      myMaxIconHeight = Math.max(myMaxIconHeight, maxIconHeight);
      int offset = initialOffset + LEFT_GAP;
      for (Iterator<IconRendererLayoutConstraint> it = row.iterator(); it.hasNext();) {
        IconRendererLayoutConstraint rendererConstraint = it.next();
        rendererConstraint.setX(offset);
        offset += rendererConstraint.getIconRenderer().getIcon().getIconWidth();
        if (it.hasNext()) {
          offset += GAP_BETWEEN_ICONS;
        }
      }
      myIconRenderersWidth = Math.max(myIconRenderersWidth, offset - initialOffset);
    }
  }

  private void recalculateTextColumnWidth() {
    int initialOffset = getTextColumnOffset();
    int offset = initialOffset;
    for (AbstractLeftColumn column : myLeftColumns) {
      column.setX(offset);
      column.relayout();
      offset += column.getWidth();
    }
    myTextColumnWidth = Math.max(MIN_LEFT_TEXT_WIDTH, offset - initialOffset);
  }

  private void updateSeparatorLinePosition() {
    myFoldingLineX = getFoldingAreaOffset() + myLeftFoldingAreaWidth;
  }

  private void updatePreferredSize() {
    int newWidth = myTextColumnWidth + myIconRenderersWidth + getFoldingAreaWidth();
    int newHeight = myEditorComponent.getPreferredSize().height;
    if (myWidth != newWidth || myHeight != newHeight) {
      myWidth = newWidth;
      myHeight = newHeight;
      firePreferredSizeChanged();
    }
  }

  private void firePreferredSizeChanged() {
    processComponentEvent(new ComponentEvent(this, ComponentEvent.COMPONENT_RESIZED));
  }

  @Override
  public Dimension getPreferredSize() {
    return new Dimension(myWidth + 1, myEditorComponent.getPreferredSize().height);
  }

  private int getIconCoordinate(EditorMessageIconRenderer renderer) {
    EditorCell anchorCell = getAnchorCell(renderer);
    if (anchorCell == null || anchorCell.isUnderFolded()) {
      // no anchorCell 
      return -1;
    }
    return anchorCell.getY() + anchorCell.getHeight() / 2 - renderer.getIcon().getIconHeight() / 2;
  }

  private EditorCell getAnchorCell(EditorMessageIconRenderer renderer) {
    SNode rendererNode = renderer.getNode();
    EditorCell nodeCell = myEditorComponent.findNodeCell(rendererNode);
    if (nodeCell == null) {
      // no cell for node?..
      return null;
    }
    return renderer.getAnchorCell(nodeCell);
  }

  public String getMPSTooltipText(MouseEvent e) {
    if (isInFoldingArea(e)) {
      for (AbstractFoldingAreaPainter painter : myFoldingAreaPainters) {
        if (painter.getToolTipText() != null) {
          return painter.getToolTipText();
        }
      }
    } else if (isInTextArea(e)) {
      AbstractLeftColumn column = getTextColumnByX(e.getX());
      if (column != null) {
        return column.getTooltipText(e);
      }
    } else {
      EditorMessageIconRenderer iconRenderer = getIconRendererUnderMouse(e);
      if (iconRenderer != null) {
        return iconRenderer.getTooltipText();
      }
    }
    return null;
  }

  @Override
  protected void processMouseEvent(MouseEvent e) {
    switch (e.getID()) {
      case MouseEvent.MOUSE_PRESSED:
      case MouseEvent.MOUSE_RELEASED:
      case MouseEvent.MOUSE_CLICKED:
        if (isInFoldingArea(e)) {
          mousePressedInFoldingArea(e);
        } else if (isInTextArea(e)) {
          mousePressedInTextArea(e);
        } else {
          mousePressedInIconsArea(e);
        }
        if (!e.isConsumed() && e.getButton() == MouseEvent.BUTTON3 && e.getID() == MouseEvent.MOUSE_PRESSED) {
          BaseGroup actionGroup = ActionUtils.getGroup(EditorLeftPanelMenu_ActionGroup.ID);
          if (actionGroup != null) {
            ActionPopupMenu popupMenu = ActionManager.getInstance().createActionPopupMenu(ActionPlaces.EDITOR_POPUP, actionGroup);
            popupMenu.getComponent().show(e.getComponent(), e.getX(), e.getY());
            e.consume();
          }
        }
    }

    // suppressing future event processig in case event was consumed by one of LeftHighlighter elements
    if (!e.isConsumed()) {
      super.processMouseEvent(e);
    }
  }

  private void mousePressedInIconsArea(MouseEvent e) {
    EditorMessageIconRenderer iconRenderer = getIconRendererUnderMouse(e);
    if (iconRenderer != null) {
      if (e.getButton() == MouseEvent.BUTTON3) {
        JPopupMenu popupMenu = iconRenderer.getPopupMenu();
        if (popupMenu != null && e.getID() == MouseEvent.MOUSE_PRESSED) {
          e.consume();
          popupMenu.show(myEditorComponent, e.getX(), e.getY());
        }
        return;
      }
      AnAction action = iconRenderer.getClickAction();
      if (e.getButton() == MouseEvent.BUTTON1 && action != null) {
        if (e.getID() == MouseEvent.MOUSE_CLICKED) {
          AnActionEvent actionEvent = new AnActionEvent(e, new LeftEditorHighlighterDataContext(myEditorComponent, iconRenderer.getNode()), ICON_AREA, action.getTemplatePresentation(), ActionManager.getInstance(), e.getModifiers());
          action.update(actionEvent);
          action.actionPerformed(actionEvent);
        }
        e.consume();
      }
    }
  }

  private void mousePressedInFoldingArea(MouseEvent e) {
    for (Iterator<AbstractFoldingAreaPainter> it = myFoldingAreaPainters.descendingIterator(); it.hasNext();) {
      AbstractFoldingAreaPainter painter = it.next();
      painter.mousePressed(e);
      if (e.isConsumed()) {
        break;
      }
    }
  }

  private void mousePressedInTextArea(MouseEvent e) {
    if (e.isConsumed()) return;
    AbstractLeftColumn column = getTextColumnByX(e.getX());
    if (column != null) {
      column.mousePressed(e);
      e.consume();
    }
  }

  private void mouseExitedFoldingArea(MouseEvent e) {
    if (myMouseIsInFoldingArea) {
      for (AbstractFoldingAreaPainter painter : myFoldingAreaPainters) {
        painter.mouseExited(e);
      }
    }
  }

  private void mouseMovedInFoldingArea(MouseEvent e) {
    myMouseIsInFoldingArea = true;
    for (Iterator<AbstractFoldingAreaPainter> it = myFoldingAreaPainters.descendingIterator(); it.hasNext();) {
      AbstractFoldingAreaPainter painter = it.next();
      painter.mouseMoved(e);
      if (e.isConsumed()) {
        break;
      }
    }
  }

  private void mouseExitedIconsArea(MouseEvent e) {
    if (!myMouseIsInFoldingArea && myRendererUnderMouse != null && !isInTextArea(e)) {
      setCursor(null);
    }
  }

  private void mouseMovedInIconsArea(MouseEvent e) {
    myMouseIsInFoldingArea = false;
    EditorMessageIconRenderer newRendererUnderMouse = getIconRendererUnderMouse(e);
    if (newRendererUnderMouse != null) {
      setCursor(newRendererUnderMouse.getMouseOverCursor());
    } else if (myRendererUnderMouse != null) {
      setCursor(null);
    }
    myRendererUnderMouse = newRendererUnderMouse;
  }

  private void mouseMovedInTextArea(MouseEvent e) {
    myMouseIsInFoldingArea = false;
    AbstractLeftColumn textColumn = getTextColumnByX(e.getX());
    if (textColumn != null) {
      setCursor(textColumn.getCursor(e));
    } else {
      setCursor(null);
    }
  }

  private boolean isInFoldingArea(MouseEvent e) {
    return isInside(getFoldingAreaOffset(), getFoldingAreaWidth(), e.getX());
  }

  private boolean isInTextArea(MouseEvent e) {
    return isInside(getTextColumnOffset(), myTextColumnWidth, e.getX());
  }

  private EditorMessageIconRenderer getIconRendererUnderMouse(MouseEvent e) {
    final int mouseX = e.getX();
    final int mouseY = e.getY();
    final EditorMessageIconRenderer[] theRenderer = new EditorMessageIconRenderer[]{null};
    myLineToRenderersMap.forEachEntry(new TIntObjectProcedure<List<IconRendererLayoutConstraint>>() {
      @Override
      public boolean execute(int y, List<IconRendererLayoutConstraint> layoutConstraints) {
        if (y <= mouseY && mouseY <= y + myMaxIconHeight) {
          for (IconRendererLayoutConstraint constraint : layoutConstraints) {
            int x = constraint.getX();
            if (y <= mouseY && mouseY <= y + constraint.getIconRenderer().getIcon().getIconHeight() &&
              x <= mouseX && mouseX <= x + constraint.getIconRenderer().getIcon().getIconWidth()) {
              theRenderer[0] = constraint.getIconRenderer();
              return false;
            }
          }
        }
        return true;
      }
    });
    return theRenderer[0];
  }

  private AbstractLeftColumn getTextColumnByX(int x) {
    for (AbstractLeftColumn column : myLeftColumns) {
      int columnX = column.getX();
      if (columnX <= x && columnX + column.getWidth() > x) {
        return column;
      }
    }
    return null;
  }

  private static class BookmarkIconRenderer implements EditorMessageIconRenderer {
    private static final IconRendererType TYPE = new IconRendererType(3);
    private SNode myNode;
    private int myNumber;

    private BookmarkIconRenderer(SNode node, int number) {
      myNode = node;
      myNumber = number;
    }

    @Override
    public Icon getIcon() {
      return BookmarkManager.getIcon(myNumber);
    }

    @Override
    public String getTooltipText() {
      String nodePresentation = ModelAccess.instance().runReadAction(new Computable<String>() {
        @Override
        public String compute() {
          return myNode.getPresentation();
        }
      });
      return (myNumber != -1 ? "Bookmark " + myNumber + " (" : "Bookmark (") + nodePresentation + ")";
    }

    @Override
    public SNode getNode() {
      return myNode;
    }

    public int getNumber() {
      return myNumber;
    }

    @Override
    public IconRendererType getType() {
      return TYPE;
    }

    @Override
    public EditorCell getAnchorCell(EditorCell bigCell) {
      return bigCell;
    }

    @Override
    public Cursor getMouseOverCursor() {
      return myNumber != -1 ? Cursor.getPredefinedCursor(Cursor.HAND_CURSOR) : null;
    }

    @Override
    public AnAction getClickAction() {
      return myNumber != -1 ? ActionManager.getInstance().getAction("jetbrains.mps.ide.actions.GoToBookmark_Action#" + myNumber + "!") : null;
    }

    @Override
    public JPopupMenu getPopupMenu() {
      return null;
    }
  }

  private class IconRendererLayoutConstraintComparator implements Comparator<IconRendererLayoutConstraint> {
    @Override
    public int compare(IconRendererLayoutConstraint constraint1, IconRendererLayoutConstraint constraint2) {
      EditorMessageIconRenderer renderer1 = constraint1.getIconRenderer();
      EditorMessageIconRenderer renderer2 = constraint2.getIconRenderer();
      if (renderer1.getType() != renderer2.getType()) {
        return renderer1.getType().getWeight() - renderer2.getType().getWeight();
      }
      EditorCell anchorCell1 = getAnchorCell(renderer1);
      EditorCell anchorCell2 = getAnchorCell(renderer2);
      // [++] Debugging assertion
      if (anchorCell1 == anchorCell2 && renderer1 instanceof EditorMessage && renderer2 instanceof EditorMessage) {
        EditorMessage editorMessage1 = (EditorMessage) renderer1;
        EditorMessage editorMessage2 = (EditorMessage) renderer2;
        assert false :
          "Two EditorMessages with same type are attached to the same EditorCell: m1 = " +
            editorMessage1 + ", m2 = " + editorMessage2 +
            "; owner1 = " + editorMessage1.getOwner() + ", owner2 = " + editorMessage2.getOwner();
      }
      // [--] Debugging assertion
      if (anchorCell1 != null) {
        if (anchorCell2 == null) {
          return 1;
        } else {
          return anchorCell1.getX() - anchorCell2.getX();
        }
      } else if (anchorCell2 != null) {
        return -1;
      }
      return 0;
    }
  }

  private static class IconRendererLayoutConstraint {
    private EditorMessageIconRenderer myIconRenderer;
    private int myX;

    public IconRendererLayoutConstraint(EditorMessageIconRenderer iconRenderer) {
      myIconRenderer = iconRenderer;
    }

    public void setX(int x) {
      myX = x;
    }

    public int getX() {
      return myX;
    }

    public EditorMessageIconRenderer getIconRenderer() {
      return myIconRenderer;
    }
  }

  private static class LeftEditorHighlighterDataContext implements DataContext {
    private DataContext myEditorDataContext;
    private SNode mySelectedNode;
    private EditorCell myNodeCell;

    public LeftEditorHighlighterDataContext(@NotNull EditorComponent editorComponent, SNode selectedNode) {
      myEditorDataContext = DataManager.getInstance().getDataContext(editorComponent);
      mySelectedNode = selectedNode;
      myNodeCell = editorComponent.findNodeCell(mySelectedNode);
    }

    @Override
    public Object getData(@NonNls String dataId) {
      if (MPSDataKeys.NODE.getName().equals(dataId)) {
        return mySelectedNode;
      }
      if (MPSDataKeys.EDITOR_CELL.getName().equals(dataId)) {
        return myNodeCell;
      }
      return myEditorDataContext.getData(dataId);
    }
  }
}
