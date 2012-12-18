package jetbrains.mps.ide.dataFlow.presentation;

/*Generated by MPS */

import java.awt.Graphics;
import java.awt.Color;

public enum ArrowHeadDirection {
  NONE() {

    public void paint(Graphics g, int x, int y) {
    }

  },
  UP() {

    public void paint(Graphics g, int x, int y) {
      g.setColor(Color.BLACK);
      g.drawLine(x - HALFWIDTH, y + LENGTH, x, y);
      g.drawLine(x + HALFWIDTH, y + LENGTH, x, y);
    }

  },
  DOWN() {

    public void paint(Graphics g, int x, int y) {
      g.setColor(Color.BLACK);
      g.drawLine(x - HALFWIDTH, y - LENGTH, x, y);
      g.drawLine(x + HALFWIDTH, y - LENGTH, x, y);
    }

  },
  LEFT() {

    public void paint(Graphics g, int x, int y) {
      g.setColor(Color.BLACK);
      g.drawLine(x + LENGTH, y + HALFWIDTH, x, y);
      g.drawLine(x + LENGTH, y - HALFWIDTH, x, y);
    }

  },
  RIGHT() {

    public void paint(Graphics g, int x, int y) {
      g.setColor(Color.BLACK);
      g.drawLine(x - LENGTH, y + HALFWIDTH, x, y);
      g.drawLine(x - LENGTH, y - HALFWIDTH, x, y);
    }

  };

  private static final int HALFWIDTH = 3;
  private static final int LENGTH = 5;

  ArrowHeadDirection() {
  }

  public abstract void paint(Graphics g, int x, int y);
}
