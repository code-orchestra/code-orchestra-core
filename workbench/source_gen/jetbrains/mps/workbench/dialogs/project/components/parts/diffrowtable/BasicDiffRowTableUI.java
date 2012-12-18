package jetbrains.mps.workbench.dialogs.project.components.parts.diffrowtable;

/*Generated by MPS */

import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import javax.swing.plaf.basic.BasicTableUI;
import java.awt.Dimension;
import javax.swing.table.TableModel;
import javax.swing.JComponent;
import java.util.Enumeration;
import javax.swing.table.TableColumn;
import java.awt.Graphics;
import java.awt.Rectangle;
import java.awt.Point;
import javax.swing.table.JTableHeader;
import java.awt.Component;
import javax.swing.table.TableCellRenderer;

/*package*/ class BasicDiffRowTableUI extends BasicTableUI {
  public BasicDiffRowTableUI() {
    super();
  }

  @CodeOrchestraPatch
  private Dimension createTableSize(long width) {
    int numCols = table.getColumnCount();
    int numRows = table.getRowCount();
    TableModel tm = table.getModel();
    int[] height = new int[numRows];
    for (int i = 0; i < numCols; i++) {
      for (int j = 0; j < numRows; j++) {
        height[j] = Math.max(height[j], ((DiffRowTable) table).getHeight(tm.getValueAt(j, i), i, j)); // CO-4941
      }
    }
    int totalMarginWidth = table.getColumnModel().getColumnMargin() * numCols;
    long widthWithMargin = width + totalMarginWidth;
    if (widthWithMargin > Integer.MAX_VALUE) {
      widthWithMargin = Integer.MAX_VALUE;
    }
    int totalHeight = 0;
    for (int k = 0; k < numRows; k++) {
      totalHeight += height[k];
    }
    return new Dimension((int) widthWithMargin, totalHeight + numRows * table.getRowMargin());
  }

  public Dimension getMinimumSize(JComponent c) {
    long width = 0;
    Enumeration enumeration = table.getColumnModel().getColumns();
    while (enumeration.hasMoreElements()) {
      TableColumn aColumn = (TableColumn) enumeration.nextElement();
      width = width + aColumn.getMinWidth();
    }
    return createTableSize(width);
  }

  public Dimension getPreferredSize(JComponent c) {
    long width = 0;
    Enumeration enumeration = table.getColumnModel().getColumns();
    while (enumeration.hasMoreElements()) {
      TableColumn aColumn = (TableColumn) enumeration.nextElement();
      width = width + aColumn.getPreferredWidth();
    }
    return createTableSize(width);
  }

  public Dimension getMaximumSize(JComponent c) {
    long width = 0;
    Enumeration enumeration = table.getColumnModel().getColumns();
    while (enumeration.hasMoreElements()) {
      TableColumn aColumn = (TableColumn) enumeration.nextElement();
      width = width + aColumn.getMaxWidth();
    }
    return createTableSize(width);
  }

  public void paint(Graphics g, JComponent c) {
    Rectangle oldClipBounds = g.getClipBounds();
    Rectangle clipBounds = new Rectangle(oldClipBounds);
    int tableWidth = table.getColumnModel().getTotalColumnWidth();
    clipBounds.width = Math.min(clipBounds.width, tableWidth);
    g.setClip(clipBounds);
    paintGrid(g);
    int firstIndex = table.rowAtPoint(new Point(0, clipBounds.y));
    int lastIndex = lastVisibleRow(clipBounds);
    int rowMargin = table.getRowMargin();
    Rectangle rowRect = new Rectangle(0, 0, tableWidth, ((DiffRowTable) table).getRowHeight(firstIndex) + rowMargin);
    rowRect.y = 0;
    for (int i = 0; i < firstIndex; i++) {
      rowRect.y += ((DiffRowTable) table).getRowHeight(i) + rowMargin;
    }
    for (int index = firstIndex; index <= lastIndex; index++) {
      if (rowRect.intersects(clipBounds)) {
        paintRow(g, index);
      }
      rowRect.y += ((DiffRowTable) table).getRowHeight(index) + rowMargin;
    }
    g.setClip(oldClipBounds);
  }

  private void paintGrid(Graphics g) {
    g.setColor(table.getGridColor());
    if (table.getShowHorizontalLines()) {
      paintHorizontalLines(g);
    }
    if (table.getShowVerticalLines()) {
      paintVerticalLines(g);
    }
  }

  private void paintHorizontalLines(Graphics g) {
    Rectangle r = g.getClipBounds();
    Rectangle rect = r;
    int firstIndex = table.rowAtPoint(new Point(0, r.y));
    int lastIndex = lastVisibleRow(r);
    int rowMargin = table.getRowMargin();
    int y = -rowMargin;
    for (int i = 0; i < firstIndex; i++) {
      y += ((DiffRowTable) table).getRowHeight(i) + rowMargin;
    }
    for (int index = firstIndex; index <= lastIndex; index++) {
      y += ((DiffRowTable) table).getRowHeight(index) + rowMargin;
      if ((y >= rect.y) && (y <= (rect.y + rect.height))) {
        g.drawLine(rect.x, y, rect.x + rect.width - 1, y);
      }
    }
  }

  private void paintVerticalLines(Graphics g) {
    Rectangle rect = g.getClipBounds();
    int x = 0;
    int count = table.getColumnCount();
    int horizontalSpacing = table.getIntercellSpacing().width;
    for (int index = 0; index <= count; index++) {
      if ((x > 0) && (((x - 1) >= rect.x) && ((x - 1) <= (rect.x + rect.width)))) {
        g.drawLine(x - 1, rect.y, x - 1, rect.y + rect.height - 1);
      }
      if (index < count) {
        x += ((TableColumn) table.getColumnModel().getColumn(index)).getWidth() + horizontalSpacing;
      }
    }
  }

  private void paintRow(Graphics g, int row) {
    Rectangle rect = g.getClipBounds();
    int column = 0;
    boolean drawn = false;
    int draggedColumnIndex = -1;
    Rectangle draggedCellRect = null;
    Dimension spacing = table.getIntercellSpacing();
    JTableHeader header = table.getTableHeader();
    Rectangle cellRect = new Rectangle();
    cellRect.height = ((DiffRowTable) table).getRowHeight(row) + spacing.height;
    cellRect.y = 0;
    for (int i = 0; i < row; i++) {
      cellRect.y += ((DiffRowTable) table).getRowHeight(i) + spacing.height;
    }
    Enumeration enumeration = table.getColumnModel().getColumns();
    while (enumeration.hasMoreElements()) {
      TableColumn aColumn = (TableColumn) enumeration.nextElement();
      cellRect.width = aColumn.getWidth() + spacing.width;
      if (cellRect.intersects(rect)) {
        drawn = true;
        if ((header == null) || (aColumn != header.getDraggedColumn())) {
          paintCell(g, cellRect, row, column);
        } else {
          g.setColor(table.getParent().getBackground());
          g.fillRect(cellRect.x, cellRect.y, cellRect.width, cellRect.height);
          draggedCellRect = new Rectangle(cellRect);
          draggedColumnIndex = column;
        }
      } else {
        if (drawn) {
          break;
        }
      }
      cellRect.x += cellRect.width;
      column++;
    }
    if (draggedColumnIndex != -1 && draggedCellRect != null) {
      draggedCellRect.x += header.getDraggedDistance();
      g.setColor(table.getBackground());
      g.fillRect(draggedCellRect.x, draggedCellRect.y, draggedCellRect.width, draggedCellRect.height);
      g.setColor(table.getGridColor());
      int x1 = draggedCellRect.x;
      int y1 = draggedCellRect.y;
      int x2 = x1 + draggedCellRect.width - 1;
      int y2 = y1 + draggedCellRect.height - 1;
      if (table.getShowVerticalLines()) {
        g.drawLine(x2, y1, x2, y2);
      }
      if (table.getShowHorizontalLines()) {
        g.drawLine(x1, y2, x2, y2);
      }
      paintCell(g, draggedCellRect, row, draggedColumnIndex);
    }
  }

  private void paintCell(Graphics g, Rectangle cellRect, int row, int column) {
    int spacingHeight = table.getRowMargin();
    int spacingWidth = table.getColumnModel().getColumnMargin();
    cellRect.setBounds(cellRect.x + spacingWidth / 2, cellRect.y + spacingHeight / 2, cellRect.width - spacingWidth, cellRect.height - spacingHeight);
    if (table.isEditing() && table.getEditingRow() == row && table.getEditingColumn() == column) {
      Component component = table.getEditorComponent();
      component.setBounds(cellRect);
      component.validate();
    } else {
      TableCellRenderer renderer = table.getCellRenderer(row, column);
      Component component = table.prepareRenderer(renderer, row, column);
      if (component.getParent() == null) {
        rendererPane.add(component);
      }
      rendererPane.paintComponent(g, component, table, cellRect.x, cellRect.y, cellRect.width, cellRect.height, true);
    }
    cellRect.setBounds(cellRect.x - spacingWidth / 2, cellRect.y - spacingHeight / 2, cellRect.width + spacingWidth, cellRect.height + spacingHeight);
  }

  private int lastVisibleRow(Rectangle clip) {
    int lastIndex = table.rowAtPoint(new Point(0, clip.y + clip.height - 1));
    if (lastIndex == -1) {
      lastIndex = table.getRowCount() - 1;
    }
    return lastIndex;
  }
}
